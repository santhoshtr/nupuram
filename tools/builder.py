
from __future__ import absolute_import, print_function
from email.policy import default

import unicodedata
from ast import List
from cgitb import Hook
from functools import cache
from importlib.abc import PathEntryFinder
from locale import normalize

from munch import DefaultMunch
from numpy import void

__requires__ = ["FontTools"]

import argparse
import logging
import os
import re
import copy
import sys
import traceback
import xml.etree.ElementTree as etree
from datetime import datetime
from io import open

import ufo2ft
import yaml
from defcon import Font, Glyph, Info, Layer
from fontFeatures import (Chaining, FontFeatures, Positioning, Routine,
                          Substitution, ValueRecord)
from fontTools import agl, ttLib
from fontTools.misc.py23 import SimpleNamespace
from fontTools.pens.pointPen import SegmentToPointPen
from fontTools.svgLib import SVGPath
from fontTools.ufoLib import UFOLibError, UFOReader, UFOWriter
from fontTools.ufoLib.glifLib import writeGlyphToString, readGlyphFromString
from fontTools.ufoLib.plistlib import dump, load
from fontTools.colorLib.builder import buildCOLR, buildCPAL

log = logging.getLogger(__name__)

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


class MalayalamFontBuilder:
    def __init__(self, options):
        self.options = options
        self.fontFeatures = FontFeatures()
        self.available_svgs = []
        self.font = Font()

    def build_glyph_classes(self):
        for gclass in self.options.glyphs.classes:
            glyph_names = [SVGGlyph.get_glyph_name(
                g) for g in self.get_glyphs_from_named_classes(gclass)]
            glyph_names = [g for g in glyph_names if g in self.font]
            self.fontFeatures.namedClasses[gclass] = glyph_names

    def get_glyphs_from_named_classes(self, *argv):
        all_glyphs = []
        for class_name in argv:
            glyphs = self.options.glyphs.classes[class_name]
            if isinstance(glyphs, list):
                all_glyphs = all_glyphs + glyphs
            else:
                all_glyphs = all_glyphs + [g for g in glyphs]
        return all_glyphs

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

    def build_latin_pos(self):
        feature = "kern"
        for script in self.options.glyphs.kern:
            name = f"{script}_kern"
            languages = eval(f"LANGUAGE_{script.upper()}")
            rules = []
            for kern_def in self.options.glyphs.kern[script]:
                lhs = kern_def[0]
                if '@' not in lhs:
                    lhs = SVGGlyph.get_glyph_name(lhs)
                rhs = kern_def[1]
                if '@' not in rhs:
                    rhs = SVGGlyph.get_glyph_name(rhs)
                xAdvance = kern_def[2]

                rules.append(
                    Positioning([[lhs], [rhs]],
                                [ValueRecord(xAdvance=xAdvance), ValueRecord()])
                )
            routine = Routine(rules=rules, name=name, languages=languages)
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
        for conjunct in self.get_glyphs_from_named_classes('ML_LA_CONJUNCTS'):
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
        for conjunct in self.get_glyphs_from_named_classes('ML_CONS_CONJUNCTS'):
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
        for ligature in self.get_glyphs_from_named_classes('ML_REPH_CONJUNCTS'):
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
        ligatures = sorted(
            self.get_glyphs_from_named_classes('ML_CONSONANTS') +
            self.get_glyphs_from_named_classes('ML_REPH_CONJUNCTS') +
            self.get_glyphs_from_named_classes('ML_CONS_CONJUNCTS') +
            self.get_glyphs_from_named_classes('ML_LA_CONJUNCTS'))
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

    def build_gdef(self):
        ligatures = sorted(
            self.get_glyphs_from_named_classes('ML_REPH_CONJUNCTS') +
            self.get_glyphs_from_named_classes('ML_CONS_CONJUNCTS') +
            self.get_glyphs_from_named_classes('ML_LA_CONJUNCTS') +
            self.get_glyphs_from_named_classes('LATIN_EXTRA')
        )
        for ligature in ligatures:
            ligature_glyph_name = SVGGlyph.get_glyph_name(ligature)
            if ligature_glyph_name in self.font:
                self.fontFeatures.glyphclasses[ligature_glyph_name] = "ligature"

        for c in self.get_glyphs_from_named_classes('LC_ALL') + self.get_glyphs_from_named_classes('UC_ALL'):
            c_glyph_name = SVGGlyph.get_glyph_name(c)
            if c_glyph_name in self.font:
                self.fontFeatures.glyphclasses[c_glyph_name] = "base"

        for cons in self.get_glyphs_from_named_classes('ML_CONSONANTS'):
            cons_glyph_name = SVGGlyph.get_glyph_name(cons)
            if cons_glyph_name in self.font:
                self.fontFeatures.glyphclasses[cons_glyph_name] = "base"

        self.fontFeatures.glyphclasses[SVGGlyph.get_glyph_name('്')] = "mark"
        self.fontFeatures.glyphclasses[SVGGlyph.get_glyph_name('ൎ')] = "mark"

    def buildFeatures(self):
        self.build_glyph_classes()
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
        self.build_latin_pos()
        self.build_gdef()
        self.font.features.text = self.getFeatures()

    def buildUFO(self):
        self.font.newGlyph('.null')
        self.font.newGlyph('nonmarkingreturn')
        self.font.newGlyph('.notdef')
        # Add space
        space = Glyph()
        space.width = 200
        space.unicodes = [0x0020]
        self.font.insertGlyph(space, 'space')

        for f in sorted(os.listdir(self.options.design)):
            if not f.endswith(".svg"):
                continue
            svg_glyph = SVGGlyph(os.path.join(self.options.design, f))
            svg_glyph.parse()
            log.debug(f"{f} -> {svg_glyph.glyph_name}")
            self.font.insertGlyph(svg_glyph.glif, svg_glyph.glyph_name)

        # ZWJ and ZWNJ
        zwnj = Glyph()
        zwnj.unicodes = [0x200C]
        self.font.insertGlyph(zwnj, 'zwnj')

        zwj = Glyph()
        zwj.unicodes = [0x200D]
        self.font.insertGlyph(zwj, 'zwj')

        dotaccent = Glyph()
        dotaccent.unicodes = [0x02D9]
        composite = dotaccent.instantiateComponent()
        composite.baseGlyph = 'period'
        dotaccent.appendComponent(composite)
        self.font.insertGlyph(dotaccent, 'dotaccent')

        diacritics = "´^¸˚¯`ˇ~¨˙˜"
        for diacritic in diacritics:
            for base in self.get_glyphs_from_named_classes('LC_ALL')+self.get_glyphs_from_named_classes('UC_ALL'):
                base_name = SVGGlyph.get_glyph_name(base)
                diacritc_name = SVGGlyph.get_glyph_name(diacritic)
                items = [base_name, diacritc_name]
                composite_glyph_name = ''.join(items)
                if composite_glyph_name in agl.AGL2UV:
                    composite_unicode = agl.AGL2UV[composite_glyph_name]
                else:
                    continue
                if chr(composite_unicode) not in self.get_glyphs_from_named_classes('LATIN_EXTRA'):
                    continue
                if diacritc_name not in self.font:
                    continue
                if base_name not in self.font:
                    continue
                log.debug(
                    f"Compose {chr(composite_unicode)} - {composite_glyph_name} : {'+'.join(items)} : {composite_unicode}")
                self.buildComposite(composite_glyph_name,
                                    composite_unicode, items)

        self.buildComposite(SVGGlyph.get_glyph_name('ഈ'), ord('ഈ'), [
            SVGGlyph.get_glyph_name('ഇ'),  SVGGlyph.get_glyph_name('ൗ')])
        self.buildComposite(SVGGlyph.get_glyph_name('ഊ'), ord('ഊ'), [
            SVGGlyph.get_glyph_name('ഉ'),  SVGGlyph.get_glyph_name('ൗ')])
        self.buildComposite(SVGGlyph.get_glyph_name('ഓ'), ord('ഓ'), [
            SVGGlyph.get_glyph_name('ഒ'),  SVGGlyph.get_glyph_name('ാ')])
        self.buildComposite(SVGGlyph.get_glyph_name('ഔ'), ord('ഔ'), [
            SVGGlyph.get_glyph_name('ഒ'),  SVGGlyph.get_glyph_name('ൗ')])
        self.buildComposite(SVGGlyph.get_glyph_name('ഐ'), ord('ഐ'), [
            SVGGlyph.get_glyph_name('െ'),  SVGGlyph.get_glyph_name('എ')])
        self.buildComposite(SVGGlyph.get_glyph_name('ൊ'), ord('ൊ'), [
            SVGGlyph.get_glyph_name('െ'),  SVGGlyph.get_glyph_name('ാ')])
        self.buildComposite(SVGGlyph.get_glyph_name('ോ'), ord('ോ'), [
            SVGGlyph.get_glyph_name('േ'),  SVGGlyph.get_glyph_name('ാ')])
        self.buildComposite(SVGGlyph.get_glyph_name('ൈ'), ord('ൈ'), [
            SVGGlyph.get_glyph_name('െ'),  SVGGlyph.get_glyph_name('െ')])
        self.buildComposite(SVGGlyph.get_glyph_name('ൌ'), ord('ൌ'), [
            SVGGlyph.get_glyph_name('െ'),  SVGGlyph.get_glyph_name('ൗ')])
        self.buildComposite(SVGGlyph.get_glyph_name('കൢ'), None, [
            SVGGlyph.get_glyph_name('ക'),  SVGGlyph.get_glyph_name('ൢ')])

        for base in self.get_glyphs_from_named_classes('ML_CONSONANTS'):
            base_glyph_name = SVGGlyph.get_glyph_name(base)
            if base_glyph_name not in self.font:
                continue
            if base+'്ല' not in self.get_glyphs_from_named_classes('ML_LA_CONJUNCTS'):
                continue
            la_glyph_name = SVGGlyph.get_glyph_name(base+'്ല')
            la_sign_glyph_name = SVGGlyph.get_glyph_name('്ല')
            log.debug(
                f"Compose {la_glyph_name} : {base_glyph_name}+{la_sign_glyph_name}")
            self.buildComposite(la_glyph_name, None, [
                                base_glyph_name, la_sign_glyph_name])

        base_for_u = self.get_glyphs_from_named_classes('ML_CONSONANTS')+self.get_glyphs_from_named_classes(
            'ML_CONS_CONJUNCTS')+self.get_glyphs_from_named_classes('ML_LA_CONJUNCTS')+self.get_glyphs_from_named_classes('ML_REPH_CONJUNCTS')
        for base in base_for_u:
            base_glyph_name = SVGGlyph.get_glyph_name(base)
            if base_glyph_name not in self.font:
                continue
            u_glyph_name = SVGGlyph.get_glyph_name(base+'ു')
            uu_glyph_name = SVGGlyph.get_glyph_name(base+'ൂ')

            if u_glyph_name not in self.font:
                log.debug(
                    f"Compose {u_glyph_name} : {base_glyph_name}+uu_drop_sign")
                self.buildComposite(u_glyph_name, None, [
                                    base_glyph_name, 'u_drop_sign'])
            if uu_glyph_name not in self.font:
                log.debug(
                    f"Compose {u_glyph_name} : {base_glyph_name}+uu_drop_sign")
                self.buildComposite(uu_glyph_name, None, [
                                    base_glyph_name, 'uu_drop_sign'])

        for base in self.get_glyphs_from_named_classes('ML_CONSONANTS'):
            base_glyph_name = SVGGlyph.get_glyph_name(base)
            ru_glyph_name = SVGGlyph.get_glyph_name(base+'ൃ')
            if ru_glyph_name not in self.font:
                log.debug(
                    f"Compose {ru_glyph_name} : {base_glyph_name}+ru_bottom_sign")
                self.buildComposite(ru_glyph_name, None, [
                    base_glyph_name, 'ru_bottom_sign'])

        log.info(f"Total glyph count: {len(self.font)}")

    def buildColorUFO(self):
        default_layer: Layer = self.font.layers['public.default']
        shadowLayer: Layer = self.font.newLayer('shadow')

        # Add offset glyph
        for glyph in default_layer:
            glyph.decomposeAllComponents()
            shadow_glyph = copy.deepcopy(glyph)
            shadowLayer.insertGlyph(shadow_glyph,  glyph.name)
            temp_glyph_name = 'glyph.name'+".temp"
            temp_glyph = shadowLayer.newGlyph(temp_glyph_name)
            component = temp_glyph.instantiateComponent()
            component.baseGlyph = glyph.name
            component.move((40, -40))
            temp_glyph.appendComponent(component)
            temp_glyph.decomposeAllComponents()
            shadowLayer.insertGlyph(temp_glyph,  glyph.name)
            del shadowLayer[temp_glyph_name]

        self.font.lib[ufo2ft.constants.COLOR_LAYER_MAPPING_KEY] = [
            ['shadow', 0],  ['public.default', 1]]
        TOMOTO_ORANGE = (255, 99, 71)
        GRAY = (120, 120, 120)
        palette = [GRAY, TOMOTO_ORANGE]
        CPAL_palette = [(r/255., g/255., b/255., 1.0) for (r, g, b) in palette]
        self.font.lib[ufo2ft.constants.COLOR_PALETTES_KEY] = [CPAL_palette]

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
        self.font.info.openTypeNameVersion = "Version %d.%03d" % (
            versionMajor, versionMinor)
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

        log.info("compiling %s -> %s (%s)", self.options.name, outputFilename,
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

    def fix_fs_type(self, ttFont: ttLib.TTFont):
        """Set the OS/2 table's fsType flag to 0 (Installable embedding).
        Args:
            ttFont: a TTFont instance
        """
        old = ttFont["OS/2"].fsType
        ttFont["OS/2"].fsType = 0
        return old != 0

    def add_dummy_dsig(self, ttFont: ttLib.TTFont) -> void:
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
        name = self.options.name
        style = self.options.style
        repo = self.options.source

        # set various font metadata; see the full list of fontinfo attributes at
        # https://unifiedfontobject.org/versions/ufo3/fontinfo.plist/#generic-dimension-information
        self.font.info.unitsPerEm = 1000
        # we just use a simple scheme that makes all sets of vertical metrics the same;
        # if one needs more fine-grained control they can fix up post build
        self.font.info.ascender = (
            self.font.info.openTypeHheaAscender
        ) = self.font.info.openTypeOS2TypoAscender = 800
        self.font.info.descender = (
            self.font.info.openTypeHheaDescender
        ) = self.font.info.openTypeOS2TypoDescender = 200
        self.font.info.openTypeHheaLineGap = self.font.info.openTypeOS2TypoLineGap = 0

        # Names
        self.font.info.familyName = name
        self.font.info.styleMapFamilyName = self.font.info.familyName
        self.font.info.styleName = style
        self.font.info.copyright = f"Copyright {datetime.utcnow().year} The {name} Project Authors ({repo})"
        self.font.info.openTypeNameDesigner = f"{self.options.author.name} &lt;{self.options.author.email}&gt"
        self.font.info.openTypeNameDesignerURL = self.options.author.url
        self.font.info.openTypeNameLicense = self.options.license.text
        self.font.info.openTypeNameLicenseURL = self.options.license.url
        self.font.info.openTypeNameManufacturer = self.options.manufacturer.name
        self.font.info.openTypeOS2VendorID = self.font.info.openTypeNameManufacturer
        self.font.info.openTypeNameManufacturerURL = self.options.manufacturer.url

        # Metrics
        self.font.info.xHeight = 700
        self.font.info.capHeight = 800
        self.font.info.guidelines = []
        self.font.info.italicAngle = 0

        # OpenType OS/2 Table
        # info.openTypeOS2CodePageRanges=[01]
        # info.openTypeOS2FamilyClass=[00]
        # info.openTypeOS2Panose=[0083000000]
        # set USE_TYPO_METRICS flag (OS/2.fsSelection bit 7) to make sure OS/2 Typo* metrics
        # are preferred to define Windows line spacing over legacy WinAscent/WinDescent:
        # https://docs.microsoft.com/en-us/typography/opentype/spec/os2#fsselection
        self.font.info.openTypeOS2Selection = [7]
        self.font.info.openTypeOS2Type = []
        self.font.info.openTypeOS2TypoAscender = self.font.info.ascender
        self.font.info.openTypeOS2TypoDescender = -self.font.info.descender
        self.font.info.openTypeOS2TypoLineGap = 0
        # info.openTypeOS2UnicodeRanges=[12323]
        self.font.info.openTypeOS2WeightClass = 400
        self.font.info.openTypeOS2WidthClass = 5
        self.font.info.openTypeOS2WinAscent = self.font.info.ascender
        self.font.info.openTypeOS2WinDescent = self.font.info.descender

        # postscript metrics
        # info.postscriptBlueValues=[00800800]
        self.font.info.postscriptFamilyBlues = []
        self.font.info.postscriptFamilyOtherBlues = []
        self.font.info.postscriptOtherBlues = []
        self.font.info.postscriptSlantAngle = 0
        self.font.info.postscriptStemSnapH = []
        self.font.info.postscriptStemSnapV = []
        self.font.info.postscriptUnderlinePosition = -603
        self.font.info.postscriptUnderlineThickness = 100
        self.font.info.postscriptUniqueID = 0

    def buildWebFont(self, ttfFile, webfontFile):
        ttFont = ttLib.TTFont(ttfFile)
        ttFont.flavor = "woff2"

        ttFont.save(webfontFile)
        log.info(f"Webfont saved at {webfontFile}")

    def saveUFO(self, ufo_file_name):
        self.font.save(ufo_file_name)
        log.info(f"UFO font saved at {ufo_file_name}")

    def build(self, options):
        self.setFontInfo()
        self.buildUFO()
        self.buildFeatures()
        self.updateFontVersion()

        os.makedirs(self.options.build, exist_ok=True)
        ufo_file_name = f"build/{self.options.name}-{self.options.style}.ufo"
        ttfFile = ufo_file_name.replace('.ufo', '.ttf')
        otfFile = ufo_file_name.replace('.ufo', '.otf')
        webfontFile = ufo_file_name.replace('.ufo', '.woff2')

        if 'UFO' in options.output_format:
            self.saveUFO(ufo_file_name)

        if 'TTF' in options.output_format or 'WOFF2' in options.output_format:
            self.compile(self.font, ttfFile, cff=False)

        if 'OTF' in options.output_format:
            self.compile(self.font, otfFile)

        if 'WOFF2' in options.output_format:
            self.buildWebFont(ttfFile, webfontFile)

        isColor = 'COLOR' in options.output_format
        if isColor:
            self.buildColorUFO()
        ufo_file_name = f"build/{self.options.name}-{self.options.style}.color.ufo"
        ttfFile = ufo_file_name.replace('.ufo', '.ttf')
        otfFile = ufo_file_name.replace('.ufo', '.otf')
        webfontFile = ufo_file_name.replace('.ufo', '.woff2')
        if 'UFO' in options.output_format:
            self.saveUFO(ufo_file_name)

        if 'TTF' in options.output_format or 'WOFF2' in options.output_format:
            self.compile(self.font, ttfFile, cff=False)

        if 'WOFF2' in options.output_format:
            self.buildWebFont(ttfFile, webfontFile)
        # FIXME. Fix error here
        # if 'OTF' in options.output_format:
        #     self.compile(self.font, otfFile)

    def getFeatures(self):
        return self.fontFeatures.asFea()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Build a UFO formatted font", add_help=True)
    parser.add_argument(
        "-c", "--config", help="The font information and configuraion",
        default="config.yaml", type=argparse.FileType('r'))
    parser.add_argument('-l', '--log-level', default='INFO',
                        required=False, help="Set log level")
    parser.add_argument('-f', '--output-format', default='UFO, OTF,TTF,WOFF2,COLOR',
                        required=False, help="Set output format: UFO, OTF, TTF or WOFF2. For multiple formats, use commas")

    options = parser.parse_args()
    try:
        logging.basicConfig(level=options.log_level)
    except ValueError:
        logging.error("Invalid log level: {}".format(options.log_level))
        sys.exit(1)

    config = DefaultMunch.fromDict(
        yaml.load(options.config, Loader=yaml.FullLoader))
    builder = MalayalamFontBuilder(config)
    builder.build(options)
    features = builder.getFeatures()
