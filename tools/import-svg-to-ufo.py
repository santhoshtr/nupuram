#!/usr/bin/env python
"""
Convert SVG paths to UFO glyphs and that to a UFO font
Author: Santhosh Thottingal <santhosh.thottingal@gmail.com>
Copyright 2021, MIT License
"""

from __future__ import absolute_import, print_function

__requires__ = ["FontTools"]

import argparse
import traceback
import os
import re
import xml.etree.ElementTree as etree
from io import open

from fontTools.misc.py23 import SimpleNamespace
from fontTools.pens.pointPen import SegmentToPointPen
from fontTools.svgLib import SVGPath
from fontTools.ufoLib import UFOLibError, UFOReader, UFOWriter
from fontTools.ufoLib.glifLib import writeGlyphToString
from fontTools.ufoLib.plistlib import load, dump
from defcon import Font

class InfoObject(object):
    pass


def parseSvg(path):
    return etree.parse(path).getroot()

def getConfig(configFile):
    import yaml
    cfg = yaml.load(configFile, Loader=yaml.FullLoader)
    return cfg


def split(arg):
    return arg.replace(",", " ").split()


def svg2glif(svg_file, name, width=0, height=0, unicodes=None, transform=None,
             version=2, anchors=None):
    """ Convert an SVG outline to a UFO glyph with given 'name', advance
    'width' and 'height' (int), and 'unicodes' (list of int).
    Return the resulting string in GLIF format (default: version 2).
    If 'transform' is provided, apply a transformation matrix before the
    conversion (must be tuple of 6 floats, or a FontTools Transform object).
    """
    glyph = SimpleNamespace(width=width, height=height, unicodes=unicodes, anchors=anchors)
    outline = SVGPath(svg_file, transform)

    # writeGlyphToString takes a callable (usually a glyph's drawPoints
    # method) that accepts a PointPen, however SVGPath currently only has
    # a draw method that accepts a segment pen. We need to wrap the call
    # with a converter pen.
    def drawPoints(pointPen):
        pen = SegmentToPointPen(pointPen)
        outline.draw(pen)

    return writeGlyphToString(name,
                              glyphObject=glyph,
                              drawPointsFunc=drawPoints,
                              formatVersion=version)


def transform_list(arg):
    try:
        return [float(n) for n in split(arg)]
    except ValueError:
        msg = "Invalid transformation matrix: %r" % arg
        raise argparse.ArgumentTypeError(msg)

def parse_args():
    parser = argparse.ArgumentParser(
        description="Convert SVG outlines to UFO glyphs (.glif)")
    parser.add_argument(
        "-c", "--config", help="The yaml configuration file containing the svg "
        "to glif mapping", type=argparse.FileType('r'), default="sources/svg-glif-mapping.yaml")
    parser.add_argument(
        "-i", "--infiles", nargs='+', help="Input SVG file containing "
        '<path> elements with "d" attributes.')
    return parser.parse_args()


def main(config, svg_file):
    # Parse SVG to read the width, height attributes defined in it
    svgObj = parseSvg(svg_file)
    svgWidth = float(svgObj.attrib['width'].replace("px", " "))
    height = float(svgObj.attrib['height'].replace("px", " "))
    name = os.path.splitext(os.path.basename(svg_file))[0]
    ufo_font_path = config['font']['ufo']
    # Get the font metadata from UFO
    reader = UFOReader(ufo_font_path)
    writer = UFOWriter(ufo_font_path)

    infoObject = InfoObject()
    reader.readInfo(infoObject)
    fontName =  config['font']['name']

    # Get the configuration for this svg
    try:
        svg_config = config['svgs'][name]
    except KeyError:
        print("\033[93mSkip: Configuration not found for svg : %r\033[0m" % name)
        return

    unicodeVal = None
    if len(name) == 1:
        unicodeVal=[ord(name)]
    elif 'unicode' in svg_config:
        unicodeVal =  [int(svg_config['unicode'], 16)]

    prefix_map = {"sodipodi": "http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd", "inkscape": "http://www.inkscape.org/namespaces/inkscape"}
    widthGuide = svgObj.find(".//sodipodi:guide/[@inkscape:label='width']", prefix_map)
    width = svgWidth
    if widthGuide != None:
        width = int(float(widthGuide.attrib['position'].split(',')[0]))
    elif 'width' in svg_config:
        width = int(svg_config['width'])

    glyphWidth = width  # + int(svg_config['left']) + int(svg_config['right'])
    if glyphWidth < 0 :
        raise UFOLibError("Glyph %s has negative width." % name)

    contentsPlistPath = ufo_font_path + '/glyphs/contents.plist'
    try:
        with open(contentsPlistPath, "rb") as f:
            contentsPlist = load(f)
    except:
        raise UFOLibError("The file %s could not be read." % contentsPlistPath)

    glyph_name = name
    if 'glyph_name' in svg_config:
        glyph_name = svg_config['glyph_name']

    # Replace all capital letters with a following '_' to avoid file name clash in Windows
    glyph_file_name = re.sub(r'([A-Z]){1}', lambda pat: pat.group(1) + '_', glyph_name) + '.glif'
    if glyph_name in contentsPlist:
        existing_glyph = True
    else:
        existing_glyph = False

    # Calculate the transformation to do
    transform = transform_list(config['font']['transform'])

    baseGuide = svgObj.find(".//sodipodi:guide/[@inkscape:label='base']", prefix_map)
    base = 0
    if baseGuide != None:
        base = int(float(baseGuide.attrib['position'].split(',')[1])) * -1
    elif 'base' in svg_config:
        base=int(svg_config['base'])
    if 'left' in svg_config:
        transform[4] += int(svg_config['left'])  # X offset = left bearing
    else:
        transform[4] += 0
    transform[5] += height + base # Y offset

    anchorEls = svgObj.findall('{http://www.w3.org/2000/svg}text', prefix_map)
    anchors = []
    try:
        for anchorEl in anchorEls:
            anchors.append({
                "x": float(anchorEl.attrib["x"]),
                "y": height + base - float(anchorEl.attrib["y"]),
                "name": anchorEl.attrib["{http://www.inkscape.org/namespaces/inkscape}label"]
            })
    except:
        pass

    glif = svg2glif(svg_file,
                    name=glyph_name,
                    width=glyphWidth,
                    height=getattr(infoObject, 'unitsPerEm'),
                    unicodes=unicodeVal,
                    transform=transform,
                    anchors=anchors,
                    version=config['font']['version'])

    output_file = ufo_font_path + '/glyphs/' + glyph_file_name

    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(glif)

    print("\033[94m[%s]\033[0m \033[92mConvert\033[0m %s -> %s \033[92m✔️\033[0m" %
          (fontName, name, output_file))

    # If this is a new glyph, add it to the UFO/glyphs/contents.plist
    if not existing_glyph:
        contentsPlist[glyph_name] = glyph_file_name
        dump(contentsPlist, open(contentsPlistPath, "wb"))
        print("\033[94m[%s]\033[0m \033[92mAdd\033[0m %s -> %s \033[92m✔️\033[0m" %
              (fontName, glyph_name, glyph_file_name))
        lib_obj = reader.readLib()
        lib_obj['public.glyphOrder'].append(glyph_name)
        writer.writeLib(lib_obj)

if __name__ == "__main__":
    options = parse_args()
    config = getConfig(options.config)
    for svg_file in options.infiles:
        try:
            main(config, svg_file)
        except Exception:
            print("Error while processing %s" % svg_file )
            traceback.print_exc()