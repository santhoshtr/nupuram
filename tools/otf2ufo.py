import sys
import traceback
import os

try:
    import fontforge
except ImportError:
    sys.exit(
        "FontForge module could not be loaded. Try installing fontforge python bindings "
        "[e.g. on Linux Debian or Ubuntu: `sudo apt install fontforge python-fontforge`]"
    )


if __name__ == "__main__":
    source_font_file = sys.argv[1]
    out_dir = sys.argv[2]
    source_font = fontforge.open(source_font_file)
    for glyph in source_font.glyphs():
        try:
            glyph_name = ""
            for l in glyph.glyphname:
                if l.isupper():
                    glyph_name += l+"_"
                else:
                    glyph_name += l
            glyph.export(
                f"{out_dir}/glyphs/{glyph_name}.glif")
        except:
            print(f"Error while processing {glyph_name}")
            traceback.print_exc()
