import os
import traceback
import unicodedata
import xml.etree.ElementTree as etree

from defcon import Glyph, Guideline
from fontTools import agl, ttLib
from fontTools.pens.pointPen import SegmentToPointPen
from fontTools.svgLib import SVGPath
from fontTools.ufoLib import UFOLibError


class SVGGlyph:
    def __init__(self, svg_file_path):
        self.svg_file_path = svg_file_path
        self.svg_width = 0.0
        self.svg_height = 0.0
        self.name = ""
        self.unicode = None
        self.glyph_name = ""
        self.glyph_width = 0
        self.glyph_height = 1024
        self.glif = None
        self.transform = '1 0 0 -1 0 0'

    @staticmethod
    def svg2glif(svg_file, name, width=0, height=0, unicodes=None, transform=None,
                 version=3, anchors=None):
        """ Convert an SVG outline to a UFO glyph with given 'name', advance
        'width' and 'height' (int), and 'unicodes' (list of int).
        Return the resulting string in GLIF format (default: version 2).
        If 'transform' is provided, apply a transformation matrix before the
        conversion (must be tuple of 6 floats, or a FontTools Transform object).
        """
        glyph = Glyph()
        glyph.name = name
        glyph.width = width
        glyph.height = height
        glyph.unicodes = unicodes or []
        glyph.anchors = anchors or []
        svg = SVGPath(svg_file, transform)
        pen = glyph.getPen()
        svg.draw(pen)
        return glyph

    @staticmethod
    def transform_list(arg):
        try:
            return [float(n) for n in arg.split()]
        except ValueError:
            msg = "Invalid transformation matrix: %r" % arg
            raise ValueError(msg)

    def parse(self):
        svgObj = etree.parse(self.svg_file_path).getroot()
        self.svg_width = float(svgObj.attrib['width'].replace("px", " "))
        self.svg_height = float(svgObj.attrib['height'].replace("px", " "))
        self.name = os.path.splitext(os.path.basename(self.svg_file_path))[0]
        self.unicode = None
        if len(self.name) == 1:
            self.unicode = [ord(self.name)]
        elif self.name in agl.AGL2UV:
            self.unicode = [agl.AGL2UV.get(self.name)]
        self.glyph_name = SVGGlyph.get_glyph_name(self.name)
        if not self.glyph_name:
            raise UFOLibError(
                f"Could not calculate glyph name for {self.svg_file_path}")

        prefix_map = {"sodipodi": "http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd",
                      "inkscape": "http://www.inkscape.org/namespaces/inkscape"}
        widthGuide = svgObj.find(
            ".//sodipodi:guide/[@inkscape:label='width']", prefix_map)
        width = self.svg_width
        if widthGuide != None:
            width = int(float(widthGuide.attrib['position'].split(',')[0]))

        # + int(svg_config['left']) + int(svg_config['right'])
        self.glyph_width = width
        if self.glyph_width < 0:
            raise UFOLibError("Glyph %s has negative width." % self.name)

        # Calculate the transformation to do
        transform = SVGGlyph.transform_list(self.transform)

        baseGuide = svgObj.find(
            ".//sodipodi:guide/[@inkscape:label='base']", prefix_map)
        base = 0
        if baseGuide != None:
            base = int(float(baseGuide.attrib['position'].split(',')[1])) * -1
        transform[5] += self.svg_height + base  # Y offset
        anchorEls = svgObj.findall(
            '{http://www.w3.org/2000/svg}text', prefix_map)
        anchors = []
        try:
            for anchorEl in anchorEls:
                anchors.append({
                    "x": float(anchorEl.attrib["x"]),
                    "y": self.svg_height + base - float(anchorEl.attrib["y"]),
                    "name": anchorEl.attrib["{http://www.inkscape.org/namespaces/inkscape}label"]
                })
        except:
            pass
        try:
            self.glif = SVGGlyph.svg2glif(self.svg_file_path,
                                          name=self.glyph_name,
                                          width=self.glyph_width,
                                          height=self.glyph_height,
                                          unicodes=self.unicode,
                                          transform=transform,
                                          anchors=anchors,
                                          version=3)
        except Exception:
            print(f"Error while processing {self.__dict__}")
            traceback.print_exc()


    @staticmethod
    def name_from_uc(char):
        return unicodedata.name(char).replace('MALAYALAM', '').replace('LETTER', '').replace('VOWEL', '').lower().strip().replace(' ', '_', -1)

    @staticmethod
    def get_glyph_name(name: str, prefix="ml_") -> str:
        name_parts = name.split('_')
        name = name_parts[0]
        if len(name_parts) > 1:
            ext = '_'+'_'.join(name_parts[1:])
        else:
            ext = ''
        codepoint = ord(name[0])
        if codepoint == 8205:
            return 'zwj'
        if codepoint >= 3328 and codepoint <= 3455:
            if len(name) > 1:
                chillu_normalize_map = {
                    "ന്\u200d": 'ൻ',
                    "ര്\u200d": "ർ",
                    "ല്\u200d": "ൽ",
                    "ള്\u200d": "ൾ",
                    "ണ്\u200d": "ൺ",
                    "ഴ്\u200d": "ൖ",
                    "ക്\u200d": "ൿ",
                }
                name = chillu_normalize_map.get(name, name)
                return prefix + "_".join(SVGGlyph.name_from_uc(c) for c in name)+ext
            else:
                return prefix + SVGGlyph.name_from_uc(name)+ext

        if len(name) == 1:
            return agl.UV2AGL.get(ord(name), f"uni{hex(codepoint).replace('0x','').upper()}")+ext
        return agl.UV2AGL.get(name, name)+ext
