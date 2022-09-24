"""
Generate STAT tables for a Variable Font Family
"""
from fontTools import ttLib
from fontTools.otlLib.builder import buildStatTable
import sys
import logging

log = logging.getLogger(__name__)

axes = [
    dict(
        tag="slnt",
        name="Slant",
        values=[
            dict(value=0, name="Default", flags=0x2),
            dict(value=20, name="Oblique"),
        ],
    ),
    dict(
        tag="soft",
        name="Soft",
        values=[
            dict(value=0, name="Sharp"),
            dict(value=50, name="Soft", flags=0x2),
            dict(value=100, name="SuperSoft"),
        ],
    ),
    dict(
        tag="wght",
        name="Weight",
        values=[
            dict(value=100, name="Thin"),
            dict(value=200, name="ExtraLight"),
            dict(value=300, name="Light"),
            dict(value=400, name="Regular", flags=0x2, linkedValue=700),
            dict(value=500, name="Medium"),
            dict(value=600, name="SemiBold"),
            dict(value=700, name="Bold"),
            dict(value=800, name="ExtraBold"),
            dict(value=900, name="Black"),
        ],
    ),
    dict(
        tag="wdth",
        name="Width",
        values=[
            dict(value=75, name="Condensed"),
            dict(value=87.5, name="SemiCondensed"),
            dict(value=100, name="Normal", flags=0x2),
            dict(value=112.5, name="SemiExpanded"),
            dict(value=125, name="Expanded"),
        ],
    ),
]

locations = [
    # dict(name='Regular C', location=dict(wght=300, ABCD=100)),
    # dict(name='Bold ABCD XYZ', location=dict(wght=600, ABCD=200)),
]

def make_stat(fontFile):
    log.debug(f"Creating STAT table in {fontFile}")
    ttFont = ttLib.TTFont(fontFile)
    buildStatTable(ttFont, axes, locations)
    ttFont.save(fontFile)


if __name__ == "__main__":
    make_stat(sys.argv[1])
