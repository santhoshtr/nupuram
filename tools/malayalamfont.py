
import logging
import os
import re
from datetime import datetime
from typing import List
from itertools import product
from defcon import Font, Glyph, Anchor, Component
from fontFeatures import (Chaining, FontFeatures, Positioning, Routine, Attachment,
                          Substitution, ValueRecord)
from fontTools import agl

from svgglyph import SVGGlyph

log = logging.getLogger(__name__)

LANGUAGE_MALAYALAM = [('mlm2', 'dflt')]
LANGUAGE_LATIN = [('DFLT', 'dflt'), ('latn', 'dflt')]


class MalayalamFont(Font):
    def __init__(self, options, style="", weight=400):
        Font.__init__(self)
        self.options = options
        self.style = style
        self.weight = weight
        self.fontFeatures = FontFeatures()
        self.available_svgs = []
        self.salts={} #Stylistic Alternates
        logging.basicConfig(level='WARN')

    def build_glyph_classes(self):
        for gclass in self.options.glyphs.classes:
            glyph_names = [SVGGlyph.get_glyph_name(
                g) for g in self.get_glyphs_from_named_classes(gclass)]
            glyph_names = [g for g in glyph_names if g in self]
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

    def get_glyph_names_from_named_classes(self, class_name):
        all_glyphs = self.get_glyphs_from_named_classes(class_name)
        return [SVGGlyph.get_glyph_name(l) for l in all_glyphs]

    def build_latin_ligatures(self):
        feature = "liga"
        name = "latin_ligatures"
        ligatures = self.get_glyphs_from_named_classes('LATIN_LIGATURES')

        rules = []
        for ligature in ligatures:
            sub = Substitution([[SVGGlyph.get_glyph_name(l)] for l in ligature],
                               replacement=[[SVGGlyph.get_glyph_name(ligature)]])
            rules.append(sub)
        routine = Routine(rules=rules, name=name, languages=LANGUAGE_LATIN)
        self.fontFeatures.addFeature(feature, [routine])

    def build_kern(self):
        feature = "kern"
        for script in self.options.glyphs.kern:
            name = f"{script}_kern"
            languages = eval(f"LANGUAGE_{script.upper()}")
            rules = []
            for kern_def in self.options.glyphs.kern[script]:
                lhs_def = kern_def[0]
                if '@' in lhs_def:
                    lhs=[lhs_def]
                else:
                    if isinstance(lhs_def, list):
                        lhs = [SVGGlyph.get_glyph_name(l) for l in lhs_def]
                    else:
                        lhs = [SVGGlyph.get_glyph_name(lhs_def)]

                rhs_def = kern_def[1]
                if '@' in rhs_def:
                    rhs=[rhs_def]
                else:
                    if isinstance(rhs_def, list):
                        rhs = [SVGGlyph.get_glyph_name(l) for l in rhs_def]
                    else:
                        rhs=[SVGGlyph.get_glyph_name(rhs_def)]

                xAdvance = kern_def[2]
                # Flatten the class to avoid the issue of class overlaps and rules
                # getting ignored
                for l, r in product(lhs, rhs):
                    rules.append(
                        Positioning([[l], [r]],
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
        # Prevent stacking and prefer ligating with following letters
        # Key is stack, value is letters after the stack that prevents stacking.
        # Example, ഷ് + ട്ട -> Avoid stacked shta, prefer sh + virama + tta
        prevent_stack_contexts = {
            "ഷ്ട": "്ട",
            "ഷ്പ": "്ര",
            "സ്ത": "്ത",
            "ല്പ": "്പ",
        }
        conditional_stack_lookup = None
        #TODO Can this dictionary be moved to config?
        for conjunct in self.get_glyphs_from_named_classes('ML_CONS_CONJUNCTS'):
            conjunct_glyph_name = SVGGlyph.get_glyph_name(conjunct)
            if conjunct_glyph_name not in self:
                continue
            sub =  Substitution([[SVGGlyph.get_glyph_name(l)] for l in conjunct],
                                replacement=[[conjunct_glyph_name]])
            if conjunct in prevent_stack_contexts.keys():
                if conditional_stack_lookup:
                    conditional_stack_lookup.addRule(sub)
                else:
                    conditional_stack_lookup = Routine(
                        rules=[sub],
                        name='conditional_stack_lookup',
                        languages=LANGUAGE_MALAYALAM
                    )
                rules.extend([
                   Chaining(
                        [[SVGGlyph.get_glyph_name(l)] for l in conjunct],
                        postcontext=[[SVGGlyph.get_glyph_name(l)] for l in prevent_stack_contexts.get(conjunct)],
                        lookups=[]
                    ), # Produces ignore sub rule.
                    Chaining(
                        [[SVGGlyph.get_glyph_name(l)] for l in conjunct],
                        lookups=[[ self.fontFeatures.referenceRoutine(conditional_stack_lookup)], None, None ]
                    )
                ])
                # THANKS to https://github.com/simoncozens/fontFeatures/issues/58 for the above method
            else:
                rules.append(sub)
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
            if ligature_glyph_name not in self:
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
        vowel_signs = self.options.glyphs.classes['ML_VOWEL_SIGNS_CONJOINING']
        ligatures = sorted(
            self.get_glyphs_from_named_classes('ML_CONSONANTS') +
            self.get_glyphs_from_named_classes('ML_REPH_CONJUNCTS') +
            self.get_glyphs_from_named_classes('ML_CONS_CONJUNCTS') +
            self.get_glyphs_from_named_classes('ML_LA_CONJUNCTS')+
            ["്യ"]
        )

        for ligature in ligatures:
            for vowel_sign in vowel_signs:
                replacement_ligature = SVGGlyph.get_glyph_name(
                    ligature)+SVGGlyph.get_glyph_name(vowel_sign, prefix="_")
                ligature_glyph_name = SVGGlyph.get_glyph_name(ligature)
                if ligature_glyph_name not in self:
                    continue
                if replacement_ligature not in self:
                    # TODO: If ligature exists, but if replacement ligature does not exist,
                    #   add conditional stacking rule
                    continue
                sub = Substitution(
                    [[ligature_glyph_name], [
                        SVGGlyph.get_glyph_name(vowel_sign)]],
                    replacement=[[replacement_ligature]],
                    flags=8)
                rules.append(sub)
        routine = Routine(rules=rules, name=name, languages=LANGUAGE_MALAYALAM)
        self.fontFeatures.addFeature(feature, [routine])

    def build_conjuncts_fixup(self):
        feature = "akhn"
        name = "akhn_conjuncts_fixup"
        vowel_signs = self.options.glyphs.classes['ML_VOWEL_SIGNS_CONJOINING']
        ligatures = sorted(
            self.get_glyphs_from_named_classes('ML_CONS_CONJUNCTS') +
            self.get_glyphs_from_named_classes('ML_LA_CONJUNCTS')
        )
        rules = []
        split_cons_conj = None
        for ligature in ligatures:
            ligature_glyph_name = SVGGlyph.get_glyph_name(ligature)
            if ligature_glyph_name not in self:
                continue
            missing_vowels = []
            missing_vowels_glyph_names = []
            for vowel_sign in vowel_signs:
                ligature_vowel = ligature+vowel_sign
                replacement_ligature_glyphname = SVGGlyph.get_glyph_name(ligature_vowel)
                if replacement_ligature_glyphname in self:
                    continue
                missing_vowels.append(vowel_sign)
                missing_vowels_glyph_names.append(SVGGlyph.get_glyph_name(vowel_sign))
            parts=[]
            seq=""
            largest_seq=seq
            for char in reversed(ligature):
                seq = char+seq
                # FIXME We are basing missing_vowels[0] here to find largest available ligature
                # with that vowel. But this is not flexible to accommodate the nature of other vowel
                # conjoining. If we are doing that for each missing vowel, we cannot group this splitting
                # under split_cons_conj lookup. We will lookups for each vowelsign.
                # But this is rare; Having a -uu glyph without _u glyph is rare.
                if SVGGlyph.get_glyph_name(seq+missing_vowels[0]) in self:
                    largest_seq = seq
            # Split everything from the starting part of ligature_vowel.
            for l in ligature[0:len(ligature)-len(largest_seq)]:
                parts.append(l)
            if len(largest_seq):
                parts.append(largest_seq)
            sub = Substitution([[ligature_glyph_name]],replacement=[[SVGGlyph.get_glyph_name(l)] for l in parts])
            if split_cons_conj:
                split_cons_conj.addRule(sub)
            else:
                split_cons_conj = Routine(
                    rules=[sub], name='split_cons_conj', languages=LANGUAGE_MALAYALAM)
            rules.append(
                Chaining(
                    [[SVGGlyph.get_glyph_name(ligature)]],
                    postcontext=[missing_vowels_glyph_names],
                    lookups=[[split_cons_conj]],
                ),
            )
        routine = Routine(rules=rules, name=name, languages=LANGUAGE_MALAYALAM)
        self.fontFeatures.addFeature(feature, [routine])

    def build_abvm(self):
        feature = "abvm"
        name = "abvm_topmarks"
        top_mark_glyphs = [SVGGlyph.get_glyph_name(
            c) for c in self.get_glyphs_from_named_classes('ML_TOP_MARKS')]
        anchors = {}
        visual_center_anchor_name = "vc"
        lettersWithMarks = sorted(
            self.get_glyphs_from_named_classes('ML_CONSONANTS') +
            self.get_glyphs_from_named_classes('ML_REPH_CONJUNCTS') +
            self.get_glyphs_from_named_classes('ML_CONS_CONJUNCTS') +
            self.get_glyphs_from_named_classes('ML_LA_CONJUNCTS') +
            self.get_glyphs_from_named_classes('ML_TOP_MARKS')+
            ['\u25cc'] # Dotted circle.
        )
        vowel_signs = self.options.glyphs.classes['ML_VOWEL_SIGNS_CONJOINING']
        # FIXME, should do this for alt glyphs too
        for l in lettersWithMarks:
            glyph_name = SVGGlyph.get_glyph_name(l)
            if glyph_name not in self:
                continue
            glyph = self[glyph_name]
            for anchor in glyph.anchors:
                if visual_center_anchor_name == anchor.name:
                    anchors[glyph.name] = {anchor.name: (anchor.x, anchor.y)}

            if glyph.name not in anchors:
                anchors[glyph.name] = {
                    visual_center_anchor_name: (glyph.width/2, 0)}

            for vowel_sign in vowel_signs:
                letterWithVowel = SVGGlyph.get_glyph_name(
                    l)+SVGGlyph.get_glyph_name(vowel_sign, prefix="_")
                if letterWithVowel not in self:
                    continue
                glyphWithVowel = self[letterWithVowel]
                if glyphWithVowel.name not in anchors:
                    anchors[glyphWithVowel.name] = anchors[glyph.name]

        self.fontFeatures.anchors = anchors
        top_bases = {}
        top_marks = {}
        for glyphname, anchors in self.fontFeatures.anchors.items():
            for anchorname, position in anchors.items():
                if anchorname == visual_center_anchor_name:
                    if glyphname in top_mark_glyphs:
                        top_marks[glyphname] = position
                    else:
                        top_bases[glyphname] = position

        tops = Attachment(visual_center_anchor_name,
                          visual_center_anchor_name, top_bases, top_marks)
        routine = Routine(name=name, rules=[
                          tops], languages=LANGUAGE_MALAYALAM)
        self.fontFeatures.addFeature(feature, [routine])


    def build_blwm(self):
        feature = "blwm"
        name = "blwm_bottommarks"
        bottom_mark_glyphs = [SVGGlyph.get_glyph_name(
            c) for c in self.get_glyphs_from_named_classes('ML_BOTTOM_MARKS')]
        anchors = {}
        bbvm_anchor_name = "bottom"
        lettersWithMarks = sorted(
            self.get_glyphs_from_named_classes('ML_CONSONANTS')+
            self.get_glyphs_from_named_classes('ML_BOTTOM_MARKS')
        )
        for l in lettersWithMarks:
            glyph_name = SVGGlyph.get_glyph_name(l)
            if glyph_name not in self:
                continue
            glyph = self[glyph_name]
            for anchor in glyph.anchors:
                if bbvm_anchor_name == anchor.name:
                    anchors[glyph.name] = {anchor.name: (anchor.x, anchor.y)}

            if glyph.name not in anchors:
                anchors[glyph.name] = {
                    bbvm_anchor_name: (glyph.width,0)}

        self.fontFeatures.anchors = anchors
        bottom_bases = {}
        bottom_marks = {}
        for glyphname, anchors in self.fontFeatures.anchors.items():
            for anchorname, position in anchors.items():
                if anchorname == bbvm_anchor_name:
                    if glyphname in bottom_mark_glyphs:
                        bottom_marks[glyphname] = position
                    else:
                        bottom_bases[glyphname] = position

        bottoms = Attachment(bbvm_anchor_name,
                          bbvm_anchor_name, bottom_bases, bottom_marks)
        routine = Routine(name=name, rules=[
                          bottoms], languages=LANGUAGE_MALAYALAM)
        self.fontFeatures.addFeature(feature, [routine])

    def build_gpos(self):
        self.build_abvm()
        self.build_blwm()

    def build_gdef(self):
        ligatures = sorted(
            self.get_glyphs_from_named_classes('ML_CONSONANTS') +
            self.get_glyphs_from_named_classes('ML_REPH_CONJUNCTS') +
            self.get_glyphs_from_named_classes('ML_CONS_CONJUNCTS') +
            self.get_glyphs_from_named_classes('ML_LA_CONJUNCTS') +
            self.get_glyphs_from_named_classes('LATIN_EXTRA')
        )
        for ligature in ligatures:
            ligature_glyph_name = SVGGlyph.get_glyph_name(ligature)
            if ligature_glyph_name in self:
                self.fontFeatures.glyphclasses[ligature_glyph_name] = "ligature"

        for c in self.get_glyphs_from_named_classes('LC_ALL') + self.get_glyphs_from_named_classes('UC_ALL'):
            c_glyph_name = SVGGlyph.get_glyph_name(c)
            if c_glyph_name in self:
                self.fontFeatures.glyphclasses[c_glyph_name] = "base"

        for cons in self.get_glyphs_from_named_classes('ML_CONSONANTS'):
            cons_glyph_name = SVGGlyph.get_glyph_name(cons)
            if cons_glyph_name in self:
                self.fontFeatures.glyphclasses[cons_glyph_name] = "base"
        # Mark characters should be in the GDEF mark glyph class.
        # FIXME: Use unicode instead of glyph names so that glyph names are always
        # calculated
        marks = [
            'acutecmb', # U+0301
            'brevecmb', # U+0306
            'caroncmb', # U+030C
            'cedillacmb', # U+0327
            'circumflexcmb', # U+0302
            'commaaccent', # U+0326
            'commaturnedabovecmb', # U+0312
            'dieresiscmb', # U+0308
            'dotaccentcmb', # U+0307
            'gravecmb', # U+0300
            'hungarumlautcmb', # U+030B
            'macroncmb', # U+0304
            'ml_virama', # U+0D4D
            'ml_candrabindu', # U+0D01
            'ml_circular_virama', # U+0D3C
            'ml_combining_anusvara_above', # U+0D00
            # 'ml_sign_u', # U+0D41
            # 'ml_sign_uu', # U+0D42
            # 'ml_sign_vocalic_l', # U+0D62
            # 'ml_sign_vocalic_ll', # U+0D63
            # 'ml_sign_vocalic_r', # U+0D43
            # 'ml_sign_vocalic_rr', # U+0D44
            'ml_vertical_bar_virama', # U+0D3B
            'ml_dot_reph', # U+0D4E
            'ogonekcmb', # U+0328
            'ringcmb', # U+030A
            'tildecmb', # U+0303
        ]
        for mark in marks:
            self.fontFeatures.glyphclasses[mark] = "mark"


    def build_calt(self):
        feature = "calt"
        for script in self.options.glyphs.calts:
            name = f"{script}_calt_lookup"
            languages = eval(f"LANGUAGE_{script.upper()}")
            rules = []
            for calt_def in self.options.glyphs.calts[script]:
                precontext = SVGGlyph.get_glyph_name(calt_def[0])
                base = SVGGlyph.get_glyph_name(calt_def[1])
                replacement = base+"."+calt_def[2]
                rules.append(Substitution([[base]], [[replacement]], precontext=[[precontext]]))
            routine = Routine(name=name, rules=rules, languages=languages)
            self.fontFeatures.addFeature(feature, [routine])

    def build_salt(self):
        feature = "salt"
        name="salts_lookup"
        rules=[]
        for base, alts in self.salts.items():
            rules.append(Substitution([[base]], [[base] + alts]))
        routine = Routine(name=name, rules=rules )
        self.fontFeatures.addFeature(feature, [routine])

    def build_aalt(self):
        feature = "aalt"
        name="aalts_lookup"
        rules=[]
        for base, alts in self.salts.items():
            rules.append(Substitution([[base]], [alts]))
        routine = Routine(name=name, rules=rules )
        self.fontFeatures.addFeature(feature, [routine])

    def getFeatures(self):
        return self.fontFeatures.asFea()

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
        self.build_kern()
        self.build_gpos()
        self.build_gdef()
        self.build_conjuncts_fixup()
        self.build_calt()
        self.build_aalt()
        self.build_salt()
        self.features.text = self.getFeatures()

    def build(self, design_dir):
        empty_glyphs = {
            '.null': 0,
            'nonmarkingreturn': 0,
            'uni00A0': 0x00A0, # NBSP
            'uni00AD': 0x00AD, # Soft hyphen
            'zwnj': 0x200C,
            'zwj': 0x200D,
        }
        for g, u in empty_glyphs.items():
            glyph = Glyph()
            if u !=0 :
                glyph.unicodes = [u]
            self.insertGlyph(glyph, g)

        # Add space
        space = Glyph()
        space.width = 260
        space.unicodes = [0x0020]
        self.insertGlyph(space, 'space')
        # NBSP width must be same as Space width
        self['uni00A0'].width = space.width

        for f in sorted(os.listdir(design_dir)):
            if not f.endswith(".svg"):
                continue
            svg_glyph = SVGGlyph(os.path.join(design_dir, f))
            svg_glyph.parse()
            log.debug(f"{f} -> {svg_glyph.glyph_name}")
            self.insertGlyph(svg_glyph.glif, svg_glyph.glif.name)
            if svg_glyph.alt:
                if svg_glyph.glyph_name not in self.salts:
                    self.salts[svg_glyph.glyph_name]=[]

                self.salts[svg_glyph.glyph_name].append(svg_glyph.glif.name)

        # Even though we can flip the glyphs using transformation,
        # it is always better to design a glyph for that.
        # Flipping here won't work nicely with slanting for example.
        horizontally_flippables = {
            # '<': '>',
            # '«': '»',
            # '/': '\\',
            # '[': ']',
            # '{': '}',
            # '(': ')',
            # '‹': '›',
            # '„': '⹂'
        }
        for b, c in horizontally_flippables.items():
            compositename = SVGGlyph.get_glyph_name(c)
            basename = SVGGlyph.get_glyph_name(b)
            if not basename in self:
                log.warn(f"{basename} glyph not found for horizontal flipping")
                continue
            self.newGlyph(compositename)
            composite: Glyph = self[compositename]
            composite.unicodes = [ord(c)]
            component: Component = composite.instantiateComponent()
            component.baseGlyph = basename
            baseGlyph = self[basename]
            composite.width = baseGlyph.width
            # transformation = (xScale, xyScale, yxScale, yScale, xOffset, yOffset)
            component.transformation = (-1, 0, 0, 1, baseGlyph.width, 0)
            composite.appendComponent(component)
            log.debug(f"Compose {compositename}: Flip {basename}")

        # Even though we can append the glyphs, tt is always better
        # to design a glyph for that. Appending won't take the bearing values
        # into consideration
        appendables = {
            # 'ഈ': ['ഇ', 'ൗ'],
            # 'ഊ': ['ഉ', 'ൗ'],
            # 'ഐ': ['െ','എ'],
            # 'ഓ': ['ഒ', 'ാ'],
            # 'ഔ': ['ഒ', 'ൗ'],
            # 'ൊ': ['െ', 'ാ'],
            # 'ോ': ['േ', 'ാ'],
            # 'ൈ': ['െ', 'െ'],
            # 'ൌ': ['െ', 'ൗ'],
            # '"':['\'', '\''],
            #'“':['‘', '‘'],
            # '”':['’', '’'],
        }
        for c, parts in appendables.items():
            compositename = SVGGlyph.get_glyph_name(c)
            self.newGlyph(compositename)
            composite: Glyph = self[compositename]
            composite.unicodes = [ord(c)]
            composite.width = 0
            for part in parts:
                basename = SVGGlyph.get_glyph_name(part)
                if not basename in self:
                    log.warn(f"{basename} glyph not found for doubling")
                    continue
                baseGlyph = self[basename]
                component: Component = composite.instantiateComponent()
                component.move((composite.width ,0))
                component.baseGlyph = basename
                composite.width = composite.width + baseGlyph.width
                composite.appendComponent(component)

        diacritics = [
            '\u02c6', # 02c6 Circumflex accent
            '\u00b4', # 00b4 Acute accent
            '\u00b8', # 00b8 cedilla
            '˚', # 02da Ring above
            '¯', # 00af macron
            '`', # 0060 grave accent
            'ˇ', # 02c7 caron
            '¨', # 00a8 Diaeresis
            '˙', # 02d9 dot above
            '\u02dc', # 02dc Small tilde
            '\u02d8', # 02d8 Breve
            '\u02db', # 02db Ogonek
            '\u02dd', # 02dd Double acute accent
            '\u0326', # 0326 COMBINING COMMA BELOW
        ]
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
                assert diacritc_name in self
                if base_name in ['i', 'j']:
                    base_name = 'dotless' + base_name
                if base_name == 't' and diacritc_name == 'caron':
                    diacritc_name = 'quotesingle'
                if base_name == 'L' and diacritc_name == 'cedilla':
                    diacritc_name = 'commaaccent'
                if base_name == 'L' and diacritc_name == 'caron':
                    diacritc_name = 'quoteright'
                if base_name == 'l' and diacritc_name == 'caron':
                    diacritc_name = 'quoteright'
                if base_name == 'n' and diacritc_name == 'cedilla':
                    diacritc_name = 'commaaccent'
                if base_name == 'g' and diacritc_name == 'cedilla':
                    diacritc_name = 'commaturnedmod'
                items = [base_name, diacritc_name]
                assert base_name in self
                log.debug(
                    f"Compose {chr(composite_unicode)} - {composite_glyph_name} : {'+'.join(items)} : {composite_unicode}")
                self.buildComposite(composite_glyph_name,
                                    composite_unicode, items)

        for base in self.get_glyphs_from_named_classes('ML_CONSONANTS'):
            base_glyph_name = SVGGlyph.get_glyph_name(base)
            if base_glyph_name not in self:
                continue
            if base+'്ല' not in self.get_glyphs_from_named_classes('ML_LA_CONJUNCTS'):
                continue
            la_glyph_name = SVGGlyph.get_glyph_name(base+'്ല')
            la_sign_glyph_name = SVGGlyph.get_glyph_name('്ല')
            log.debug(
                f"Compose {la_glyph_name} : {base_glyph_name}+{la_sign_glyph_name}")
            self.buildComposite(la_glyph_name, None, [
                                base_glyph_name, la_sign_glyph_name])

        base_for_u = (
            self.get_glyphs_from_named_classes('ML_CONSONANTS') +
            self.get_glyphs_from_named_classes('ML_CONS_CONJUNCTS') +
            self.get_glyphs_from_named_classes('ML_LA_CONJUNCTS') +
            self.get_glyphs_from_named_classes('ML_REPH_CONJUNCTS')+
            ["്യ"]
        )

        for base in base_for_u:
            base_glyph_name = SVGGlyph.get_glyph_name(base)
            if base_glyph_name not in self:
                continue
            u_glyph_name = SVGGlyph.get_glyph_name(base+'ു')
            uu_glyph_name = SVGGlyph.get_glyph_name(base+'ൂ')

            if u_glyph_name not in self and u_glyph_name not in self.get_glyph_names_from_named_classes('ML_PREVENT_CONJUNCTS'):
                log.debug(
                    f"Compose {u_glyph_name} : {base_glyph_name}+uu_drop_sign")
                self.buildComposite(u_glyph_name, None, [
                                    base_glyph_name, 'u_drop_sign'])
                if base_glyph_name in self.salts:
                    u_glyph_name_alt = u_glyph_name.replace(base_glyph_name, self.salts[base_glyph_name][0] )
                    self.buildComposite(u_glyph_name_alt, None, [
                                    self.salts[base_glyph_name][0], 'u_drop_sign'])
                    self.salts[u_glyph_name]=[u_glyph_name_alt]
            if uu_glyph_name not in self and uu_glyph_name not in self.get_glyph_names_from_named_classes('ML_PREVENT_CONJUNCTS'):
                log.debug(
                    f"Compose {u_glyph_name} : {base_glyph_name}+uu_drop_sign")
                self.buildComposite(uu_glyph_name, None, [
                                    base_glyph_name, 'uu_drop_sign'])
                if base_glyph_name in self.salts:
                    uu_glyph_name_alt = uu_glyph_name.replace(base_glyph_name, self.salts[base_glyph_name][0] )
                    self.buildComposite(uu_glyph_name_alt, None, [
                                    self.salts[base_glyph_name][0], 'u_drop_sign'])
                    self.salts[uu_glyph_name]=[uu_glyph_name_alt]

        log.debug(f"Total glyph count: {len(self)}")

    @staticmethod
    def commonAnchor(setA, setB) -> str:
        nameSetA = [anchor["name"] for anchor in setA]
        nameSetB = [anchor["name"] for anchor in setB]
        commonNames = [name for name in nameSetA if name in nameSetB]
        if len(commonNames):
            return commonNames[0]
        return None

    def buildComposite(self, glyph_name: str, unicode, items: List):
        glyph_name = glyph_name.strip()
        self.newGlyph(glyph_name)
        composite: Glyph = self[glyph_name]
        composite.unicode = unicode
        base = items[0].strip()
        items = items[1:]
        component = composite.instantiateComponent()
        component.baseGlyph = base
        baseGlyph: Glyph = self[base]
        composite.width = baseGlyph.width
        composite.appendComponent(component)

        for glyphName in items:
            glyphName = glyphName.strip()
            baseAnchors = baseGlyph.anchors
            currentGlyph = self[glyphName]
            glyphAnchors = currentGlyph.anchors
            commonAnchorName = MalayalamFont.commonAnchor(
                baseAnchors, glyphAnchors)

            component = composite.instantiateComponent()
            component.baseGlyph = glyphName
            if commonAnchorName is None:
                # No common anchors. Avoid fallback. Just remove the glyph from font.
                del self[glyph_name]
                continue
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
        self.info.versionMajor = versionMajor
        self.info.versionMinor = versionMinor
        self.info.openTypeNameVersion = "Version %d.%03d" % (
            versionMajor, versionMinor)
        psFamily = re.sub(r'\s', '', self.options.name)
        psStyle = re.sub(r'\s', '', self.style)
        self.info.openTypeNameUniqueID = "%s-%s:%d" % (
            psFamily, psStyle, now.year)
        self.info.openTypeHeadCreated = now.strftime("%Y/%m/%d %H:%M:%S")

    def setFontInfo(self):
        name = self.options.name
        style = self.style
        repo = self.options.source

        # set various font metadata; see the full list of fontinfo attributes at
        # https://unifiedfontobject.org/versions/ufo3/fontinfo.plist/#generic-dimension-information
        self.info.unitsPerEm = int(self.options.unitsPerEm)
        # we just use a simple scheme that makes all sets of vertical metrics the same;
        # if one needs more fine-grained control they can fix up post build
        self.info.ascender = int(self.options.ascender)
        self.info.descender = int(self.options.descender)

        # Names
        self.info.familyName = name
        self.info.styleName = style
        self.info.copyright = f"Copyright {datetime.utcnow().year} The {name} Project Authors ({repo})"
        self.info.openTypeNameDesigner = f"{self.options.author.name} ({self.options.author.email})"
        self.info.openTypeNameDesignerURL = self.options.author.url
        self.info.openTypeNameLicense = self.options.license.text
        self.info.openTypeNameLicenseURL = self.options.license.url
        self.info.openTypeNameManufacturer = self.options.manufacturer.name
        self.info.openTypeOS2VendorID = self.info.openTypeNameManufacturer
        self.info.openTypeNameManufacturerURL = self.options.manufacturer.url

        # Metrics
        self.info.xHeight = 614
        self.info.capHeight = self.info.ascender
        self.info.guidelines = []
        self.info.italicAngle = 0

        # OpenType OS/2 Table - glyph metrics used historically by OS/2 and Windows platforms
        self.info.openTypeOS2CodePageRanges = [0, 1]
        self.info.openTypeOS2FamilyClass = [0, 0]
        self.info.openTypeOS2Panose = [0, 0, 8, 3, 0, 0, 0, 0, 0, 0]
        # set USE_TYPO_METRICS flag (OS/2.fsSelection bit 7) to make sure OS/2 Typo* metrics
        # are preferred to define Windows line spacing over legacy WinAscent/WinDescent:
        # https://docs.microsoft.com/en-us/typography/opentype/spec/os2#fsselection
        # The description of bit 7 in the OpenType standard reads
        # “if set, it is strongly recommended to use OS/2.sTypoAscender - OS/2.sTypoDescender + OS/2.sTypoLineGap
        # as a value for default line spacing for this font.”
        self.info.openTypeOS2Selection = [7]
        self.info.openTypeOS2Type = []
        # The TypoAscender minus the TypoDescender should equal the unit square.
        # the height of the ascenders in units
        self.info.openTypeOS2TypoAscender = round(self.info.ascender*1.2)
        # the depth of the descenders in units (negative value)
        self.info.openTypeOS2TypoDescender = -round(self.info.descender*1.2)
        self.info.openTypeOS2TypoLineGap = 0
        self.info.openTypeOS2UnicodeRanges = [0, 1, 2, 3, 23]
        self.info.openTypeOS2WeightClass = int(self.weight)
        self.info.openTypeOS2WidthClass = 5

        # A font's winAscent and winDescent values should be greater than the head
        # table's yMax, abs(yMin) values. If they are less than these values,
        # clipping can occur on Windows platforms
        # the top extremum of the font rendering box
        self.info.openTypeOS2WinAscent = 1223 # As calculated by Fontbakery
        # the bottom extremum of the font rendering box (positive value)
        self.info.openTypeOS2WinDescent = 919 # As calculated by Fontbakery
        # When the win Metrics are significantly greater than the upm, the
        # linespacing can appear too loose. To counteract this, enabling the OS/2
        # fsSelection bit 7 (Use_Typo_Metrics), will force Windows to use the OS/2
        # typo values instead. This means the font developer can control the
        # linespacing with the typo values, whilst avoiding clipping by setting the
        # win values to values greater than the yMax and abs(yMin).

        # HHEA table
        # OS/2 and hhea vertical metric values should match. This will produce the
        # same linespacing on Mac, GNU+Linux and Windows.

        # - Mac OS X uses the hhea values.
        # - Windows uses OS/2 or Win, depending on the OS or fsSelection bit value.
        # The height of the ascenders in units
        self.info.openTypeHheaAscender =  self.info.openTypeOS2TypoAscender
        # The depth of the descenders in units (negative value)
        self.info.openTypeHheaDescender =  self.info.openTypeOS2TypoDescender
        self.info.openTypeHheaLineGap = 0

        # postscript metrics
        # info.postscriptBlueValues=[00800800]
        self.info.postscriptFamilyBlues = []
        self.info.postscriptFamilyOtherBlues = []
        self.info.postscriptOtherBlues = []
        self.info.postscriptSlantAngle = 0
        self.info.postscriptStemSnapH = []
        self.info.postscriptStemSnapV = []
        self.info.postscriptUnderlinePosition = -700
        self.info.postscriptUnderlineThickness = 100
        self.info.postscriptUniqueID = 0
