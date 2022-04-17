from defcon import Font, Glyph, Layer
from operator import itemgetter
import copy
import ufo2ft
import sys
import logging

log = logging.getLogger(__name__)

config = {
    "layers": {
        "regular": {
            "source": "sources/Seventy-Regular.ufo",
            "order": 1,  # Foreground layer
            "color": [255, 153, 85, 1]
        },
        "outline": {
            "source": "sources/Seventy-Outline.ufo",
            "order": 2,  # background layer
            "color": [85, 34, 0, 1],
        },
        "shadow": {
            "source": "sources/Seventy-Shadow.ufo",
            "order": 0,  # background layer
            "color": [85, 34, 0, 1]
        }
    }
}


layer_mapping = []
CPAL_palette = []
for layer_name in config["layers"]:
    if layer_name == 'regular':
        layer_mapping.append(
            ['public.default', config["layers"]["regular"]["order"]])
        font = Font(config["layers"]["regular"]["source"])
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
    [r, g, b, a] = config["layers"][layer_name]["color"]
    CPAL_palette.append((r/255., g/255., b/255., 1.0))

layer_mapping = sorted(layer_mapping, key=itemgetter(1))
CPAL_palette = sorted(CPAL_palette, key=itemgetter(1))
font.lib[ufo2ft.constants.COLOR_LAYER_MAPPING_KEY] = layer_mapping
font.lib[ufo2ft.constants.COLOR_PALETTES_KEY] = [
    CPAL_palette]

font.save(sys.argv[1])
log.info(f"Color UFO font saved at {sys.argv[1]}")
