from defcon import Font, Glyph, Layer
from operator import itemgetter
import copy
import ufo2ft
import sys
import logging

log = logging.getLogger(__name__)

config = {
    "layers": {
        "public.default": {
            "source": "fonts/ufo/Nupuram-Regular.ufo",
            "order": 1  # Foreground layer
        },
        "outline": {
            "source": "fonts/ufo/Nupuram-Outline.ufo",
            "order": 2  # Outline layer
        },
        "shadow": {
            "source": "fonts/ufo/Nupuram-Shadow.ufo",
            "order": 0  # background layer
        }
    },
    "pallettes": {
        "0": ["#E65100", "#FFCC80", "#FF9800"], # Orange
        "1": ["#212121", "#EEEEEE", "#9E9E9E"], # Gray
        "2": ["#263238", "#B0BEC5", "#607D8B"], # Blue Gray
        "3": ["#F57F17", "#FFF59D", "#FFEB3B"], # Yellow
        "4": ["#1B5E20", "#A5D6A7", "#4CAF50"], # Green
        "5": ["#01579B", "#81D4FA", "#03A9F4"], # Light Blue
        "6": ["#0D47A1", "#90CAF9", "#2196F3"], # Blue
        "7": ["#B71C1C", "#EF9A9A", "#F44336"], # Red
        "8": ["#4A148C", "#CE93D8", "#9C27B0"], # Purple
        "9": ["#004D40", "#80CBC4", "#009688"], # Teal
        "10": ["#3E2723", "#BCAAA4", "#795548"], # Brown
        "11": ["#880E4F", "#F48FB1", "#E91E63"], # Pink
        "12": ["#311B92", "#B39DDB", "#673AB7"], # Deep Purple
        "13": ["#1A237E", "#9FA8DA", "#3F51B5"], # Indigo
        "14": ["#006064", "#80DEEA", "#00BCD4"], # Cyan
        "15": ["#33691E", "#C5E1A5", "#8BC34A"], # Light Green
        "16": ["#827717", "#E6EE9C", "#CDDC39"], # Lime
        "17": ["#FF6F00", "#FFE082", "#FFC107"], # Amber
        "18": ["#BF360C", "#FFAB91", "#FF5722"], # Deep Orange
    }
}


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
            if "offset" in config["layers"][layer_name]:
                [offset_x, offset_y] = config["layers"][layer_name]["offset"]
                temp_glyph_name = f"{glyph.name}.temp"
                temp_glyph = layer.newGlyph(temp_glyph_name)
                component = temp_glyph.instantiateComponent()
                component.baseGlyph = glyph.name
                component.move((offset_x, offset_y))
                temp_glyph.appendComponent(component)
                temp_glyph.decomposeAllComponents()
                layer.insertGlyph(temp_glyph, glyph.name)
                del layer[temp_glyph_name]

        layer_mapping.append(
            [layer_name, config["layers"][layer_name]["order"]])


layer_mapping = sorted(layer_mapping, key=itemgetter(1))
font.lib[ufo2ft.constants.COLOR_LAYER_MAPPING_KEY] = layer_mapping

for index, layer_colors in config["pallettes"].items():
    CPAL_palette=[]
    for color in layer_colors:
        (r, g, b, a) = hex_to_rgba(color)
        CPAL_palette.append((r/255., g/255., b/255., a/255.0))
    CPAL_palettes.append(CPAL_palette)

font.lib[ufo2ft.constants.COLOR_PALETTES_KEY] = CPAL_palettes

font.save(sys.argv[1])
log.info(f"Color UFO font saved at {sys.argv[1]}")
