
from __future__ import absolute_import, print_function
from ast import List
from cgitb import Hook
from functools import cache
from importlib.abc import PathEntryFinder
from munch import DefaultMunch

__requires__ = ["FontTools"]

import argparse
import logging
import os
import re
import sys
import yaml
import traceback
import xml.etree.ElementTree as etree
from io import open
from datetime import datetime

from defcon import Font, Glyph, Info
import ufo2ft
from fontFeatures import Chaining, FontFeatures, Routine, Substitution
from fontTools import agl, ttLib
from fontTools.misc.py23 import SimpleNamespace
from fontTools.pens.pointPen import SegmentToPointPen
from fontTools.svgLib import SVGPath
from fontTools.ufoLib import UFOLibError, UFOReader, UFOWriter
from fontTools.ufoLib.glifLib import writeGlyphToString
from fontTools.ufoLib.plistlib import dump, load
from ufo2ft.util import _LazyFontName
log = logging.getLogger(__name__)

LaTIN_COMMON_LETTERS = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
                        'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
ML_GLYPH_NAME_DICT = {
    'അ': 'a', 'ആ': 'aa', 'ഇ': 'i', 'ഈ': 'ii', 'ഉ': 'u', 'ഊ': 'uu',
    'ഋ': 'ru',
    'എ': 'e', 'ഏ': 'ee', 'ഐ': 'ai', 'ഒ': 'o', 'ഓ': 'oo', 'ഔ': 'au',
    'ക': 'k', 'ഖ': 'kh', 'ഗ': 'g', 'ഘ': 'gh',  'ങ': 'ng',
    'ച': 'ch', 'ഛ': 'chh', 'ജ': 'j', 'ഝ': 'jhh', 'ഞ': 'nj',
    'ട': 't', 'ഠ': 'tt', 'ഡ': 'd', 'ഢ': 'dh', 'ണ': 'nh',
    'ത': 'th', 'ഥ': 'tth', 'ദ': 'dh', 'ധ': 'ddh', 'ന': 'n',
    'പ': 'p', 'ഫ': 'ph', 'ബ': 'b', 'ഭ': 'bh', 'മ': 'm',
    'യ': 'y', 'ര': 'r', 'ല': 'l',  'വ': 'v',  'റ': 'rh',
    'ശ': 'z', 'ഷ': 'sh', 'സ': 's',  'ഹ': 'h', 'ള': 'lh', 'ഴ': 'zh',
    '്': 'virama', 'ം': 'anuswaram',
    'ാ': 'aa_sign', 'ി': 'i_sign', 'ീ': 'ii_sign', 'ു': 'u_sign',
    'ൂ': 'uu_sign', 'ൃ': 'ru_sign', 'െ': 'e_sign', 'േ': 'ee_sign',
    'ൈ': 'ai_sign', 'ൊ': 'o_sign', 'ോ': 'oo_sign',
    'ൗ': 'au_sign', 'ൌ': 'ou_sign',
    "ൄ": 'ruu_sign',
    'ൢ': 'lu_sign',
    "ന്\u200d": 'chillu_n',
    "ര്\u200d": "chillu_r",
    "ല്\u200d": "chillu_l",
    "ള്\u200d": "chillu_lh",
    "ണ്\u200d": "chillu_nh",
    "ഴ്\u200d": "chillu_zh",
    "ക്\u200d": "chillu_k",
    'ൻ': 'chillu_n',
    'ൽ': 'chillu_l',
    'ൾ': 'chillu_lh',
    'ൺ': 'chillu_nh',
    'ർ': 'chillu_r',
    'ൿ': 'chillu_k',
    'ൖ': 'chillu_zh',
    "്യ": "ya_sign", "്വ": "va_sign",
    "്ര": "reph"
}
ML_CONSONANTS = ['ക', 'ഖ', 'ഗ', 'ഘ',  'ങ',
                 'ച', 'ഛ', 'ജ', 'ഝ', 'ഞ',
                 'ട', 'ഠ', 'ഡ', 'ഢ', 'ണ',
                 'ത', 'ഥ', 'ദ', 'ധ', 'ന',
                 'പ', 'ഫ', 'ബ', 'ഭ', 'മ',
                 'യ', 'ര', 'ല',  'വ',  'റ',
                 'ശ', 'ഷ', 'സ',  'ഹ', 'ള', 'ഴ']
