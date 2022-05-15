from fontTools import ttLib
from fontTools.colorLib import builder
from fontTools.ttLib.tables import otTables as ot
import sys
import logging

log = logging.getLogger(__name__)

font = ttLib.TTFont(sys.argv[1])

colr0 = font["COLR"]
cpal = font["CPAL"]
cpal.numPaletteEntries = len(cpal.palettes[0])

colrv1_map = {}

for glyph_name, layers in colr0.ColorLayers.items():
    v1_layers = []
    colrv1_map[glyph_name] = (ot.PaintFormat.PaintColrLayers, v1_layers)

    for layer in layers:
        # Match COLRv0 fill
        fill = {
            "Format": ot.PaintFormat.PaintSolid,
            "PaletteIndex": layer.colorID,
            "Alpha": 1,
        }
        v1_layers.append({
            "Format": ot.PaintFormat.PaintGlyph,
            "Paint": fill,
            "Glyph": layer.name,
        })

    if len(v1_layers) == 1:
        colrv1_map[glyph_name] = v1_layers[0]

    # Special palette to follow css color
    # fill = {
    #     "Format": ot.PaintFormat.PaintSolid,
    #     "PaletteIndex": 65535,
    #     "Alpha": 1,
    # }
    # v1_layers.append({
    #     "Format": ot.PaintFormat.PaintGlyph,
    #     "Paint": fill,
    #     "Glyph": glyph_name,
    # })

# pprint.PrettyPrinter(indent=2).pprint(colrv1_map)

font["COLR"] = builder.buildCOLR(colrv1_map)
font.save(sys.argv[2])
log.info(f"Colrv1 saved at {sys.argv[2]}")
