import yaml
import re
import os
from svgpathtools import svg2paths2, wsvg
import subprocess
from string import Template
import sys
from munch import DefaultMunch

def outline(source_svg_name, output_svg_name):
    path_index = 0
    paths, attributes, svg_attributes = svg2paths2(source_svg_name)
    for path in paths:
        path_attrs = attributes[path_index]
        style_attr = ""
        if 'style' in path_attrs:
            style_attr = path_attrs['style']
        style_defs = style_attr.split(';')
        style = {}
        for style_def in style_defs:
            style[style_def.split(":")[0]] = style_def.split(":")[1]
        style['stroke-width'] = "60px"
        style['stroke'] = "#000000"
        style['fill'] = "#241f31ff"
        style_attr = ";".join([f"{key}:{style[key]}" for key in style])
        path_attrs['style'] = style_attr
        attributes[path_index] = path_attrs
        path_index += 1
    if os.path.exists(output_svg_name):
        os.remove(output_svg_name)
    wsvg(paths, attributes=attributes,
        svg_attributes=svg_attributes, filename=output_svg_name)

    # Execute
    # inkscape -g --actions "select-all;StrokeToPath;FileSave;FileQuit" step1.svg
    command = f"file-open:{output_svg_name};select-all;object-stroke-to-path;export-filename:{output_svg_name};export-do;"
    print(f"{command}")
    cat = subprocess.Popen(f"echo \"{command}\"", stdout=subprocess.PIPE, shell=True)
    process = subprocess.Popen("inkscape --shell", stdin=cat.stdout, shell=True)
    process.wait()

    paths, attributes, svg_attributes = svg2paths2(output_svg_name)
    wsvg(paths[1:], attributes=attributes[1:],
        svg_attributes=svg_attributes, filename=output_svg_name)

if __name__ == "__main__":
    source_dir = sys.argv[1]
    outline_dir = sys.argv[2]
    os.makedirs(outline_dir, exist_ok=True)
    for f in os.listdir(source_dir):
        if not f.endswith(".svg"):
            continue
        print(f"{os.path.join(source_dir, f)}-> {os.path.join(outline_dir, f)}")
        outline(os.path.join(source_dir, f), os.path.join(outline_dir, f))