ML_LA_CONJUNCTS = ["ക്ല", "ഗ്ല", "പ്ല", "ഫ്ല", "ബ്ല", "ല്ല", "ഹ്ല"]
ML_CONS_CONJUNCTS = ["കൢ", "ക്ക", "ക്ഷ", "ഗ്ഗ", "ഗ്ദ", "ഗ്ന", "ഗ്മ", "ങ്ങ", "ച്ച", "ച്ഛ", "ജ്ജ", "ഞ്ച", "ഞ്ജ", "ഞ്ഞ", "ട്ട", "ണ്ണ", "ണ്ഡ", "ക്ത", "ങ്ക", "ണ്ട", "ത്ത", "ത്ഥ", "ത്ന", "ത്ഭ",
                     "ദ്ദ", "ന്ന", "ത്സ", "ത്മ", "ന്ത", "ന്ദ", "ന്ധ", "ന്മ", "ന്റ", "പ്പ", "പ്ഫ", "ബ്ബ", "മ്മ", "മ്പ", "യ്യ", "ല്ല", "വ്വ", "ശ്ച", "സ്സ", "ശ്ശ", "ഷ്ട", "ഹ്ന", "ഹ്മ", "ള്ള", "റ്റ"]
ML_REPH_CONJUNCTS = ["ക്ര", "ക്ക്ര", "ക്ത്ര", "ഗ്ര", "ഘ്ര", "ങ്ക്ര", "ച്ര", "ജ്ര", "ട്ര", "ഡ്ര", "ഢ്ര", "ണ്ട്ര", "ത്ര", "ത്ത്ര",
                     "ദ്ര", "ന്ത്ര", "ന്ദ്ര", "ന്ധ്ര", "പ്ര", "ഫ്ര", "ബ്ര", "മ്ര", "മ്പ്ര", "വ്ര", "ശ്ര", "സ്ര", "ഹ്ര", "ഷ്ര", "റ്റ്ര"]

LANGUAGE_MALAYALAM = [('mlm2', 'dflt')]
LANGUAGE_LATIN = [('DFLT', 'dflt'), ('latn', 'dflt')]


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
            raise argparse.ArgumentTypeError(msg)

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
    def get_glyph_name(name, prefix="ml_"):
        codepoint = ord(name[0])
        if codepoint == 8205:
            return 'zwj'
        if codepoint >= 3328 and codepoint <= 3455:
            if name in ML_GLYPH_NAME_DICT:
                return prefix + ML_GLYPH_NAME_DICT.get(name)
            if len(name) > 1:
                return prefix + "_".join(ML_GLYPH_NAME_DICT.get(c, c) for c in name)
        if len(name) == 1:
            return agl.UV2AGL.get(ord(name), f"uni{hex(codepoint).replace('0x','').upper()}")
        return agl.UV2AGL.get(name, name)


