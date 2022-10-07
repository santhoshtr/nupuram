# Nupuram typeface

This is a guide for designing and developing a font using MetaPost. It explains the concepts, architecture and glyph anatomy of Nupuram typeface.

## Overview

The Technology used to develop these fonts deviates from usual type design practices. All the glyphs are defined in [Metapost](https://en.wikipedia.org/wiki/MetaPost). MetaPost produces vector graphic diagrams from a geometric/algebraic description. The language shares [Metafont](https://en.wikipedia.org/wiki/Metafont)'s declarative syntax for manipulating lines, curves, points and geometric transformations. Unlike Metafont, MetaPost can produce SVG output.

The parametric generation of curves by MetaPost enables changing a few internal variables and producing glyphs with varying design characteristics such as glyph weight, stroke modulation, glyph width, custom terminal shapes etc. The concept of custom pens that draw over the defined path can produce the outlines that is required for the glyphs. For example a pen defined by a line with given width and rotation can produce calligraphic strokes of wide pen calligraphic pen. Picking  pens with different strokes during the path can produce the stroke modulation. Drawing patterns like arrows or dots on the defined path is also possible.

![Example metapost code for Letter ഗ](/docs/images/vscode-metapost-ga.jpg)

Above image shows the metapost definition of letter ഗ. The SVG generated is shown on rightside. Setting up a compile-on-file-change is easy in VSCode and you can instant preview of the glyph while you write the glyph definition. Understanding this code may be difficult if you are not familiar with metafont concepts. Basically it has an import statement to import required macros, another set of macros to define begin and end of glyph def, metafont style definition of coordinates and path and direction, definition of pens that will produce an outline, macros to define anchor points. For helping development and debugging, grid and coordinates are printed in SVG. They won't be present in actual SVGs used for font. `m` in the code defines the height of a Malayalam letter, `w` is width, `thick` is thickness of thickest part of strokes.

Metafont based fonts are known for its style variants. They existed many years before the new Opentype variable font technology. Defining an interpolation between the glyphs produced by MetaPost with varying property like weight enables us to produce opentype variable fonts. With some attention to the nodes in the glyphs they are easily interpolatable.

SVGs prepared by MetaPost definition of each glyphs are then converted to [glif](https://unifiedfontobject.org/versions/ufo3/glyphs/glif/) format of [UFO font format](https://unifiedfontobject.org).

The opentype features, glyph to unicode mapping, kerning and font meta information - these are all part of the prepared UFO. A set of programs prepares all of these based on a simple configuration file. Preparing the opentype features used to be a major task for typeface design for Malayalam. We used to manually write them. Here they are automatically generated based on the script grammar encoded in application logic.

You are welcome to take a look at these scripts in the [source code repository of of Nupuram](https://gitlab.com/smc/fonts/Nupuram)

UFOs are then compiled to Opentype fonts using [fontmake](https://github.com/googlefonts/fontmake).

To help producing strokes, pens a set of macros need to be written on top of Plain version of MetaPost. The macros defined in [Metatype1](https://en.wikipedia.org/wiki/MetaType1) package helped a lot in this process.

## Getting started

## Familiarize with Metafont, MetaPost

Familiarizing with the concepts of MetaFont and MetaPost are essential. In this guide, we are not going to explain this, but will provide a list of good tutorials to use.

* The MetaFont book by Knuth is the ultimate resource for learning MetaFont concepts. There are [ebook versions available in internet](https://www.google.com/search?q=metafont+book), but they don't have illustrations. It is recommended to have a printed copy of this book.
* John D. Hobby. [A METAFONT-like System with PostScript Output](http://www.tug.org/TUGboat/Articles/tb10-4/tb26hobby.pdf). TUGboat, 10(4), 1989.
* John D. Hobby. [METAPOST — A User’s Manual](http://www.tug.org/docs/metapost/mpman.pdf.), 2008.
* [Learning METAPOST by Doing](https://staff.fnwi.uva.nl/a.j.p.heck/Courses/mptut.pdf)
* [MetaPost for Beginners](https://meeting.contextgarden.net/2008/talks/2008-08-22-hartmut-metapost/mptut-context2008.pdf)

It is important to practice MetaPost rather than just reading the book. You may try out the examples in your own system or online tool called [MetaPost previewer](http://www.tlhiv.org/mppreview/) by Troy Henderson

I used Visual Studio Code for designing Nupuram. For syntax hightlighting, please install [Metapost extension](https://marketplace.visualstudio.com/items?itemName=fjebaker.vscode-metapost). It also has a preview mode to preview the metapost files, but it is useless.

To get started with, let me give you a very simple code to render letter റ using a calligraphic pen:

```metapost
outputtemplate := "%j.svg";
outputformat   := "svg";
z1 = (40, 0);
z2 = (25, 25);
z3 = (50, 50);
z4 = (75, 25);
z5 = (50, 0);
pickup pensquare scaled 10 yscaled .02 rotated 45;
draw z1..z2..z3..z4..z5;
```

Save this as `ra.mp` and compile using metapost as follows:

```bash
mpost ra.mp
```

You will see a file named `ra.svg` is created.

## Variation Configurations

## Glyph concepts

## Rounded corners

## Calligraphy

## Shadow

## Color

## Arrows

## Dots

