
from munch import DefaultMunch
import argparse
import logging
import sys
import yaml
import os

from malayalamfont import MalayalamFont

log = logging.getLogger(__name__)


def dir_path(path):
    if os.path.isdir(path):
        return path
    else:
        raise argparse.ArgumentTypeError(f"readable_dir:{path} is not a valid path")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Build a UFO formatted font", add_help=True)
    parser.add_argument(
        "-c", "--config", help="The font information and configuraion",
        default="config.yaml", type=argparse.FileType('r'))
    parser.add_argument(
        "-s", "--source", help="SVG sources",
        type=dir_path)
    parser.add_argument(
        "-o", "--output", help="Output UFO File")
    parser.add_argument('-t', '--style', default='Regular',
                        required=False, help="Set style")
    parser.add_argument('-w', '--weight', default=400,
            required=False, help="Set weight")
    parser.add_argument('-l', '--log-level', default='INFO',
                        required=False, help="Set log level")

    options = parser.parse_args()
    try:
        logging.basicConfig(level=options.log_level)
    except ValueError:
        logging.error("Invalid log level: {}".format(options.log_level))
        sys.exit(1)

    config = DefaultMunch.fromDict(
        yaml.load(options.config, Loader=yaml.FullLoader))

    font: MalayalamFont = MalayalamFont(
            config, style=options.style, weight=options.weight)
    font.build(options.source)
    font.buildFeatures()
    font.setFontInfo()
    font.updateFontVersion()
    font.save(options.output)
