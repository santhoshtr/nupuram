
import re
import os
from svgpathtools import svg2paths2, wsvg
import subprocess
from string import Template
import sys

source_svg_name = sys.argv[1]
output_svg = ""
# FIXME. Do this with svg2paths?
with open(source_svg_name) as svg_f:
    for line in svg_f:
        matches = re.match(r"(.*)(stroke:)([0-9a-z]+);(.*)", line)
        if matches:
            line = line.replace(matches.group(3), "#000000")
        matches = re.match(r"(.*)(stroke-width:)([0-9.]+)px;(.*)", line)
        if matches:
            line = line.replace(matches.group(3), "60")
        matches = re.match(r"(\s?)(id=)([0-9a-z\"]+)(\s?)", line)
        if matches:
            line = line.replace(matches.group(3), "\"svgglif\"")
        output_svg += line
svg_f.close()

temp_svg_name = source_svg_name.replace(".svg", ".temp.svg")
with open(temp_svg_name, 'w') as f:
    f.write(output_svg)
f.close()

# Execute
# inkscape -g --actions "select-all;StrokeToPath;FileSave;FileQuit" step1.svg
context = {
    'inkscape': 'inkscape',
    'actions': ';'.join(['select-all', 'StrokeToPath', 'FileSave', 'FileQuit']),
    'filename':  temp_svg_name
}
command = Template(
    '${inkscape} -g --actions "${actions}" ${filename}').safe_substitute(**context)
print(f"{command}")
process = subprocess.Popen(command, shell=True)
process.wait()

paths, attributes, svg_attributes = svg2paths2(temp_svg_name)
path_index = 0
output_paths = []
output_attrs = []
for path in paths:
    path_attrs = attributes[path_index]
    style = path_attrs['style']
    if "fill:#000000;" in style:
        output_paths.append(path)
        output_attrs.append(path_attrs)
    path_index += 1

os.remove(temp_svg_name)
output_svg_name = source_svg_name.replace(".svg", ".outline.svg")
wsvg(output_paths, attributes=output_attrs,
     svg_attributes=svg_attributes, filename=output_svg_name)
