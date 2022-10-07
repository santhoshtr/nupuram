# Nupuram Malayalam Typeface

A Malayalam typeface, inspired from the early Malayalam movie titles designs. The curves are fluid, bold and expressive.

Taking full advantage of variable font technology, Nupuram offers an unprecedented level of flexibility, all from a single font file. Nupuram has 4 variable axes: `Weight`, `Width`, `Slant` and `Softness`.

As a variable font, Nupuram gives you fine-grained control over each one of its styles. However, it also comes with 64 predefined styles that are easy to access through your font menu. Called *named instances¹*, these work just like regular static fonts do.

¹ *Named instance*: a predetermined location in the designspace of a variable font, similar to the "static instances" that are familiar in traditional digital fonts.

The Variable font capability makes Nupuram stylistically flexible and warmly energetic.

![Nupuram variable font - animated demo](docs/images/nupuram-var.gif "Nupuram variable font - animated demo showing all 4 axis")

Nupuram is also available as multiple fonts with different weights.

![Nupuram weights](docs/images/width-weight-grid.jpg "Nupuram weights")

## Variation axes

Nupuram has the following axes:

| Axis       | Tag    | Range        | Default | Description                                                     |
| ---------- | ------ | ------------ | ------- | --------------------------------------------------------------- |
| Weight  | `wght` | 100 to 900       | 400       | Thin to Black. Can be defined with usual font-weight property.                      |
| Slant     | `slnt` | -15 to 0       | 0       | Upright (0°) to Slanted (about 15°)                                                |
| Width     | `wdth` | 75 to 125  | 100     | Condensed to Expanded. Can be defined with usual font-stretch property. |
| Soft      | `soft` | 15 to 100     | 56       | Sharp to normal to SuperSoft terminals                           |

### Axis Definitions

* **Weight** `wght`: 100 to 900. The overall thickness of letters and the darkness of text composed with them.

    Recommended use: Differences in weight can provide emphasis in text, show user interaction, or adjust the tone of communication. For light text on dark backgrounds, 400 (“Regular”) tends to be appropriate for text and code. For dark text on a light background, it can be beneficial to adjust the weight upwards to 500 (“Medium”).

* **Slant** `slnt`: 0 to -15. The "forward lean" of letters. Note: -15 (negative 15) corresponds to a 15° clockwise slant, due to type design's roots in geometry.

    Recommended use: The Malayalam script with its glyph characteristics does not have an established slant behavior. Mostly we mimic the slanting in latin. And we often call italic. Note that italic and slant are not same.  Use Slant as a secondary way to emphasize text or vary typographic tone. In text, it can be useful to use a partial slant of around -12.

* **Width** `wdth`: 75 to 125%. The percentage of letter width. 75% is 'Condensed', where the letters are horizontally condensed to 75% of original width. 125% is 'Expanded' where the letters are horizontally stretched to 125% of original width.

    Recommended use: The condense or expand can be used to achieve precise typographic layout in a predefined rendering space. The content can be adjusted in this way to "fit" the space. Be aware of the legibility degradation when doing this.

* **Soft** `soft`: 15 to 100. The terminals of the letters of Nupuram are slightly rounded by default. This is also known as Soft terminals. To make the terminal sharp - sharp cuts at ends, use 'Sharp' value 15. To make the terminals more rounded using a higher value. Using a value 100 means, the terminals are half circles with diameter equals the terminal width.

    Recommended use: Roundness or Sharpness at terminals can help change the tone of communication, say from mechanical to human, from formal to informal.

## Nupuram Color

