
import logging
import os
import re
from datetime import datetime
from typing import List

from defcon import Font, Glyph, Anchor
from fontFeatures import (Chaining, FontFeatures, Positioning, Routine, Attachment,
                          Substitution, ValueRecord)
from fontTools import agl

from svgglyph import SVGGlyph

log = logging.getLogger(__name__)

LANGUAGE_MALAYALAM = [('mlm2', 'dflt')]
LANGUAGE_LATIN = [('DFLT', 'dflt'), ('latn', 'dflt')]


class MalayalamFont(Font):
    def __init__(self, options, style=""):
        Font.__init__(self)
        self.options = options
        self.style = style
        self.fontFeatures = FontFeatures()
        self.available_svgs = []

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
            if conjunct_glyph_name not in self:
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
            self.get_glyphs_from_named_classes('ML_LA_CONJUNCTS'))

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
        split_rules = []
        split_cons_conj = None
        for ligature in ligatures:
            ligature_glyph_name = SVGGlyph.get_glyph_name(ligature)
            if ligature_glyph_name not in self:
                continue
            missing_vowels = []
            for vowel_sign in vowel_signs:
                replacement_ligature = SVGGlyph.get_glyph_name(
                    ligature)+SVGGlyph.get_glyph_name(vowel_sign, prefix="_")
                ligature_glyph_name = SVGGlyph.get_glyph_name(ligature)
                if ligature_glyph_name not in self:
                    continue
                if replacement_ligature not in self:
                    missing_vowels.append(SVGGlyph.get_glyph_name(vowel_sign))

            # TODO do not break up the entire ligature. May only the last virama+cons part alone
            sub = Substitution([[ligature_glyph_name]],
                               replacement=[[SVGGlyph.get_glyph_name(l)] for l in ligature])
            if not split_cons_conj:
                split_cons_conj = Routine(
                    rules=[sub], name='split_cons_conj', languages=LANGUAGE_MALAYALAM)
            else:
                split_cons_conj.addRule(sub)
            rules.append(
                Chaining(
                    [[SVGGlyph.get_glyph_name(ligature)]],
                    postcontext=[missing_vowels],
                    lookups=[[split_cons_conj]],
                ),
            )
        routine = Routine(rules=rules, name=name, languages=LANGUAGE_MALAYALAM)
        self.fontFeatures.addFeature(feature, [routine])

    def build_gpos(self):
        feature = "abvm"
        name = "abvm_topmarks"
        top_mark_glyphs = [SVGGlyph.get_glyph_name(
            c) for c in self.get_glyphs_from_named_classes('ML_TOP_MARKS')]
        anchors = {}
        visual_center_anchor_name = "vc"
        lettersWithMarks = sorted(
            self.get_glyphs_from_named_classes('ML_REPH_CONJUNCTS') +
            self.get_glyphs_from_named_classes('ML_CONS_CONJUNCTS') +
            self.get_glyphs_from_named_classes('ML_LA_CONJUNCTS') +
            self.get_glyphs_from_named_classes('ML_TOP_MARKS')
        )
        vowel_signs = self.options.glyphs.classes['ML_VOWEL_SIGNS_CONJOINING']
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

        self.fontFeatures.glyphclasses[SVGGlyph.get_glyph_name('്')] = "mark"
        self.fontFeatures.glyphclasses[SVGGlyph.get_glyph_name('ൎ')] = "mark"

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
        self.build_latin_pos()
        self.build_gpos()
        self.build_gdef()
        self.build_conjuncts_fixup()
        self.features.text = self.getFeatures()

    def build(self, design_dir):
        self.newGlyph('.null')
        self.newGlyph('nonmarkingreturn')
        self.newGlyph('.notdef')
        # Add space
        space = Glyph()
        space.width = 200
        space.unicodes = [0x0020]
        self.insertGlyph(space, 'space')

        for f in sorted(os.listdir(design_dir)):
            if not f.endswith(".svg"):
                continue
            svg_glyph = SVGGlyph(os.path.join(design_dir, f))
            svg_glyph.parse()
            log.debug(f"{f} -> {svg_glyph.glyph_name}")
            self.insertGlyph(svg_glyph.glif, svg_glyph.glyph_name)

        # ZWJ and ZWNJ
        zwnj = Glyph()
        zwnj.unicodes = [0x200C]
        self.insertGlyph(zwnj, 'zwnj')

        zwj = Glyph()
        zwj.unicodes = [0x200D]
        self.insertGlyph(zwj, 'zwj')

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
                if diacritc_name not in self:
                    continue
                if base_name not in self:
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
            self.get_glyphs_from_named_classes('ML_REPH_CONJUNCTS')
        )
        for base in base_for_u:
            base_glyph_name = SVGGlyph.get_glyph_name(base)
            if base_glyph_name not in self:
                continue
            u_glyph_name = SVGGlyph.get_glyph_name(base+'ു')
            uu_glyph_name = SVGGlyph.get_glyph_name(base+'ൂ')

            if u_glyph_name not in self:
                log.debug(
                    f"Compose {u_glyph_name} : {base_glyph_name}+uu_drop_sign")
                self.buildComposite(u_glyph_name, None, [
                                    base_glyph_name, 'u_drop_sign'])
            if uu_glyph_name not in self:
                log.debug(
                    f"Compose {u_glyph_name} : {base_glyph_name}+uu_drop_sign")
                self.buildComposite(uu_glyph_name, None, [
                                    base_glyph_name, 'uu_drop_sign'])

        # for base in self.get_glyphs_from_named_classes('ML_CONSONANTS'):
        #     base_glyph_name = SVGGlyph.get_glyph_name(base)
        #     ru_glyph_name = SVGGlyph.get_glyph_name(base+'ൃ')
        #     if ru_glyph_name not in self:
        #         log.debug(
        #             f"Compose {ru_glyph_name} : {base_glyph_name}+ru_bottom_sign")
        #         self.buildComposite(ru_glyph_name, None, [
        #             base_glyph_name, 'ru_bottom_sign'])

        log.info(f"Total glyph count: {len(self)}")

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
                if len(baseAnchors) == 0 and len(glyphAnchors) == 0:
                   # Just append to the right
                    x = baseGlyph.width
                    y = 0
                    composite.width = composite.width + currentGlyph.width
                    component.move((x, y))
                else:
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
        self.info.unitsPerEm = 1000
        # we just use a simple scheme that makes all sets of vertical metrics the same;
        # if one needs more fine-grained control they can fix up post build
        self.info.ascender = (
            self.info.openTypeHheaAscender
        ) = self.info.openTypeOS2TypoAscender = 800
        self.info.descender = (
            self.info.openTypeHheaDescender
        ) = self.info.openTypeOS2TypoDescender = 200
        self.info.openTypeHheaLineGap = self.info.openTypeOS2TypoLineGap = 0

        # Names
        self.info.familyName = name
        self.info.styleMapFamilyName = self.info.familyName
        self.info.styleName = style
        self.info.copyright = f"Copyright {datetime.utcnow().year} The {name} Project Authors ({repo})"
        self.info.openTypeNameDesigner = f"{self.options.author.name} &lt;{self.options.author.email}&gt"
        self.info.openTypeNameDesignerURL = self.options.author.url
        self.info.openTypeNameLicense = self.options.license.text
        self.info.openTypeNameLicenseURL = self.options.license.url
        self.info.openTypeNameManufacturer = self.options.manufacturer.name
        self.info.openTypeOS2VendorID = self.info.openTypeNameManufacturer
        self.info.openTypeNameManufacturerURL = self.options.manufacturer.url

        # Metrics
        self.info.xHeight = 700
        self.info.capHeight = 800
        self.info.guidelines = []
        self.info.italicAngle = 0

        # OpenType OS/2 Table
        self.info.openTypeOS2CodePageRanges = [0, 1]
        self.info.openTypeOS2FamilyClass = [0, 0]
        self.info.openTypeOS2Panose = [0, 0, 8, 3, 0, 0, 0, 0, 0, 0]
        # set USE_TYPO_METRICS flag (OS/2.fsSelection bit 7) to make sure OS/2 Typo* metrics
        # are preferred to define Windows line spacing over legacy WinAscent/WinDescent:
        # https://docs.microsoft.com/en-us/typography/opentype/spec/os2#fsselection
        self.info.openTypeOS2Selection = [7]
        self.info.openTypeOS2Type = []
        self.info.openTypeOS2TypoAscender = self.info.ascender+100
        self.info.openTypeOS2TypoDescender = -(self.info.descender+100)
        self.info.openTypeOS2TypoLineGap = 0
        self.info.openTypeOS2UnicodeRanges = [0, 1, 2, 3, 23]
        self.info.openTypeOS2WeightClass = 400
        self.info.openTypeOS2WidthClass = 5
        self.info.openTypeOS2WinAscent = self.info.openTypeOS2TypoAscender
        self.info.openTypeOS2WinDescent = self.info.openTypeOS2TypoDescender * -1

        # postscript metrics
        # info.postscriptBlueValues=[00800800]
        self.info.postscriptFamilyBlues = []
        self.info.postscriptFamilyOtherBlues = []
        self.info.postscriptOtherBlues = []
        self.info.postscriptSlantAngle = 0
        self.info.postscriptStemSnapH = []
        self.info.postscriptStemSnapV = []
        self.info.postscriptUnderlinePosition = -603
        self.info.postscriptUnderlineThickness = 100
        self.info.postscriptUniqueID = 0
