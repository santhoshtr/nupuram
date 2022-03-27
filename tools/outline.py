import yaml
import re
import os
import subprocess
import sys
from munch import DefaultMunch
import xml.etree.ElementTree as etree

marker_fill = "#1a5fb4"
text_nodes={}

class Style:
    def __init__(self, style):
        self.style = style
        self.style_dict = {}
        if self.style:
            self.parse()

    def parse(self):
        style_defs = self.style.split(';')
        for style_def in style_defs:
            self.style_dict[style_def.split(":")[0]] = style_def.split(":")[1]

    def set(self, key, value):
        self.style_dict[key] = value

    def get(self, key, default_value=""):
        if key in self.style_dict:
            return self.style_dict
        else:
            return default_value

    def remove(self, key):
        if key in self.style_dict:
            del self.style_dict[key]

    def toString(self):
        return ";".join([f"{key}:{self.style_dict.get(key)}" for key in self.style_dict])

    def __repr__(self):
        return self.toString()


def preprocess(source_svg_name, output_svg_name):
    tree = etree.parse(source_svg_name)
    namespaces = dict([node for _, node in etree.iterparse(
        source_svg_name, events=['start-ns'])])
    for ns in namespaces:
        etree.register_namespace(ns, namespaces[ns])

    for path in tree.getroot().findall('.//{http://www.w3.org/2000/svg}path'):
        style = Style(path.get('style'))
        style.set('stroke', "#000000")
        style.set('fill', marker_fill)
        style.set('stroke-width', "60px")
        style.set('stroke-linecap', 'round')
        style.set('stroke-linejoin', 'round')
        style.set('paint-order', "fill stroke markers")
        path.set('style', str(style))

    text_nodes[output_svg_name] = tree.getroot().findall('.//{http://www.w3.org/2000/svg}text')
    tree.write(output_svg_name, encoding="UTF-8")


def get_outline_command(output_svg_name):
    command = f"file-open:{output_svg_name};select-all;object-stroke-to-path;export-filename:{output_svg_name};export-do;"
    return command


def postprocess(output_svg_name):
    tree = etree.parse(output_svg_name)
    namespaces = dict([node for _, node in etree.iterparse(
        output_svg_name, events=['start-ns'])])
    for ns in namespaces:
        etree.register_namespace(ns, namespaces[ns])

    groups = tree.getroot().findall(
        './/{http://www.w3.org/2000/svg}g', namespaces)
    for group in groups:
        if group.get('aria-label') == "✛":
            try:
                tree.getroot().remove(group)
            except:
                print(f"Error while removing group for {output_svg_name}")
                pass
            continue
        path_index = 0
        for path in group.findall('{http://www.w3.org/2000/svg}path', namespaces):
            style = Style(path.get('style'))
            fill = style.get('fill')
            if path_index == 0:
                group.remove(path)
            else:
                style.set('fill', marker_fill)
                style.set('fill-rule', "nonzero")
                path.set('style', str(style))
            path_index += 1

    for text in text_nodes[output_svg_name]:
        tree.getroot().insert(0, text)
    tree.write(output_svg_name, encoding="UTF-8")


if __name__ == "__main__":
    config = DefaultMunch.fromDict(
        yaml.load(open('config.yaml'), Loader=yaml.FullLoader))
    src_dir = config.designs.regular.source
    out_dir = config.designs.outline.source
    os.makedirs(out_dir, exist_ok=True)
    commands = []
    for f in os.listdir(src_dir):
        if not f.endswith(".svg"):
            continue
        print(f"{os.path.join(src_dir, f)}-> {os.path.join(out_dir, f)}")
        preprocess(os.path.join(src_dir, f), os.path.join(out_dir, f))
        commands.append(get_outline_command(os.path.join(out_dir, f)))

    command = '\n'.join(commands)
    cat = subprocess.Popen(
        f"echo \"{command}\"", stdout=subprocess.PIPE, shell=True)
    process = subprocess.Popen(
        "inkscape --shell", stdin=cat.stdout, shell=True)
    process.wait()

    for f in os.listdir(out_dir):
        if not f.endswith(".svg"):
            continue
        postprocess(os.path.join(out_dir, f))