Nupuram also has a Color font version with COLRv1 specification. The colors can be customized, for example using CSS. For applications that does not support COLRv1 spec, there is a COLRv0 variant as well. Support for Color fonts vary a lot across applications, please [refer this site](https://www.colorfonts.wtf/) for a detailed reading. Google Chrome and related browsers [support COLRv1 in their latest versions](https://developer.chrome.com/blog/colrv1-fonts/).

![Nupuram color font](docs/images/nupuram-color.png "Nupuram color font")

Nupuram Color font gives 18 predefined pallettes that can be selected by users. Or a user can specify the colors using CSS for example.

This color font uses 3 colors for its shadow-ish look. They are Dark, Light, Base colors. Base is the facing color, Light is the central glowing area color. Dark is the color for the shadow part. The colors are used to create a gradient internally.

The following CSS customizes the pallette to give a rendering given below:

```css
.content {
  font-family: 'NupuramColor';
  font-palette: --custom;
}

@font-palette-values --custom  {
  font-family: 'NupuramColor';
  /* Change this to a value between 0 and 18 to chose a supplied palette. */
  base-palette: 0;
  /* Or provide the colors directly to override palette */
  override-colors: 0 #FFD700, 1 #FFD700, 2 #1E0303;
}
```

![Nupuram Custom color font](docs/images/color-font-custom.jpg "Nupuram Custom Color font")

You may try the color selector provided in the [Nupuram font playground](https://smc.gitlab.io/fonts/Nupuram/tests/).
If you want to create a new font with the provided colors, there is a tool called [DJR's Color Font Customizer](https://tools.djr.com/color-font-customizer/).

## Nupuram Arrows

For educational purposes, to learn the pen movement for writing a letter, Nupuram comes with a variant named Nupuram Arrows. This is a Color font.

![Nupuram arrows font](docs/images/nupuram-arrows.png "Nupuram Arrows font")

## Nupuram Dots

Again, for educational purposes, to practice in worksheets, Nupuram comes with a variant named Nupuram Dots.

![Nupuram dots font](docs/images/nupuram-dots.png "Nupuram dots font")

## Nupuram Display

Nupuram Display is a Display typeface to use with large point sizes. Its terminals are flat with rounded corners and has optimized xheight for large sizes.

![Nupuram display font](docs/images/nupuram-display.png "Nupuram display font")

## Nupuram Calligraphy

Nupuram Calligraphy simulates a wide nib Calligraphy pen with nib rotation at 40°. This is a variable font with weight axis. The width of the calligraphy pen can be varied for getting different weights.

![Nupuram Calligraphy font](docs/images/nupuram-calligraphy-var.gif "Nupuram Calligraphy font")

| Axis       | Tag    | Range        | Default | Description                                                     |
| ---------- | ------ | ------------ | ------- | --------------------------------------------------------------- |
| Weight  | `wght` | 100 to 900       | 400       | Thin to Black. Can be defined with usual font-weight property.                      |

## Using the fonts

* Download the latest fonts from the [Releases](https://gitlab.com/smc/fonts/Nupuram/-/releases/) (Look under the "Assets" of the latest release, download the zip, and then open that zip)
* Install the fonts on your system. Depending on the Operating system, the installation steps vary. In general, Clicking on the font file give the option to install it.

### Using Variable font in web pages

Varibale fonts save bandwith in web pages by having a single font to download, while providing all style variations. Using them on webpages is a big topic. Please use a [good tutorial like MDN](https://developer.mozilla.org/en-US/docs/images/Web/CSS/CSS_Fonts/Variable_Fonts_Guide)

In general, you should link in the font with @font-face

```css
@font-face {
 font-family: 'Nupuram';
 src: url('path/to/font/Nupuram-VF.woff2') format('woff2-variations');
 font-weight: 100 900;
 font-stretch: 75% 125%;
 font-style: oblique 0deg -15deg;
}
```

Then, you can use the font with both `font-weight` and `font-variation-settings`. Using CSS [custom properties will help](https://pixelambacht.nl/2019/fixing-variable-font-inheritance/) to avoid some caveats of property inheritance.

### Using Color fonts in web

Since chrome based browsers support COLRv1 spec which allows customization of pallettes and color gradients and all other browser does not support it, we need to use some feature support testing in CSS.

```css
/* Firefox and old browsers - use ColrV0 */
@supports not (font-palette: --custom) {
  @font-face {
    font-family: "NupuramShadowColor";
    src: url(../fonts/webfonts/Nupuram-Color-v0.woff2) format("woff2");
  }
}
/*Chromium based browsers - Use colrv1 */
@supports (font-palette: --custom) {
  @font-face {
    font-family: "NupuramShadowColor";
    src: url(../path/to/Nupuram-Color-v1.woff2) format("woff2");
  }
}
```

## Building the fonts

Install the required software packages, assuming a debian based GNU/Linux Operating system

```bash
apt-get update -y
apt-get install -y make python3-pip python3-venv python3-yaml texlive-metapost libharfbuzz-bin
```

To build, set up the virtual environment and activate it.

```bash
virtualenv -p python3 venv
source venv/bin/activate
```

Then install requirements:

```bash
pip install -U -r requirements.txt
```

Then run make to build everything

```bash
make
```

This will take more than 15 minutes to build everything. But if you have a multi core processor, you can speed up this by using parallel build. Assuming you have 8 core system(8 CPUs)

```
make -j8
```

A directory name d riable fonts, UFO sources generated there.

## Language support

Nupuram is primarily a Malayalam font. All the Malayalam characters defined in Unicode version 15 are present in the font. Nupuram also has latin script support. So Nupuram supports 39 languages:

Afrikaans, Albanian, Basque, Bosnian, Catalan, Croatian, Czech, Danish, Dutch, English, Estonian, Faroese, Filipino, Finnish, French, Galician, German, Hungarian, Icelandic, Indonesian, Irish, Italian, Latvian, Lithuanian, Malay, Malayalam, Norwegian Bokmål, Polish, Portuguese, Romanian, Slovak, Slovenian, Spanish, Swahili, Swedish, Tongan, Turkish, Welsh and Zulu.

![Nupuram sample rendering](docs/images/nupuram-sample.jpg "Nupuram sample rendering")

## Credits

See [FONTLOG.md](FONTLOG.md) for details on contributions.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for policies around contributing to the project.

## License

This Font Software is licensed under the SIL Open Font License, Version 1.1. This license is available with a FAQ at: https://scripts.sil.org/OFL
