Gayathri Malayalam Typeface
===========================
A gentle and modern Malayalam display typeface. Available in three weights, Gayathri is best suited for headlines, posters, titles and captions. Unicode compliant and libre licensed.

* **Design**: Binoy Dominic
* **Opentype engineering**: Kavya Manohar
* **Project coordination**: Santhosh Thottingal

This project was financially supported by [Kerala Bhasha Institute](http://www.keralabhashainstitute.org/)

Gayathri is part of [Swathanthra Malayalam Computing projects' Malayalam typefaces](https://smc.org.in/fonts)

Gayathri has wide coverage of Malayalam orthography with a total of 1116 glyphs including basic latin and punctuations. It comes with three weights: Regular, Bold and Thin.

Release announcement: [Malayalam](https://blog.smc.org.in/gayathri-malayalam-font-release/), [English](https://thottingal.in/blog/2019/02/21/gayathri-new-malayalam-typeface/)

![GitHub Logo](docs/Gayathri_1200x630.jpg)

Building from source
--------------------
1. Install the python libraries required for build script:
    ```
    pip3 install -r requirements.txt
    ```
2. Build the otf
   ```
   make
   ```

If you want to build ttf use `make ttf`. For webfonts, use `make webfonts`.

Testing
-------
For testing use `make test`. You will require Font-Validator from https://github.com/HinTak/Font-Validator/ for testing. Also hb-view from harfbuzz package.

Development
-----------
Following development workflow is used for this typeface
1. Designer produces SVG files with correct dimensions in the 2048em size. Commits to the repository
2. Typeface Engineers prepared a big configuration file containing svg file name to UFO glif mapping. See sources/design/config. It has left, right bearings, glyph width, base position in em canvas, unicode value and glyph name.
3. Typeface Engineers execute a script `make ufo` to prepare or update the UFO from the svgs.
   1. `Make ufo` first executes tools/import-svg-to-ufo.py to convert the svg to a UFO glif file. It uses the configuration for the svg defined in sources/design/config
   2. `Make ufo` then executes `ufonormalizer` to clean up the UFO and do various normalization
   3. Finally `ufolint` is executed to lint the UFO.
4. Typeface engineers construct the glyphs that use components(references) using a UFO editor like `trufont`
5. `make otf` Generates the OTF font
6. `make test` Generates a PDF with sample content for manual visual inspection.
7. Webfonts, TTF are also generated.
8. Gitlab CI pipeline executes `make otf ttf webfonts` and uploads the webfonts to a Gitlab pages so that a demo webpage is also prepared. From this pipeline results the generated font can also be downloaded.

Credits
-------

See FONTLOG.md for details on contributions.

License
-------
Licensed under the SIL Open Font License, Version 1.1. https://scripts.sil.org/OFL
