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
width:=10;
rotation:=45;

pen calligraphicpen ;
calligraphicpen := makepen ((0, 0)--(width,0 ) rotated rotation) ;

z0 = (x1+15, 0);
z1 = (0, y0+25);
z2 = (x1+25, y1+25);
z3 = (x2+25, y1);
z4 = (x2, y0);

pickup defaultpen;
draw z0..z1..z2..z3..z4 withcolor red;

pickup calligraphicpen;
draw z0..z1..z2..z3..z4 withcolor blue;
end
```

Save this as `ra.mp` and compile using metapost as follows:

```bash
mpost ra.mp
```

You will see a file named `ra.svg` is created. Please open that file using an SVG editor like inkscape and observe the SVG nodes, paths and their location.

![Ra rendered from example code](/docs/images/ra.svg)

<details><summary>
Excercises
</summary>

As an exercise to get familiar with the code, try modifying the code and run again to see the effect. For example

1. Change the width to a small value like 5 and high value like 20 and see what happens to the SVG generated
2. Try changing the value `25` in the code to different value and see what happens.
3. In the last line, instead of `z0..z1..z2..z3..z4`, use `z0--z1..z2..z3..z4` and see what happens.
4. What happens if you change the pen rotation value to a different value?
5. Try adding another point to the path. That is, `z5`
6. Change the calligraphic pen to a pencircle and observe the change in glyph outline. That is, change `pickup calligraphicpen;` to `pickup pencircle scaled 2mm;`

</details>

In the above example, we defined a special pen "Calligraphic pen" to draw a glyph using a wide nib calligraphy pen held at a specific angle. We will use that pen when build Nupuram Calligraphy. But this pen won't help with the unique thick-thin contrast design Nupuram has.

Nupuram has thick strokes at horizontal paths and thin at vertical paths. The terminals are thick. Such stroke modulation cannot be easily achieved using a pen defined using plain metapost. In Nupuram, we use a set of drawing macros defined on top of MetaPost. The MetaType project had written macros for the stroke modulation and we owe them for the stroke modulation code.

## Variation Configurations

The glyphs and their variations are fully controlled by simple configurations files. The based configuration file is named as [`config.mp` ](/sources/config.mp). That file is self documented. So, please take a moment to read the variables, default values and their explanation.

On top of this configuration, we define font specific variations in simple configuration files. For example, let us look at [Bold.mp](/sources/config/Bold.mp) - the configuration for creating Nupuram-Bold font.

```metapost
input ./config/Regular;
thick:= 1.25u;
```

It imports(includes) the Regular configuration and set the `thick` value to `1.25u`. You will quickly see that it is an increase on the `thick` value set in [Regular.mp](/sources/config/Regular.mp). It is defined as

```metapost
thick := 0.90u;
soften := 0;
```

This is an override on default values set in  [`config.mp` ](/sources/config.mp). We are saying `thick` is `0.90u` and avoid softening the sharp corners of glyph outline.

Let us look at  [`Thin.mp` ](/sources/config/Thin.mp) which defines the configuration for Nupuram Thin.

```metapost
input ./config/Regular;
thick     :=  0.5u;
```
This does not much explanation, for thin glyphs we use same configuration of Regular, but with thick value `0.5u`.

Similarly the configuration for Nupuram Condensed is defined as follows in [`Condensed.mp`](/sources/config/Condensed.mp)

```metapost
input ./config/Regular;
condense :=  0.8;
```

These configurations are used while compiling glyphs using metapost using Makefile. To see this in action, from the root directory of Nupuram, run:

```bash
make Bold
```

You will see a folder named sources/svgs/Bold is created with SVGs matching the configuration.

<details><summary>
Excercises
</summary>

1. Try changing the `thick` value to different values and observe the glyph outline changes by inspecing SVG in an editor like Inkscape
2. Along with `thick` try changing `thin` value too. It is ratio of this strokes to the `thick` value. For example `thin:=0.5` means thin strokes are half width of thick strokes
3. Try changing the value of `thin` to a value greater than 1. Will you get reverse contrast for the glyphs?
4. Most of the units are derived from the value of `em`. What happens if we change the value of `em`? Try to find more information about the meaning of `em` in type design. What are the em values for your favorite fonts?

</details>

### Debug mode

Usually the SVGs generated are just the glyph outlines. But when designing glyphs, it is important to see the grids, ascent, descent lines, bearings, nodes in paths, paths etc. This is achieved by a special configuration called ['debug'](/sources/config/debug.mp). A sample content of this configuration is given below

```
input ./config/Regular;
showgrids := 1;
showcoords := 1;
show_paths := 1;
soften := 1;
```

In the sources folder, if you just run `make`, it is the debug configuration that would be used.

There is a make target `autobuild` for Nupuram. While designing glyphs, the first step is to run `make autobuild`. It will listen for file changes, will recompile the changed files to update SVGs. If you open SVG in an image viewer that can autorefresh when file changed, you get a very decent auto-preview sytem for the metapost code you write. I used VS Code for writing metapost definition of glyphs and gnome image viewer(aka, eog) to open and preview the svgs. Placing that imageviewer in one monitor and VS Code in another monitor makes your design setup.

![EOG showing glyphs in debug mode](/docs/images/eog.jpg)

## Glyph concepts

So far, we familiarized with the configurations per font variant. Now, let us discuss how a glyph is defined in Nupuram. Eventhough, glyphs are defined in metapost, it is radically different from the code we saw in the beginning of this guide(The റ glyph). We need to use several macros to achieve the required glyph outlines.

Let us take one simple example and familiarize with the concepts and macros.

Following is a video illustrating construction of glyph ഗ using metapost

[![How a glyph is defined using MetaPost in Nupuram font](/docs/images/ga-video-thumbnail.jpg)](http://www.youtube.com/watch?v=1NhCcXXLvEg "How a glyph is defined using MetaPost in Nupuram font")

## Rounded corners

## Calligraphy

When we define the glyphs, we defined the path of the glyph using the `z` values first. For example, the letter വ, without any pen strokes will look like this.

![va stroke](/docs/images/va-stroke.jpg) ![va calligraphic](/docs/images/va-calligraphic.jpg)

If we define a pen as a calligraphic wide nib pen with a rotation of say, 40 degree, and move that pen along the path above, we get the following calligraphic outline.



The width of the nib can be varied as required. So by defining 3 widths, narrow, medium, wide, we can get 3 variants of this glyph. Using these master glyphs, we can interpolate to any nib size using the variable font technology. That is how we made Nupurum Calligrapy variable font.

Before moving to next section, please take a close look at this calligraphic outline. Can you see 3D perspective towards top - right side? Put it in different way? Can you imagine a ribbon or thin metal or paper sheet with certain width along the വ path? You may feel this as silly question, but we will use this calligraphic technique to construct 3D glyph shape which is the basis of Nupuram Color Font.

## Color font

In the calligraphy variant, we moved a calligraphic pen through the glyph path. But if use pen strokes with thick and thin strokes as explained earlier, we get a modulated glyph outline as below.

![va stroke](/docs/images/va-stroke.jpg)![stroke and outline](/docs/images/va-stroke-outline.jpg)

What if move the same calligraphic pen we used for Nupuram Calligraphy through the outline? Just to repeat, outline is the outline of the glyph path - it surrounds the path - it has outer and inner lines and terminals. In the above image, it is given in blue color.

Moving a calligraphic wide nib pen along the outlines will result the following drawing:

![Calligraphi pen on the outline](/docs/images/va-shadow-calligraphy.jpg)

It is slightly confusing drawing, but we start to see a 3D shape in it.
Let us fill this with color blue to get a better picture.

![Filled calligraphic drawing](/docs/images/va-shadow-filled-hollow.jpg)

Now we can relate this with the calligraphy glyph we constructed earlier. Same stroke modulation, but two times - for outer and inner lines.

If you look carefully, this is a 3D structure, but a hollow one. The facing size and backside is void, creating a hollow structure. To get a solid 3d shape, let us take the envelope of the whole drawing. What I mean by that is, to take the outline of this structure.

![Envelope](/docs/images/va-envelope.jpg)

Now it is not hollow. If you look carefully, you will see it is a 3D letter വ. But to help your eyes for the 3D perspective it need colors, or lighting to get the depth perspective.
To start with let us place our original വ outline on top of it in a ligher color.

![va layers](/docs/images/va-shadow-color.jpg)

Now we are seeing something. Let us make the lighting and coloring a bit more realistic by using color gradients.

![Gradient colors വ](/docs/images/va-gradient.jpg)

## Arrows

## Dots

