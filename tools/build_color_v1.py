from fontTools import ttLib
from fontTools.colorLib import builder
from fontTools.ttLib.tables import otTables as ot
import sys
import logging
from io import BytesIO
import uharfbuzz as hb

log = logging.getLogger(__name__)

with open(sys.argv[1], "rb") as f:
    fontData = f.read()

font = ttLib.TTFont(BytesIO(fontData))
hbFont = hb.Font(hb.Face(fontData, 0))

colr0 = font["COLR"]
cpal = font["CPAL"]
cpal.numPaletteEntries = len(cpal.palettes[0])

colrv1_map = {}
clipBoxes = {}

def getGlyphBounds(font, glyphName):
    gid = font.getGlyphID(glyphName)
    assert gid is not None, glyphName
    x, y, w, h = hbFont.get_glyph_extents(gid)
    # convert from HB's x/y_bearing + extents to xMin, yMin, xMax, yMax
    y += h
    h = -h
    w += x
    h += y
    # Since the shadow extends beyond width and height, increase them by a factor.
    return x, y, w*1.25, h*1.25

for glyph_name, layers in colr0.ColorLayers.items():
    v1_layers = []
    colrv1_map[glyph_name] = (ot.PaintFormat.PaintColrLayers, v1_layers)

    for layer in layers:
        # Match COLRv0 fill

        if cpal.numPaletteEntries == 2:
            v1_layers.append({
                "Format": ot.PaintFormat.PaintGlyph,
                "Paint": {
                    "Format": ot.PaintFormat.PaintSolid,
                    "PaletteIndex": layer.colorID,
                    "Alpha": 1,
                },
                "Glyph": layer.name,
            })
        else:
            if layer.colorID == 0: # Shadow
                c1 = 0
                c2 = 2
            if layer.colorID == 1: #  Main
                c1 = 2
                c2 = 1
            v1_layers.append({
                "Format": ot.PaintFormat.PaintGlyph,
                "Paint":  {
                    "Format": ot.PaintFormat.PaintLinearGradient,
                    "ColorLine": {
                        "ColorStop": [(0.0, c1), (1.0, c2)],
                        "Extend": "reflect"
                    },
                    "x0": 0,
                    "y0": 0,
                    "x1": 0,
                    "y1": 400,
                    "x2": 100,
                    "y2": 0,
                },
                "Glyph": layer.name,
            })
        clipBoxes[glyph_name] = getGlyphBounds(font, glyph_name)

    # If there is only one layer, simplify
    if len(v1_layers) == 1:
        colrv1_map[glyph_name] = v1_layers[0]


# pprint.PrettyPrinter(indent=2).pprint(colrv1_map)

font["COLR"] = builder.buildCOLR(colrv1_map, clipBoxes=clipBoxes)
font.save(sys.argv[2])
log.info(f"Colrv1 saved at {sys.argv[2]}")
