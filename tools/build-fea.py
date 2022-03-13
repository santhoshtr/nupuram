from fontFeatures import FontFeatures, Substitution, Routine, Chaining
from fontTools import agl

ML_GLYPH_NAME_DICT = {
    'അ': 'a', 'ആ': 'aa', 'ഇ': 'i', 'ഈ': 'ee', 'ഉ': 'u', 'ഊ': 'uu',
    'ഋ': 'ru',
    'എ': 'e', 'ഏ': 'e', 'ഐ': 'ai', 'ഒ': 'o', 'ഓ': 'o', 'ഔ': 'a',
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
    '\u200d': 'zwj',
    "ന്\u200d": 'chillu_n',
    "ര്\u200d": "chillu_r",
    "ല്\u200d": "chillu_l",
    "ള്\u200d": "chillu_lh",
    "ണ്\u200d": "chillu_nh",
    "ഴ്\u200d": "chillu_zh",
    "ക്\u200d": "chill_k",
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
ML_CONS_CONJUNCTS = ["കൢ", "ക്ക", "ക്ഷ", "ഗ്ഗ", "ഗ്ദ", "ഗ്ന", "ഗ്മ", "ങ്ങ", "ച്ച", "ച്ഛ", "ജ്ജ", "ഞ്ച", "ഞ്ജ", "ഞ്ഞ", "ട്ട", "ണ്ണ", "ക്ത", "ങ്ക", "ണ്ട", "ത്ത", "ത്ഥ", "ത്ന", "ത്ഭ",
                     "ദ്ദ", "ന്ന" "ത്സ", "ന്ത", "ന്ദ", "ന്ധ", "ന്മ", "ന്റ", "പ്പ", "പ്ഫ", "ബ്ബ", "മ്മ", "മ്പ", "യ്യ", "ല്ല", "വ്വ", "ശ്ച", "സ്സ", "ശ്ശ", "ഷ്ട", "ഹ്ന", "ഹ്മ", "ള്ള", "റ്റ"]
ML_REPH_CONJUNCTS = ["ക്ര", "ക്ക്ര", "ക്ത്ര", "ഗ്ര", "ഘ്ര", "ങ്ക്ര", "ച്ര", "ജ്ര", "ട്ര", "ഡ്ര", "ഢ്ര", "ണ്ട്ര", "ത്ര", "ത്ത്ര",
                     "ത്സ്ര", "ദ്ര", "ന്ത്ര", "ന്ദ്ര", "ന്ധ്ര", "പ്ര", "ഫ്ര", "ബ്ര", "മ്ര", "മ്പ്ര", "വ്ര", "ശ്ര", "സ്ര", "ഹ്ര", "ഷ്ര", "റ്റ്ര"]

LANGUAGE_MALAYALAM = [('mlm2', 'dflt')]
LANGUAGE_LATIN = [('DFLT', 'dflt'), ('latn', 'dflt')]


def get_glyph_name(l, prefix="ml_"):
    if l in ML_GLYPH_NAME_DICT:
        return prefix + ML_GLYPH_NAME_DICT.get(l)
    if len(l) == 1:
        return agl.UV2AGL.get(ord(l))
    if len(l) > 1:
        return prefix + "_".join(ML_GLYPH_NAME_DICT.get(c, c) for c in l)
    return l


def build_latin_ligatures(ff):
    feature = "liga"
    name = "latin_ligatures"
    ligatures = ["ffi", "ff", "ee", "th", "ft", "fi", "tt"]

    rules = []
    for ligature in ligatures:
        sub = Substitution([[get_glyph_name(l)] for l in ligature],
                           replacement=[[get_glyph_name(ligature)]])
        rules.append(sub)
    routine = Routine(rules=rules, name=name, languages=LANGUAGE_LATIN)
    ff.addFeature(feature, [routine])


def build_chillus(ff):
    feature = "akhn"
    name = "zwj_chillus"
    chillus = ["ന്\u200d", "ര്\u200d", "ല്\u200d",
               "ള്\u200d", "ണ്\u200d", "ഴ്\u200d", "ക്\u200d"]

    rules = []
    for chillu in chillus:
        rules.append(
            Substitution([[get_glyph_name(l)] for l in chillu],
                         replacement=[[get_glyph_name(chillu)]])
        )
    routine = Routine(rules=rules, name=name, languages=LANGUAGE_MALAYALAM)
    ff.addFeature(feature, [routine])


def build_cons_la(ff):
    feature = "akhn"
    name = "cons_la"

    rules = []
    for conjunct in ML_LA_CONJUNCTS:
        rules.append(
            Substitution([[get_glyph_name(l)] for l in conjunct],
                         replacement=[[get_glyph_name(conjunct)]])
        )
    routine = Routine(rules=rules, name=name, languages=LANGUAGE_MALAYALAM)
    ff.addFeature(feature, [routine])


def build_cons_signs(ff):
    feature = "pstf"
    name = "cons_signs"
    cons_signs = ["്യ", "്വ"]
    rules = []
    for cons_sign in cons_signs:
        rules.append(
            Substitution([[get_glyph_name(l)] for l in cons_sign],
                         replacement=[[get_glyph_name(cons_sign)]])
        )
    routine = Routine(rules=rules, name=name, languages=LANGUAGE_MALAYALAM)
    ff.addFeature(feature, [routine])


def build_cons_signs_order_fix(ff):
    feature = "pstf"
    name = "cons_signs_fix_order"
    cons_signs = ["്യ", "്വ"]
    reph = "്ര"
    rules = []
    for cons_sign in cons_signs:
        rules.append(
            Substitution([[get_glyph_name(cons_sign)]],
                         replacement=[[get_glyph_name(l)] for l in cons_sign])
        )
    split_cons_signs = Routine(rules=rules, name='split_cons_signs', languages=[
        ('mlm2', 'dflt')])

    rules = [
        # Avoid യ + ് + ര ligature
        Chaining(
            [[get_glyph_name(reph)]],
            precontext=[[get_glyph_name("യ")]],
            lookups=[[split_cons_signs]],
        ),
        # Split reph in  ്യ + ്ര combination
        Chaining(
            [[get_glyph_name(reph)]],
            precontext=[[get_glyph_name(cons_signs[0])]],
            lookups=[[split_cons_signs]],
        ),
        # Split reph in ്വ + ്ര combination
        Chaining(
            [[get_glyph_name(reph)]],
            precontext=[[get_glyph_name(cons_signs[1])]],
            lookups=[[split_cons_signs]],
        )]
    split_cons_signs = Routine(
        rules=rules, name=name, languages=LANGUAGE_MALAYALAM)

    ff.addFeature(feature, [split_cons_signs])


def build_ra_sign(ff):
    feature = "pref"
    name = "pref_reph"
    reph = "്ര"
    rule = Substitution([[get_glyph_name(l)] for l in reph],
                        replacement=[[get_glyph_name(reph)]])
    routine = Routine(rules=[rule], name=name, languages=[
        ('mlm2', 'dflt')])
    ff.addFeature(feature, [routine])


def build_conjuncts(ff):
    feature = "akhn"
    name = "akhn_conjuncts"
    rules = []
    for conjunct in ML_CONS_CONJUNCTS:
        rules.append(
            Substitution([[get_glyph_name(l)] for l in conjunct],
                         replacement=[[get_glyph_name(conjunct)]])
        )
    routine = Routine(rules=rules, name=name, languages=LANGUAGE_MALAYALAM)
    ff.addFeature(feature, [routine])


def build_cons_ra_substitutions(ff):
    feature = "pres"
    name = "pres_reph"
    reph = "്ര"
    rules = []
    for ligature in ML_REPH_CONJUNCTS:
        ligature = ligature.replace(reph, '')
        sub = Substitution(
            [[get_glyph_name(reph)], [get_glyph_name(ligature)]],
            replacement=[[get_glyph_name(ligature)+get_glyph_name(reph, prefix="_")]])
        rules.append(sub)

    routine = Routine(rules=rules, name=name, languages=LANGUAGE_MALAYALAM)
    ff.addFeature(feature, [routine])


def build_cons_conj_vowel_signs(ff):
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
            replacement_ligature = get_glyph_name(
                ligature)+get_glyph_name(vowel_sign, prefix="_")
            sub = Substitution(
                [[get_glyph_name(ligature)], [get_glyph_name(vowel_sign)]],
                replacement=[[replacement_ligature]])
            rules.append(sub)

    routine = Routine(rules=rules, name=name, languages=LANGUAGE_MALAYALAM)
    ff.addFeature(feature, [routine])


def build():
    ff = FontFeatures()
    # Latin GSUB
    build_latin_ligatures(ff)
    # Malayalam GSUB
    build_chillus(ff)
    build_conjuncts(ff)
    build_cons_la(ff)
    build_cons_signs(ff)
    build_cons_signs_order_fix(ff)
    build_ra_sign(ff)
    build_cons_ra_substitutions(ff)
    build_cons_conj_vowel_signs(ff)
    return ff.asFea()


print(build())
