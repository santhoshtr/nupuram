"""
Generate STAT tables for a Variable Font Family
"""
import logging
import sys

import yaml
from fontTools import ttLib
from fontTools.otlLib.builder import buildStatTable
from munch import DefaultMunch

log = logging.getLogger(__name__)

config = DefaultMunch.fromDict(yaml.load(open("config.yaml"), Loader=yaml.FullLoader))


def make_stat(stat, fontFile):
    log.debug(f"Creating STAT table in {fontFile}")
    ttFont = ttLib.TTFont(fontFile)
    buildStatTable(ttFont, stat.axes)
    ttFont.save(fontFile)


if __name__ == "__main__":
    varconfig = config.variablefonts[sys.argv[1]]
    fontFile = sys.argv[2]
    make_stat(varconfig.stat, fontFile)
