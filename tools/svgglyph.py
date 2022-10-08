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
        self.alt = None
        self.unicode = None
        self.glyph_name = ""
        self.glyph_width = 0
        self.glyph_height = 1024
        self.glif = None
        self.transform = '1 0 0 -1 0 0'
        # Fill missing AGL2UV, UV2AGL values in agl
        agl.AGL2UV['onesuperior'] = 0x00B9
        agl.AGL2UV['twosuperior'] = 0x00B2
        agl.AGL2UV['threesuperior'] = 0x00B3
        agl.AGL2UV['foursuperior'] = 0x2074
        agl.AGL2UV['quotedblbasereversed'] = 0x2E42
        agl.AGL2UV['Acaron'] = 0x01CD
        agl.AGL2UV['acaron'] = 0x01CE
        agl.AGL2UV['Lcedilla'] = 0x013B
        agl.AGL2UV['lcedilla'] = 0x013C
        agl.AGL2UV['Kcedilla'] = 0x0136
        agl.AGL2UV['kcedilla'] = 0x0137
        agl.AGL2UV['Ncedilla'] = 0x0145
        agl.AGL2UV['Gcedilla'] = 0x0122
        agl.AGL2UV['gcedilla'] = 0x0123
        agl.AGL2UV['ncedilla'] = 0x0146
        agl.AGL2UV['Rcedilla'] = 0x0156
        agl.AGL2UV['rcedilla'] = 0x0157
        agl.AGL2UV['ringcmb'] = 0x030A
        agl.AGL2UV['tildecmb'] = 0x0303
        agl.AGL2UV['hungarumlautcmb'] = 0x030B
        agl.AGL2UV['cedillacmb'] = 0x0327
        agl.AGL2UV['acutecmb'] = 0x0301
        agl.AGL2UV['ogonekcmb'] = 0x0328
        agl.AGL2UV['dieresiscmb'] = 0x0308
        agl.AGL2UV['dotaccentcmb'] = 0x0307
        agl.AGL2UV['circumflexcmb'] = 0x0302
        agl.AGL2UV['commaturnedabovecmb'] = 0x0312
        agl.AGL2UV['caroncmb'] = 0x030C
        agl.AGL2UV['brevecmb'] = 0x0306
        agl.AGL2UV['macroncmb'] = 0x0304
        agl.AGL2UV['gravecmb'] = 0x0300
        agl.AGL2UV['commaturnedmod'] = 0x02BB
        agl.AGL2UV['commaaccent'] = 0x0326
        agl.UV2AGL[0x0326] = 'commaaccent'
        agl.UV2AGL[0x0328] = 'ogonekcmb'
        agl.AGL2UV['scommaaccent'] = 0x0219
        agl.AGL2UV['Scommaaccent'] = 0x0218
        agl.AGL2UV['Tcommaaccent'] = 0x021A
        agl.AGL2UV['tcommaaccent'] = 0x021B
        agl.AGL2UV['dotlessj'] = 0x0237
        agl.AGL2UV['notdef'] = 0

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
        parent_map = {c: p for p in svgObj.iter() for c in p}
        self.svg_width = float(svgObj.get('width', '1024').replace("px", " "))
        self.svg_height = float(svgObj.get(
            'height', '1024').replace("px", " "))
        # Filename without extension
        filename = os.path.splitext(os.path.basename(self.svg_file_path))[0]
        self.name = filename.split(".")[0]
        self.alt = None
        if len(filename.split(".")) > 1:
            self.alt = filename.split(".")[1]
        self.unicode = None
        if len(self.name) == 1:
            self.unicode = [ord(self.name)]
        elif self.name in agl.AGL2UV:
            self.unicode = [agl.AGL2UV.get(self.name)]

        if self.alt:
            # Alternate glyphs does not require unicode.
            self.unicode = None
        self.glyph_name = SVGGlyph.get_glyph_name(self.name)
        if not self.glyph_name:
            raise UFOLibError(
                f"Could not calculate glyph name for {self.name}")

        prefix_map = {"sodipodi": "http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd",
                      "inkscape": "http://www.inkscape.org/namespaces/inkscape"}
        widthGuide = svgObj.find(
            ".//sodipodi:guide/[@inkscape:label='width']", prefix_map)

        width = self.svg_width
        if widthGuide != None:
            width = int(float(widthGuide.get('position').split(',')[0]))

        # + int(svg_config['left']) + int(svg_config['right'])
        self.glyph_width = width
        if self.glyph_width < 0:
            raise UFOLibError("Glyph %s has negative width." % self.name)

        # Calculate the transformation to do
        transform = SVGGlyph.transform_list(self.transform)

        baseGuide = svgObj.find(
            ".//sodipodi:guide/[@inkscape:label='base']", prefix_map)
        base = -200
        if baseGuide != None:
            base = int(float(baseGuide.get('position').split(',')[1])) * -1
        transform[5] += self.svg_height + base  # Y offset
        anchorEls = svgObj.findall(
            './/{http://www.w3.org/2000/svg}text', prefix_map)
        anchors = []

        vc_guide = svgObj.find(
            ".//sodipodi:guide/[@inkscape:label='vc']", prefix_map)
        if vc_guide != None:
            anchors.append({
                "x": float(vc_guide.get('position').split(',')[0]),
                "y": 0,
                "name": "vc"
            })

        anchor_names=[]
        try:
            for anchorEl in anchorEls:
                x=0
                y=0
                name=""
                parentEl = parent_map.get(anchorEl)
                if parentEl and "transform" in parentEl.attrib:
                    transformstr = parentEl.get("transform")
                    if "translate" in transformstr:
                        [x, y] = transformstr.strip().replace("translate(","").replace(")","").split(" ")
                    if "matrix" in transformstr:
                        [lhs, y] = transformstr.strip().replace("matrix(","").replace(")","").split(" ")
                        x = lhs.split(",")[-1]
                    x = float(x)
                    y = float(y)
                if 'x' in anchorEl.attrib:
                    x = float(anchorEl.get("x"))
                if 'y' in anchorEl.attrib:
                    y = float(anchorEl.get("y"))
                if "{http://www.inkscape.org/namespaces/inkscape}label" in anchorEl.attrib:
                    name = anchorEl.attrib["{http://www.inkscape.org/namespaces/inkscape}label"]
                else:
                    name = anchorEl.text

                anchor={
                    "x": x,
                    "y": self.svg_height + base - y,
                    "name": name
                }
                # print(anchor)
                anchor_names.append(name)

                if name=='vc':
                    anchor['y']=0
                anchors.append(anchor)
        except:
            print(f"Error while processing {self.__dict__}")
            traceback.print_exc()
            pass
        if "right" not in anchor_names:
             anchors.append({
                "x": self.glyph_width,
                "y": 0,
                "name": "right"
            })
        try:
            glif_name = self.glyph_name
            if self.alt:
                glif_name = self.glyph_name + "." + self.alt
            self.glif = SVGGlyph.svg2glif(self.svg_file_path,
                                          name=glif_name,
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
        return unicodedata.name(char).replace('MALAYALAM SIGN', '').replace('MALAYALAM', '').replace('LETTER', '').replace('VOWEL', '').lower().strip().replace(' ', '_', -1).replace('-', '_')

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
        if name == 'notdef':
            return '.notdef'
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
