import os
import argparse
from datetime import datetime
from defcon import Font


def dir_path(path):
    if os.path.isdir(path):
        return path
    else:
        raise argparse.ArgumentTypeError(
            f"readable_dir:{path} is not a valid path")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Set UFO metadata", add_help=True)
    parser.add_argument(
        "-u", "--ufo", help="UFO sources",
        type=dir_path)
    parser.add_argument(
        "-f", "--familyname", help="Set family name")
    parser.add_argument(
        "-s", "--style", default='Regular', help="Set style")

    options = parser.parse_args()
    ufoFont = Font(options.ufo)
    ufoFont.info.familyName = options.familyname
    ufoFont.info.styleName = options.style
    now = datetime.utcnow()
    ufoFont.info.openTypeNameUniqueID = "%s-%s:%d" % (
            ufoFont.info.familyName,  ufoFont.info.styleName, now.year)
    ufoFont.save(options.ufo)