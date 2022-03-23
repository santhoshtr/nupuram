
import re
import os
from svgpathtools import svg2paths2, wsvg
import subprocess
from string import Template
import sys

source_svg_name = sys.argv[1]
output_svg_name = sys.argv[2]

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

wsvg(paths, attributes=attributes,
     svg_attributes=svg_attributes, filename=output_svg_name)

# Execute
# inkscape -g --actions "select-all;StrokeToPath;FileSave;FileQuit" step1.svg
context = {
    'inkscape': 'inkscape',
    'actions': ';'.join(['select-all', 'StrokeToPath', 'FileSave', 'FileQuit']),
    'filename':  output_svg_name
}
command = Template(
    '${inkscape} -g --actions "${actions}" ${filename}').safe_substitute(**context)
print(f"{command}")
process = subprocess.Popen(command, shell=True)
process.wait()

paths, attributes, svg_attributes = svg2paths2(output_svg_name)
path_index = 0
output_paths = []
output_attrs = []
for path in paths:
    path_attrs = attributes[path_index]
    path_index += 1
    if "241f31ff" in path_attrs['style']:
       continue
    output_paths.append(path)
    output_attrs.append(path_attrs)

wsvg(output_paths, attributes=output_attrs,
     svg_attributes=svg_attributes, filename=output_svg_name)
