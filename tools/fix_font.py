from fontTools import ttLib
from fontTools.ttLib.tables import ttProgram
import sys
import logging

log = logging.getLogger(__name__)


def fix_font(fontFile):
    log.debug(f"Fixing {fontFile}")
    ttFont = ttLib.TTFont(fontFile)
    # add_dummy_dsig(ttFont)
    fix_unhinted_font(ttFont)
    fix_fs_type(ttFont)
    remove_aat(ttFont)
    ttFont.save(fontFile)

def fix_unhinted_font(ttFont: ttLib.TTFont):
    """Improve the appearance of an unhinted font on Win platforms by:
        - Add a new GASP table with a newtable that has a single
        range which is set to smooth.
        - Add a new prep table which is optimized for unhinted fonts.
    """
    gasp = ttLib.newTable("gasp")
    # Set GASP so all sizes are smooth
    gasp.gaspRange = {0xFFFF: 15}

    program = ttProgram.Program()
    assembly = ["PUSHW[]", "511", "SCANCTRL[]",
                "PUSHB[]", "4", "SCANTYPE[]"]
    program.fromAssembly(assembly)

    prep = ttLib.newTable("prep")
    prep.program = program

    ttFont["gasp"] = gasp
    ttFont["prep"] = prep

def fix_fs_type(ttFont: ttLib.TTFont):
    """Set the OS/2 table's fsType flag to 0 (Installable embedding).
    Args:
        ttFont: a TTFont instance
    """
    old = ttFont["OS/2"].fsType
    ttFont["OS/2"].fsType = 0
    return old != 0

def remove_aat(ttFont: ttLib.TTFont):
    """Unwanted AAT tables were found in the font and should be removed .
    Args:
        ttFont: a TTFont instance
    """
    unwanted_tables = [
        'EBSC', 'Zaph', 'acnt', 'ankr', 'bdat', 'bhed', 'bloc',
        'bmap', 'bsln', 'fdsc', 'feat', 'fond', 'gcid', 'just',
        'kerx', 'lcar', 'ltag', 'mort', 'morx', 'opbd', 'prop',
        'trak', 'xref'
    ]
    for unwanted in unwanted_tables:
        if unwanted in ttFont:
            del ttFont[unwanted]


def add_dummy_dsig(ttFont: ttLib.TTFont) -> None:
    """Add a dummy dsig table to a font. Older versions of MS Word
    require this table.
    Args:
        ttFont: a TTFont instance
    """
    newDSIG = ttLib.newTable("DSIG")
    newDSIG.ulVersion = 1
    newDSIG.usFlag = 0
    newDSIG.usNumSigs = 0
    newDSIG.signatureRecords = []
    ttFont.tables["DSIG"] = newDSIG

if __name__ == "__main__":
    for arg in sys.argv[1:]:
        fix_font(arg)