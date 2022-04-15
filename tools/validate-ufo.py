
from fontTools.ufoLib.glifLib import GlifLibError
from defcon import Font
import sys

ufo = Font(sys.argv[1])
for layer in ufo.layers:
    for glyphName in layer.keys():
        try:
            layer[glyphName]
        except GlifLibError:
            print(layer.name, glyphName)