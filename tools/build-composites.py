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

def unicode_hex_list(arg):
    try:
        return [int(unihex, 16) for unihex in split(arg)]
    except ValueError:
        msg = "Invalid unicode hexadecimal value: %r" % arg
        raise argparse.ArgumentTypeError(msg)

def buildComposite(font, glyph_name, glyph):
    font.newGlyph(glyph_name)
    composite = font[glyph_name]
    if "unicode" in glyph:
        composite.unicode = int(glyph["unicode"], 16)
    composition=glyph["compose"]
    items = composition.split("+")
    base = items[0]
    items = items[1:]

    component = composite.instantiateComponent()
    component.baseGlyph = base
    baseGlyph = font[base]
    composite.width = baseGlyph.width
    composite.appendComponent(component)

    for item in items:
        baseName, anchorName = item.split("@")
        component = composite.instantiateComponent()
        component.baseGlyph = baseName
        anchor = _anchor = None
        for a in baseGlyph.anchors:
            if a["name"] == anchorName:
                anchor = a
        for a in font[baseName].anchors:
            if a["name"] == anchorName:
                _anchor = a
        if anchor and _anchor:
            x = anchor["x"] - _anchor["x"]
            y = anchor["y"] - _anchor["y"]
            component.move((x, y))
        composite.appendComponent(component)
        composite.lib['public.markColor'] = '0.73, 0.87, 0.98, 0.5' # grey

def main(config):
    ufo_font_path = config['font']['ufo']
    font = Font(ufo_font_path)
    for glyph_name in config['svgs']:
        glyph = config['svgs'][glyph_name]
        if 'compose' in glyph:
            try:
                buildComposite(font, glyph_name, glyph)
                print("Compose\033[0m %s -> %s \033[92m✔️\033[0m" %
          (glyph["compose"], glyph_name))
            except Exception:
                print("Error while building composites %s" % glyph_name )
                traceback.print_exc()
    font.save(ufo_font_path)

if __name__ == "__main__":
    options = parse_args()
    config = getConfig(options.config)
    main(config)