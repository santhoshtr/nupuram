
from munch import DefaultMunch
import argparse
import copy
import logging
import sys
from datetime import datetime
from defcon import Font, Glyph, Layer
import ufo2ft
import yaml
from fontTools import ttLib
from typing import List, Dict
from malayalamfont import MalayalamFont

log = logging.getLogger(__name__)


class MalayalamFontBuilder:
    def __init__(self, options):
        self.options = options
        self.fonts: Dict[str, str] = {}

    def compile(self,
                ufo: MalayalamFont,             # input UFO as filename string or defcon.Font object
                outputFilename: str,  # output filename string
                # true = makes CFF outlines. false = makes TTF outlines.
                cff: bool = True,
                **kwargs,        # passed along to ufo2ft.compile*()
                ):

        # update version to actual, real version. Must come after any call to setFontInfo.
        # updateFontVersion(ufo, dummy=False, isVF=False)
        compilerOptions = dict(
            useProductionNames=True,
            inplace=True,  # avoid extra copy
            removeOverlaps=True,
            overlapsBackend='pathops',  # use Skia's pathops
        )

        log.info("compiling %s -> %s (%s)", self.options.name, outputFilename,
                 "OTF/CFF-2" if cff else "TTF")

        if cff:
            font = ufo2ft.compileOTF(ufo, **compilerOptions)
        else:  # ttf
            compilerOptions['flattenComponents'] = True
            font = ufo2ft.compileTTF(ufo, **compilerOptions)

        log.debug(f"Writing {outputFilename}")
        font.save(outputFilename)

    def fix_font(self, fontFile):
        log.debug(f"Fixing {fontFile}")
        ttFont = ttLib.TTFont(fontFile)
        self.add_dummy_dsig(ttFont)
        self.fix_unhinted_font(ttFont)
        self.fix_fs_type(ttFont)
        ttFont.save(fontFile)

    def fix_unhinted_font(self, ttFont: ttLib.TTFont):
        """Improve the appearance of an unhinted font on Win platforms by:
            - Add a new GASP table with a newtable that has a single
            range which is set to smooth.
            - Add a new prep table which is optimized for unhinted fonts.
        """
        gasp = ttLib.newTable("gasp")
        # Set GASP so all sizes are smooth
        gasp.gaspRange = {0xFFFF: 15}

        program = ttLib.tables.ttProgram.Program()
        assembly = ["PUSHW[]", "511", "SCANCTRL[]",
                    "PUSHB[]", "4", "SCANTYPE[]"]
        program.fromAssembly(assembly)

        prep = ttLib.newTable("prep")
        prep.program = program

        ttFont["gasp"] = gasp
        ttFont["prep"] = prep

    def fix_fs_type(self, ttFont: ttLib.TTFont):
        """Set the OS/2 table's fsType flag to 0 (Installable embedding).
        Args:
            ttFont: a TTFont instance
        """
        old = ttFont["OS/2"].fsType
        ttFont["OS/2"].fsType = 0
        return old != 0

    def add_dummy_dsig(self, ttFont: ttLib.TTFont) -> None:
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

    def buildWebFont(self, ttfFile, webfontFile):
        ttFont = ttLib.TTFont(ttfFile)
        ttFont.flavor = "woff2"
        ttFont.save(webfontFile)
        log.info(f"Webfont saved at {webfontFile}")

    def build(self, options):
        for design_name in self.options.designs:
            design = self.options.designs[design_name]
            if "source" not in design:
                continue
            ufo_file_name = f"build/{self.options.name}-{design.style}.ufo"
            font: MalayalamFont = MalayalamFont(
                self.options, style=design.style)
            font.build(design.source)
            font.buildFeatures()
            font.setFontInfo()
            font.updateFontVersion()
            font.save(ufo_file_name)
            log.info(f"UFO font saved at {ufo_file_name}")

            if 'TTF' in options.output_format or 'WOFF2' in options.output_format:
                ttfFile = ufo_file_name.replace('.ufo', '.ttf')
                self.compile(font, ttfFile, cff=False)
                self.fix_font(ttfFile)
                if 'WOFF2' in options.output_format:
                    webfontFile = ufo_file_name.replace('.ufo', '.woff2')
                    self.buildWebFont(ttfFile, webfontFile)

            if 'OTF' in options.output_format:
                otfFile = ufo_file_name.replace('.ufo', '.otf')
                self.compile(font, otfFile)
                self.fix_font(otfFile)
            self.fonts[design_name] = ufo_file_name


        for design_name in self.options.designs:
            layer_mapping = []
            CPAL_palette = []
            design = self.options.designs[design_name]
            if "layers" not in design:
                continue
            for layer_name in design.layers:
                if layer_name == 'default':
                    layer_mapping.append(
                        ['public.default', design.layers.default.order])
                    font = Font(self.fonts[design.layers.default.source])
                else:
                    if not font:
                        raise ValueError(
                            "Default font not found. Define default source as first item in layers")
                    layer: Layer = font.newLayer(layer_name)
                    layer_font: Font = Font(self.fonts[design.layers[layer_name].source])
                    for base_glyph in layer_font:
                        glyph = copy.deepcopy(base_glyph)
                        layer.insertGlyph(glyph, glyph.name)
                        if "offset" in design.layers[layer_name]:
                            [offset_x, offset_y] = design.layers[layer_name].offset
                            temp_glyph_name = f"{glyph.name}.temp"
                            temp_glyph = layer.newGlyph(temp_glyph_name)
                            component = temp_glyph.instantiateComponent()
                            component.baseGlyph = glyph.name
                            component.move((offset_x, offset_y))
                            temp_glyph.appendComponent(component)
                            temp_glyph.decomposeAllComponents()
                            layer.insertGlyph(temp_glyph, glyph.name)
                            del layer[temp_glyph_name]

                    layer_mapping.append(
                        [layer_name, design.layers[layer_name].order])
                [r, g, b, a] = design.layers[layer_name].color
                CPAL_palette.append((r/255., g/255., b/255., 1.0))

            print(layer_mapping)
            layer_mapping.reverse()
            CPAL_palette.reverse()
            font.lib[ufo2ft.constants.COLOR_LAYER_MAPPING_KEY] = layer_mapping
            font.lib[ufo2ft.constants.COLOR_PALETTES_KEY] = [
                CPAL_palette]

            ufo_file_name = f"build/{self.options.name}-{design.style}.ufo"
            font.save(ufo_file_name)
            log.info(f"Color UFO font saved at {ufo_file_name}")

            if 'TTF' in options.output_format or 'WOFF2' in options.output_format:
                ttfFile = ufo_file_name.replace('.ufo', '.ttf')
                self.compile(font, ttfFile, cff=False)
                self.fix_font(ttfFile)
                if 'WOFF2' in options.output_format:
                    webfontFile = ufo_file_name.replace('.ufo', '.woff2')
                    self.buildWebFont(ttfFile, webfontFile)

            # if 'OTF' in options.output_format:
            #     otfFile = ufo_file_name.replace('.ufo', '.otf')
            #     self.compile(font, otfFile)
            #     self.fix_font(otfFile)
            self.fonts[design_name] = ufo_file_name

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Build a UFO formatted font", add_help=True)
    parser.add_argument(
        "-c", "--config", help="The font information and configuraion",
        default="config.yaml", type=argparse.FileType('r'))
    parser.add_argument('-l', '--log-level', default='INFO',
                        required=False, help="Set log level")
    parser.add_argument('-f', '--output-format', default='UFO, OTF,TTF,WOFF2,COLOR',
                        required=False, help="Set output format: UFO, OTF, TTF or WOFF2. For multiple formats, use commas")

    options = parser.parse_args()
    try:
        logging.basicConfig(level=options.log_level)
    except ValueError:
        logging.error("Invalid log level: {}".format(options.log_level))
        sys.exit(1)

    config = DefaultMunch.fromDict(
        yaml.load(options.config, Loader=yaml.FullLoader))
    builder = MalayalamFontBuilder(config)
    builder.build(options)
