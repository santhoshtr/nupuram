import os
import sys

from fontTools.ttLib import TTFont

if __name__ == "__main__":
    for filepath in sys.argv[1:]:
        f = TTFont(filepath)
        f.flavor = "woff2"
        fontname = os.path.splitext(os.path.basename(filepath))[0] + ".woff2"
        dest = os.path.join(os.path.dirname(filepath), "../", "webfonts", fontname)
        f.save(dest)
