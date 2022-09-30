from defcon import Font, Layer
from munch import DefaultMunch
from operator import itemgetter
import copy
import yaml
import ufo2ft
import sys
import logging

log = logging.getLogger(__name__)

colorConfig = DefaultMunch.fromDict(
        yaml.load(open("config.yaml"), Loader=yaml.FullLoader))

config=colorConfig.colorfonts[sys.argv[1]]

def hex_to_rgba(hexcolor):
    hexcolor=hexcolor.lstrip('#')
    if len(hexcolor)==6:
        hexcolor = hexcolor+"FF"
    return tuple(int(hexcolor[i:i+2], 16) for i in (0, 2, 4, 6))

layer_mapping = []
CPAL_palettes = []
for layer_name in config["layers"]:
    if layer_name == 'public.default':
        layer_mapping.append(
            [layer_name, config["layers"][layer_name]["order"]])
        font = Font(config["layers"][layer_name]["source"])
    else:
        if not font:
            raise ValueError(
                "Default font not found. Define default source as first item in layers")
        layer: Layer = font.newLayer(layer_name)
        layer_font: Font = Font(config["layers"][layer_name]["source"])
        for base_glyph in layer_font:
            base_glyph.decomposeAllComponents()
            glyph = copy.deepcopy(base_glyph)
            layer.insertGlyph(glyph, glyph.name)

        layer_mapping.append(
            [layer_name, config["layers"][layer_name]["order"]])


layer_mapping = sorted(layer_mapping, key=itemgetter(1))
font.lib[ufo2ft.constants.COLOR_LAYER_MAPPING_KEY] = layer_mapping

for layer_colors in config["pallettes"]:
    CPAL_palette=[]
    for color in layer_colors:
        (r, g, b, a) = hex_to_rgba(color)
        CPAL_palette.append((r/255., g/255., b/255., a/255.0))
    CPAL_palettes.append(CPAL_palette)

font.lib[ufo2ft.constants.COLOR_PALETTES_KEY] = CPAL_palettes
font.info.familyName =config['familyname']

font.save(sys.argv[1])
log.info(f"Color UFO font saved at {sys.argv[1]}")
