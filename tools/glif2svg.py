import os
import os.path

from fontTools.ufoLib import pointPen
from fontTools.pens.svgPathPen import SVGPathPen
from defcon import Glyph, Font
import xml.etree.ElementTree as etree

def glif2svg(font: Font, glyph_name: str) -> str:
    glyph = Glyph()
    sp = SVGPathPen(None)
    ptsp = pointPen.PointToSegmentPen(sp)
    if glyph_name not in font:
        raise ValueError(f"{glyph_name} not in the given font")
    glyph: Glyph = font[glyph_name]
    glyph.draw(sp)
    root = etree.Element("svg")
    # sp.maxx = glyph.width
    root.set("viewBox", "0 0 1000 1000")
    root.set("width", "1000")
    root.set("height", "1000")
    root.set("version", "1.1")
    root.set("xmlns", "http://www.w3.org/2000/svg")
    root.set("xmlns:sodipodi", "http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd")
    path = etree.Element("path")
    path.set("d", sp.getCommands())
    path.set("transform", "scale(1,-1) translate(0,-800)")
    root.append(path)
    return etree.tostring(root, encoding="utf8", xml_declaration=True).decode("utf8")

if __name__ == "__main__":
    f=Font("build/Seventy-Regular.ufo")
    svg = glif2svg(f, "A")
    print(svg)