class MalayalamFontBuilder:
    def __init__(self, options):
        self.options=options
        self.fontFeatures = FontFeatures()
        self.available_svgs = []
        self.font = Font()

    def get_glyph_name(self, l, prefix="ml_"):
        codepoint = ord(l[0])
        if codepoint >= 3328:
            if l in ML_GLYPH_NAME_DICT:
                return prefix + ML_GLYPH_NAME_DICT.get(l)
            if len(l) > 1:
                return prefix + "_".join(ML_GLYPH_NAME_DICT.get(c, c) for c in l)
        if len(l) == 1:
            return agl.UV2AGL.get(ord(l), f"uni{hex(codepoint)}")
        return agl.UV2AGL.get(l, l)

    def build_latin_ligatures(self):
        feature = "liga"
        name = "latin_ligatures"
        ligatures = ["ffi", "ff", "ee", "th", "ft", "fi", "tt"]

        rules = []
        for ligature in ligatures:
            sub = Substitution([[SVGGlyph.get_glyph_name(l)] for l in ligature],
                               replacement=[[SVGGlyph.get_glyph_name(ligature)]])
            rules.append(sub)
        routine = Routine(rules=rules, name=name, languages=LANGUAGE_LATIN)
        self.fontFeatures.addFeature(feature, [routine])

    def build_chillus(self):
        feature = "akhn"
        name = "zwj_chillus"
        chillus = ["ന്\u200d", "ര്\u200d", "ല്\u200d",
                   "ള്\u200d", "ണ്\u200d", "ഴ്\u200d", "ക്\u200d"]

        rules = []
        for chillu in chillus:
            rules.append(
                Substitution([[SVGGlyph.get_glyph_name(l)] for l in chillu],
                             replacement=[[SVGGlyph.get_glyph_name(chillu)]])
            )
        routine = Routine(rules=rules, name=name, languages=LANGUAGE_MALAYALAM)
        self.fontFeatures.addFeature(feature, [routine])

    def build_cons_la(self):
        feature = "akhn"
        name = "cons_la"

        rules = []
        for conjunct in ML_LA_CONJUNCTS:
            rules.append(
                Substitution([[SVGGlyph.get_glyph_name(l)] for l in conjunct],
                             replacement=[[SVGGlyph.get_glyph_name(conjunct)]])
            )
        routine = Routine(rules=rules, name=name, languages=LANGUAGE_MALAYALAM)
        self.fontFeatures.addFeature(feature, [routine])

    def build_cons_signs(self):
        feature = "pstf"
        name = "cons_signs"
        cons_signs = ["്യ", "്വ"]
        rules = []
        for cons_sign in cons_signs:
            rules.append(
                Substitution([[SVGGlyph.get_glyph_name(l)] for l in cons_sign],
                             replacement=[[SVGGlyph.get_glyph_name(cons_sign)]])
            )
        routine = Routine(rules=rules, name=name, languages=LANGUAGE_MALAYALAM)
        self.fontFeatures.addFeature(feature, [routine])

    def build_cons_signs_order_fix(self):
        feature = "pstf"
        name = "cons_signs_fix_order"
        cons_signs = ["്യ", "്വ"]
        reph = "്ര"
        rules = []
        for cons_sign in cons_signs:
            rules.append(
                Substitution([[SVGGlyph.get_glyph_name(cons_sign)]],
                             replacement=[[SVGGlyph.get_glyph_name(l)] for l in cons_sign])
            )
        split_cons_signs = Routine(
            rules=rules, name='split_cons_signs', languages=LANGUAGE_MALAYALAM)

        rules = [
            # Avoid യ + ് + ര ligature
            Chaining(
                [[SVGGlyph.get_glyph_name(reph)]],
                precontext=[[SVGGlyph.get_glyph_name("യ")]],
                lookups=[[split_cons_signs]],
            ),
            # Split reph in  ്യ + ്ര combination
            Chaining(
                [[SVGGlyph.get_glyph_name(reph)]],
                precontext=[[SVGGlyph.get_glyph_name(cons_signs[0])]],
                lookups=[[split_cons_signs]],
            ),
            # Split reph in ്വ + ്ര combination
            Chaining(
                [[SVGGlyph.get_glyph_name(reph)]],
                precontext=[[SVGGlyph.get_glyph_name(cons_signs[1])]],
                lookups=[[split_cons_signs]],
            )]
        split_cons_signs = Routine(
            rules=rules, name=name, languages=LANGUAGE_MALAYALAM)

        self.fontFeatures.addFeature(feature, [split_cons_signs])

    def build_ra_sign(self):
        feature = "pref"
        name = "pref_reph"
        reph = "്ര"
        rule = Substitution([[SVGGlyph.get_glyph_name(l)] for l in reph],
                            replacement=[[SVGGlyph.get_glyph_name(reph)]])
        routine = Routine(rules=[rule], name=name,
                          languages=LANGUAGE_MALAYALAM)
        self.fontFeatures.addFeature(feature, [routine])

    def build_conjuncts(self):
        feature = "akhn"
        name = "akhn_conjuncts"
        rules = []
        for conjunct in ML_CONS_CONJUNCTS:
            conjunct_glyph_name = SVGGlyph.get_glyph_name(conjunct)
            if conjunct_glyph_name not in self.font:
                continue
            rules.append(
                Substitution([[SVGGlyph.get_glyph_name(l)] for l in conjunct],
                             replacement=[[conjunct_glyph_name]])
            )
        routine = Routine(rules=rules, name=name, languages=LANGUAGE_MALAYALAM)
        self.fontFeatures.addFeature(feature, [routine])

    def build_cons_ra_substitutions(self):
        feature = "pres"
        name = "pres_reph"
        reph = "്ര"
        rules = []
        for ligature in ML_REPH_CONJUNCTS:
            ligature = ligature.replace(reph, '')
            ligature_glyph_name = SVGGlyph.get_glyph_name(ligature+reph)
            if ligature_glyph_name not in self.font:
                continue
            sub = Substitution(
                [[SVGGlyph.get_glyph_name(reph)], [
                    SVGGlyph.get_glyph_name(ligature)]],
                replacement=[[ligature_glyph_name]])
            rules.append(sub)

        routine = Routine(rules=rules, name=name, languages=LANGUAGE_MALAYALAM)
        self.fontFeatures.addFeature(feature, [routine])

    def build_cons_conj_vowel_signs(self):
        feature = "psts"
        name = "psts_vowel_signs"
        rules = []
        vowel_signs = ["ു", "ൂ", "ൃ", "ൄ"]
        ligatures = sorted(ML_CONSONANTS+ML_REPH_CONJUNCTS +
                           ML_CONS_CONJUNCTS+ML_LA_CONJUNCTS)
        # TODO: Check if ligature exists in design. If not skip
        # TODO: If ligature exists, but if replacement ligature does not exist,
        #   add conditional stacking rule
        for ligature in ligatures:
            for vowel_sign in vowel_signs:
                replacement_ligature = SVGGlyph.get_glyph_name(
                    ligature)+SVGGlyph.get_glyph_name(vowel_sign, prefix="_")
                ligature_glyph_name = SVGGlyph.get_glyph_name(ligature)
                if ligature_glyph_name not in self.font:
                    continue
                if replacement_ligature not in self.font:
                    continue
                sub = Substitution(
                    [[ligature_glyph_name], [
                        SVGGlyph.get_glyph_name(vowel_sign)]],
                    replacement=[[replacement_ligature]])
                rules.append(sub)

        routine = Routine(rules=rules, name=name, languages=LANGUAGE_MALAYALAM)
        self.fontFeatures.addFeature(feature, [routine])

    def buildFeatures(self):
        # Latin GSUB
        self.build_latin_ligatures()
        # Malayalam GSUB
        self.build_chillus()
        self.build_conjuncts()
        self.build_cons_la()
        self.build_cons_signs()
        self.build_cons_signs_order_fix()
        self.build_ra_sign()
        self.build_cons_ra_substitutions()
        self.build_cons_conj_vowel_signs()
        self.font.features.text = self.getFeatures()

    def buildUFO(self):
        existing_glyphs = self.font.keys().copy()
        for glyph_name in existing_glyphs:
            del self.font[glyph_name]

        self.font.newGlyph('.null')
        self.font.newGlyph('nonmarkingreturn')
        self.font.newGlyph('.notdef')
        # Add space
        space = Glyph()
        space.width = 200
        space.unicodes = [32]
        self.font.insertGlyph(space, 'space')

        zwj = Glyph()
        zwj.unicodes = [8205]
        self.font.insertGlyph(zwj, 'zwj')

        for f in sorted(os.listdir(self.options.design)):
            if not f.endswith(".svg"):
                continue
            svg_glyph = SVGGlyph(os.path.join(self.options.design, f))
            svg_glyph.parse()
            self.available_svgs.append(svg_glyph)
            log.debug(f"{f} -> {svg_glyph.glyph_name}")
            self.font.insertGlyph(svg_glyph.glif, svg_glyph.glyph_name)

        with open("tools/compose.txt") as compositions_def_file:
            compositions = compositions_def_file.read().splitlines()
            for composition in compositions:
                composite_def = composition.split('\t')
                composite = composite_def[0].strip()
                items = composite_def[1].strip().split('+')
                if len(composite_def) == 3:
                    composite_unicode = int(composite_def[2].strip())
                else:
                    composite_unicode = None
                self.buildComposite(composite, composite_unicode, items)
                log.debug(
                    f"Compose {composite} : {'+'.join(items)} : {composite_unicode}")
            compositions_def_file.close()

        for base in ML_CONSONANTS:
            base_glyph_name = SVGGlyph.get_glyph_name(base)
            if base_glyph_name not in self.font:
                continue
            if base+'്ല' not in ML_LA_CONJUNCTS:
                continue
            la_glyph_name = SVGGlyph.get_glyph_name(base+'്ല')
            la_sign_glyph_name = SVGGlyph.get_glyph_name('്ല')
            log.debug(
                f"Compose {la_glyph_name} : {base_glyph_name}+{la_sign_glyph_name}")
            self.buildComposite(la_glyph_name, None, [
                                base_glyph_name, la_sign_glyph_name])

        base_for_u = ML_CONSONANTS+ML_CONS_CONJUNCTS+ML_LA_CONJUNCTS+ML_REPH_CONJUNCTS
        for base in base_for_u:
            base_glyph_name = SVGGlyph.get_glyph_name(base)
            if base_glyph_name not in self.font:
                continue
            u_glyph_name = SVGGlyph.get_glyph_name(base+'ു')
            uu_glyph_name = SVGGlyph.get_glyph_name(base+'ൂ')
            if u_glyph_name in self.font:
                continue
            log.debug(
                f"Compose {u_glyph_name} : {base_glyph_name}+uu_drop_sign")
            self.buildComposite(u_glyph_name, None, [
                                base_glyph_name, 'u_drop_sign'])
            log.debug(
                f"Compose {u_glyph_name} : {base_glyph_name}+uu_drop_sign")
            self.buildComposite(uu_glyph_name, None, [
                                base_glyph_name, 'uu_drop_sign'])

        with open("sources/glyphorder.txt") as order:
            self.font.glyphOrder = order.read().splitlines()
        log.debug(f"Glyph Count: {len(self.font)}")

    @staticmethod
    def commonAnchor(setA, setB) -> str:
        nameSetA = [anchor["name"] for anchor in setA]
        nameSetB = [anchor["name"] for anchor in setB]
        commonNames = [name for name in nameSetA if name in nameSetB]
        if len(commonNames):
            return commonNames[0]
        return None

    def buildComposite(self, glyph_name: str, unicode, items: List):
        self.font.newGlyph(glyph_name.strip())
        composite: Glyph = self.font[glyph_name]
        composite.unicode = unicode
        base = items[0].strip()
        items = items[1:]
        component = composite.instantiateComponent()
        component.baseGlyph = base
        baseGlyph: Glyph = self.font[base]
        composite.width = baseGlyph.width
        composite.appendComponent(component)

        for glyphName in items:
            glyphName = glyphName.strip()
            baseAnchors = baseGlyph.anchors
            currentGlyph = self.font[glyphName]
            glyphAnchors = currentGlyph.anchors
            commonAnchorName = MalayalamFontBuilder.commonAnchor(
                baseAnchors, glyphAnchors)

            component = composite.instantiateComponent()
            component.baseGlyph = glyphName
            if commonAnchorName is None:
                # Just append to the right
                x = baseGlyph.width
                y = 0
                composite.width = composite.width + currentGlyph.width
                component.move((x, y))
            else:
                anchor = _anchor = None
                for a in baseAnchors:
                    if a["name"] == commonAnchorName:
                        anchor = a
                for a in glyphAnchors:
                    if a["name"] == commonAnchorName:
                        _anchor = a
                if anchor and _anchor:
                    x = anchor["x"] - _anchor["x"]
                    y = anchor["y"] - _anchor["y"]
                    component.move((x, y))
            composite.appendComponent(component)
            composite.lib['public.markColor'] = '0.92, 0.93, 0.94, 1.0'  # grey
            # Now current glyph is base glyph for next one, if any
            baseGlyph = currentGlyph

    def updateFontVersion(self):
        version = str(self.options.version)
        now = datetime.utcnow()
        versionMajor, versionMinor = [int(num) for num in version.split(".")]
        self.font.info.versionMajor = versionMajor
        self.font.info.versionMinor = versionMinor
        self.font.info.year = now.year
        self.font.info.openTypeNameVersion = f"Version {versionMajor}.{versionMinor}"
        psFamily = re.sub(r'\s', '', self.options.name)
        psStyle = re.sub(r'\s', '', self.options.style)
        self.font.info.openTypeNameUniqueID = "%s-%s:%d" % (
            psFamily, psStyle, now.year)
        self.font.info.openTypeHeadCreated = now.strftime("%Y/%m/%d %H:%M:%S")

    def compile(self,
                ufo: Font,             # input UFO as filename string or defcon.Font object
                outputFilename: str,  # output filename string
                # true = makes CFF outlines. false = makes TTF outlines.
                cff: bool = True,
                **kwargs,        # passed along to ufo2ft.compile*()
                ):

        # update version to actual, real version. Must come after any call to setFontInfo.
        # updateFontVersion(ufo, dummy=False, isVF=False)
        compilerOptions = dict(
            useProductionNames=True,
            inplace=True,  # avoid extra copy
            removeOverlaps=True,
            overlapsBackend='pathops',  # use Skia's pathops
        )

        log.info("compiling %s -> %s (%s)", _LazyFontName(ufo), outputFilename,
                 "OTF/CFF-2" if cff else "TTF")

        if cff:
            font = ufo2ft.compileOTF(ufo, **compilerOptions)
        else:  # ttf
            compilerOptions['flattenComponents'] = True
            font = ufo2ft.compileTTF(ufo, **compilerOptions)

        log.debug(f"Writing {outputFilename}")
        font.save(outputFilename)
        self.fix_font(outputFilename)

    def fix_font(self, fontFile):
        log.debug(f"Fixing {fontFile}")
        ttFont = ttLib.TTFont(fontFile)
        self.add_dummy_dsig(ttFont)
        self.fix_unhinted_font(ttFont)
        self.fix_fs_type(ttFont)
        ttFont.save(fontFile)

    def fix_unhinted_font(self, ttFont: ttLib.TTFont):
        """Improve the appearance of an unhinted font on Win platforms by:
            - Add a new GASP table with a newtable that has a single
            range which is set to smooth.
            - Add a new prep table which is optimized for unhinted fonts.
        Args:
            ttFont: a TTFont instance
        """
        gasp = ttLib.newTable("gasp")
        # Set GASP so all sizes are smooth
        gasp.gaspRange = {0xFFFF: 15}

        program = ttLib.tables.ttProgram.Program()
        assembly = ["PUSHW[]", "511", "SCANCTRL[]",
                    "PUSHB[]", "4", "SCANTYPE[]"]
        program.fromAssembly(assembly)

        prep = ttLib.newTable("prep")
        prep.program = program

        ttFont["gasp"] = gasp
        ttFont["prep"] = prep


    def fix_fs_type(self, ttFont):
        """Set the OS/2 table's fsType flag to 0 (Installable embedding).
        Args:
            ttFont: a TTFont instance
        """
        old = ttFont["OS/2"].fsType
        ttFont["OS/2"].fsType = 0
        return old != 0

    def add_dummy_dsig(self, ttFont):
        """Add a dummy dsig table to a font. Older versions of MS Word
        require this table.
        Args:
            ttFont: a TTFont instance
        """
        newDSIG = ttLib.newTable("DSIG")
        newDSIG.ulVersion = 1
        newDSIG.usFlag = 0
        newDSIG.usNumSigs = 0
        newDSIG.signatureRecords = []
        ttFont.tables["DSIG"] = newDSIG

    def setFontInfo(self):
        name =  self.options.name
        style = self.options.style
        repo = self.options.source

        info = Info(self.font)
        # Names
        info.familyName = name
        info.styleMapFamilyName = info.familyName
        info.styleName = style
        info.copyright = f"Copyright {datetime.utcnow().year} The {name} Project Authors ({repo})"
        info.openTypeNameDesigner = f"{self.options.author.name} &lt;{self.options.author.email}&gt"
        info.openTypeNameDesignerURL = self.options.author.url
        info.openTypeNameLicense = self.options.license.text
        info.openTypeNameLicenseURL =  self.options.license.url
        info.openTypeNameManufacturer =  self.options.manufacturer.name
        info.openTypeOS2VendorID = info.openTypeNameManufacturer
        info.openTypeNameManufacturerURL = self.options.manufacturer.url

        # Metrics
        info.unitsPerEm = 1000
        info.ascender = 800
        info.descender = -200
        info.xHeight = 700
        info.capHeight = 700
        info.guidelines = []
        info.italicAngle = 0

        # OpenType hhea Table
        info.openTypeHheaAscender = info.ascender
        info.openTypeHheaDescender = info.descender
        info.openTypeHheaLineGap = 0

        # OpenType OS/2 Table
        # info.openTypeOS2CodePageRanges=[01]
        # info.openTypeOS2FamilyClass=[00]
        # info.openTypeOS2Panose=[0083000000]
        info.openTypeOS2Selection = [7]
        info.openTypeOS2Type = []
        info.openTypeOS2TypoAscender = info.ascender
        info.openTypeOS2TypoDescender = -info.descender
        info.openTypeOS2TypoLineGap = 0
        # info.openTypeOS2UnicodeRanges=[12323]
        info.openTypeOS2WeightClass = 700
        info.openTypeOS2WidthClass = 5
        info.openTypeOS2WinAscent = info.ascender
        info.openTypeOS2WinDescent = -info.descender

        # postscript metrics
        # info.postscriptBlueValues=[00800800]
        info.postscriptFamilyBlues = []
        info.postscriptFamilyOtherBlues = []
        info.postscriptOtherBlues = []
        info.postscriptSlantAngle = 0
        info.postscriptStemSnapH = []
        info.postscriptStemSnapV = []
        info.postscriptUnderlinePosition = -603
        info.postscriptUnderlineThickness = 100
        info.postscriptUniqueID = 0

    def buildWebFont(self, ttfFile):
        ttFont = ttLib.TTFont(ttfFile)
        ttFont.flavor = "woff2"
        webfont_name=ttfFile.replace('.ttf','.woff2')
        ttFont.save(webfont_name)
        log.info(f"Webfont saved at {webfont_name}")

    def save(self):
        ufo_file_name= f"build/{self.options.name}-{self.options.style}.ufo"
        self.font.save(ufo_file_name)
        log.info(f"UFO font saved at {ufo_file_name}")

    def build(self, options):
        self.setFontInfo()
        self.buildUFO()
        self.buildFeatures()
        self.updateFontVersion()
        self.save()

        ttfFile= f"build/{self.options.name}-{self.options.style}.ttf"
        otfFile= f"build/{self.options.name}-{self.options.style}.otf"
        if 'TTF' in options.output_format or 'WOFF2' in options.output_format :
            self.compile(self.font,ttfFile, cff=False)
        if 'OTF' in options.output_format:
            self.compile(self.font, otfFile)
        if 'WOFF2' in options.output_format:
            self.buildWebFont(ttfFile)

    def getFeatures(self):
        return self.fontFeatures.asFea()


def dir_path(string):
    if os.path.isdir(string):
        return string
    else:
        raise NotADirectoryError(string)



if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Build a UFO formatted font", add_help=True)
    parser.add_argument(
      "-c", "--config", help="The font information and configuraion",
      default="config.yaml", type=argparse.FileType('r'))
    parser.add_argument('-l', '--log-level', default='DEBUG',
                        required=False, help="Set log level")
    parser.add_argument('-f', '--output-format', default='OTF,TTF,WOFF2',
                        required=False, help="Set output format: ALL, OTF, TTF or WOFF2")

    options = parser.parse_args()
    try:
        logging.basicConfig(level=options.log_level)
    except ValueError:
        logging.error("Invalid log level: {}".format(options.log_level))
        sys.exit(1)


    config = DefaultMunch.fromDict(yaml.load(options.config, Loader=yaml.FullLoader))
    builder = MalayalamFontBuilder(config)
    builder.build(options)
    features = builder.getFeatures()
