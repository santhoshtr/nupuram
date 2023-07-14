import copy
import logging
import sys
from operator import itemgetter

import ufo2ft
import yaml
from munch import DefaultMunch
from ufoLib2.objects import Font, Layer

log = logging.getLogger(__name__)

colorConfig = DefaultMunch.fromDict(yaml.load(open("config.yaml"), Loader=yaml.FullLoader))

config = colorConfig.colorfonts[sys.argv[1]]


def hex_to_rgba(hexcolor):
    hexcolor = hexcolor.lstrip("#")
    if len(hexcolor) == 6:
        hexcolor = hexcolor + "FF"
    return tuple(int(hexcolor[i : i + 2], 16) for i in (0, 2, 4, 6))


layer_mapping = []
CPAL_palettes = []
for layer_name in config["layers"]:
    if layer_name == "public.default":
        layer_mapping.append([layer_name, config["layers"][layer_name]["order"]])
        font = Font().open(config["layers"][layer_name]["source"])
    else:
        if not font:
            raise ValueError("Default font not found. Define default source as first item in layers")
        layer: Layer = font.newLayer(layer_name)
        layer_font: Font = Font().open(config["layers"][layer_name]["source"])
        for base_glyph in layer_font:
            glyph = copy.deepcopy(base_glyph)
            layer.insertGlyph(glyph, glyph.name)

        layer_mapping.append([layer_name, config["layers"][layer_name]["order"]])


layer_mapping = sorted(layer_mapping, key=itemgetter(1))
font.lib[ufo2ft.constants.COLOR_LAYER_MAPPING_KEY] = layer_mapping

for layer_colors in config["pallettes"]:
    CPAL_palette = []
    for color in layer_colors:
        (r, g, b, a) = hex_to_rgba(color)
        CPAL_palette.append((r / 255.0, g / 255.0, b / 255.0, a / 255.0))
    CPAL_palettes.append(CPAL_palette)

font.lib[ufo2ft.constants.COLOR_PALETTES_KEY] = CPAL_palettes
font.info.familyName = config["familyname"]

font.save(sys.argv[1], overwrite=True)
log.info(f"Color UFO font saved at {sys.argv[1]}")
