# Using Nupuram in Adobe Photoshop, Indesign and Illustrator

This is a brief guide on using Nupuram family of fonts in Adobe Photoshop, Indesign and Illustrator. This is based on my own testing them in a Windows 11 system. I have not used these products except for testing fonts. So if you have suggestions to improve this guide, please let me know.

## Overview

In general, Adobe Photoshop, Indesign and Illustrator are known for poor support for Indic or complex scripts. Adobe shipped their own text shaping system(known as world ready composer) for complex scripts and that is by default disabled. For using opentype fonts and unicode for these products, till recently a user had to explicitly chose world ready composer. But, since this world ready composer is known for bugs and limited capabilitites, Adobe started to replace it with the famous, widely used shaping engine Harfbuzz(Adobe calls this as Unified text engine). As of October 2022, while I am writing this guide, using Harfbuzz in Adobe's products require fiddling with configurations. There is no UI to chose Harfbuzz. But Adobe Photoshop in version 23 enabled harfbuzz by default and that is the first product to give superior shaping support complex scripts. We will explain all of these 3 products by Adobe one by one below.

None of the products support Colrv1 or Colrv0 standard of opentype. So you cannot use Nupuram color fonts with these products.

I assume you installed Nupuram Variable font, Nupuram Calligraphy Variable font(One with file named ending `-vf.ttf`) in the operating system(Windows/Mac). Please note that, if you install a variable font, don't install the static versions of the font- they are meant for old operating systems that does not support variable font. Installing both will create conflicts.

## Photoshop

Adobe photoshop version 23 -the latest version available as part of Creative Cloud [ships with unified text engine(Harfbuzz)](https://helpx.adobe.com/in/photoshop/using/unified-text-engine.html). You can verify this by going to the Type options in Preferences.

![Unified text engine](/docs/images/adobe-photoshop-unified-textengine.jpg)

However, there is a menu to chose East asian options under Type menu. I have not tested if it has any effect on shaping. Just keep it enabled anyway.

![Unified text engine](/docs/images/adobe-photoshop-indic-options.jpg)

The Nupuram Variable font and Nupuram Calligraphy variable fonts are fully supported in Photoshop. Once you choose Nupuram as font, you will see a variable font button next to the menu to chose the Regular, Bold etc. If you click on that you should see sliders for variation axes as shown below. You can chose an appropriate type variation using this.

![Unified text engine](/docs/images/adobe-photoshop-variation-options.jpg)

Adobe photoshop also has [more detailed documentation](https://helpx.adobe.com/in/photoshop/using/fonts.html) on opentype variable fonts.

## Indesign

Getting Malayalam variable fonts working with Indesign is slightly complex. There are two steps involved.

1. Enabling Harfbuzz shaping engine
2. Enabling world ready composer.

There is no UI to enable Harfbuzz in the latest version I used. I assume this is because in one of the immediate versions, they are going to enable harfbuzz by default like they did in Photoshop.

Create a file named `HarfbuzzOverride.js` with the following content:

```js
app.textPreferences.shapeIndicAndLatinWithHarbuzz = true;
```

Save it under `Program Files\Adobe\Indesign\Scripts\Scripts` Panel folder. This will require administrator access. If you don't have it, you can also save this file in `YourUserName\AppData\Roaming\Adobe\InDesign\Version17.0\en_US\Scripts\Scripts Panel` directory.

You need to close and relaunch Indesign.

Go to Windows> Utilities> Scripts. This will open the Scripts Panel. In case you do not `HarfbuzzOverride.js` in this panel, please review above steps.

Double click on HarfbuzzOverride.js on the scripts panel. This will activate the Harfbuzz workflow.

![Harfbuzz override](/docs/images/adobe-indesign-harfbuzz-override.jpg)

I found that this will also enable Harfbuzz for other products like Illustrator.

Next step is enabling World ready composer. It can be done in two ways.

Go to Preferences -> Advanced Type, and chose World Ready Paragraph Composer.
![World ready composer](/docs/images/adobe-indesign-world-ready-composer.jpg)

You can also chose this menu from paragraphy toolbar menu as shown below.

![World ready composer](/docs/images/adobe-indesign-world-ready-composer-menu.jpg)

Thats it. You should now able to use Malayalam content without any shaping issues.

Along with the font selection dropdown, you will see a variable font button that gives access to variation axes.

![Variation options](/docs/images/adobe-illustrator-variable-font-options-2.jpg)

## Illustrator

The steps are same for Illustrator. Enabling harfbuzz happens along with Indesign from my testing. Chosing world ready composer is as follows:

Go to Preferences->Type, chose Show Indic options

![Indic options](/docs/images/adobe-illustrator-indic-options.jpg)

Then from paragraph menu chose Adobe World Ready Paragraph Composer. Here it is given with different name "Middle Eastern and South Asian every line composer".

![Indic options](/docs/images/adobe-illustrator-paragraph-options.jpg)

Now you can use Nupuram Variable font.

![Variation options](/docs/images/adobe-illustrator-variable-font-options.jpg)

You can either use the sliders to chose a font style or use the drop down menu to chose a named instance

![Variation options](/docs/images/adobe-illustrator-variable-instance-options.jpg)

Similarly for Calligraphy variable font:

![Variation options](/docs/images/adobe-illustrator-calligraphy-font-options.jpg)

