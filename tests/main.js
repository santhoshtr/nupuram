/**
 * Shuffles array in place. ES6 version
 * @param {Array} a items An array containing the items.
 */
function shuffle(a) {
    for (let i = a.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [a[i], a[j]] = [a[j], a[i]];
    }
    return a;
}

const pallettes = {
    "0": ["#E65100", "#FFCC80", "#FF9800"], // Orange
    "1": ["#212121", "#EEEEEE", "#9E9E9E"], // Gray
    "2": ["#263238", "#B0BEC5", "#607D8B"], // Blue Gray
    "3": ["#F57F17", "#FFF59D", "#FFEB3B"], // Yellow
    "4": ["#1B5E20", "#A5D6A7", "#4CAF50"], // Green
    "5": ["#01579B", "#81D4FA", "#03A9F4"], // Light Blue
    "6": ["#0D47A1", "#90CAF9", "#2196F3"], // Blue
    "7": ["#B71C1C", "#EF9A9A", "#F44336"], // Red
    "8": ["#4A148C", "#CE93D8", "#9C27B0"], // Purple
    "9": ["#004D40", "#80CBC4", "#009688"], // Teal
    "10": ["#3E2723", "#BCAAA4", "#795548"], // Brown
    "11": ["#880E4F", "#F48FB1", "#E91E63"], // Pink
    "12": ["#311B92", "#B39DDB", "#673AB7"], // Deep Purple
    "13": ["#1A237E", "#9FA8DA", "#3F51B5"], // Indigo
    "14": ["#006064", "#80DEEA", "#00BCD4"], // Cyan
    "15": ["#33691E", "#C5E1A5", "#8BC34A"], // Light Green
    "16": ["#827717", "#E6EE9C", "#CDDC39"], // Lime
    "17": ["#FF6F00", "#FFE082", "#FFC107"], // Amber
    "18": ["#BF360C", "#FFAB91", "#FF5722"], // Deep Orange
}

let baseColor = '#FFF3E0FF', shadowColor = "#E65100FF", outlineColor = "#FF9800FF";

const otFeatures = {
    'kern': true,
    'blwf': true,
    'blwm': true,
    'blws': true,
    'pref': true,
    'pres': true,
    'akhn': true,
    'pstf': true,
    'psts': true,
    'liga': true,
    'abvm': true,
    'calt': true,
}

function listen() {
    const contentArea = document.querySelector('.content')
    let testLines = [];
    let paragraphsMl = []
    let pangramsEn = []
    let kerning = []
    let paragraphsEn = []
    let ligaturesMl = []
    let currentTestIndex = 0;
    let testContents = []
    fetch('./content.txt').then(response => response.text()).then((content) => {
        testLines = shuffle(content.split("\n"));
        testLines = testLines.filter(testLine => !!testLine.trim())
        testContents = testLines;
        contentArea.innerHTML = testLines[currentTestIndex];

        contentArea.style.fontSize = document.querySelector('#font-fontSize').value;
        contentArea.style.lineHeight = document.querySelector('#font-lineHeight').value;
    })

    fetch('./paragraphs.malayalam.txt').then(response => response.text()).then((content) => {
        paragraphsMl = shuffle(content.split("\n"));
        paragraphsMl = paragraphsMl.filter(paragraph => !!paragraph.trim())
    });

    fetch('./paragraphs.english.txt').then(response => response.text()).then((content) => {
        paragraphsEn = shuffle(content.split("\n"));
        paragraphsEn = paragraphsEn.filter(paragraph => !!paragraph.trim())
    });

    fetch('./pangrams.txt').then(response => response.text()).then((content) => {
        pangramsEn = shuffle(content.split("\n"));
        pangramsEn = pangramsEn.filter(paragraph => !!paragraph.trim())
    });


    fetch('./kerning.txt').then(response => response.text()).then((content) => {
        kerning = shuffle(content.split("\n\n"))
    });

    fetch('./ligatures.txt').then(response => response.text()).then((content) => {
        ligaturesMl = shuffle(content.split("\n\n"))
    });

    document.getElementById('test-content').addEventListener('change', function () {
        const selected = this.options[this.selectedIndex].value;
        if (selected == 'paragraphsEn') {
            testContents = paragraphsEn;
        }
        if (selected == 'paragraphsMl') {
            testContents = paragraphsMl;
        }
        if (selected == 'lines') {
            testContents = testLines;
        }
        if (selected == 'pangrams') {
            testContents = pangramsEn;
        }
        if (selected == 'kerning') {
            testContents = kerning;
        }
        if (selected == 'ligaturesMl') {
            testContents = ligaturesMl;
        }
        contentArea.innerHTML = testContents[0];
    });

    document.getElementById('salt').addEventListener('change', function () {
        const selected = this.options[this.selectedIndex].value;
        contentArea.style.fontFeatureSettings = "\"salt\" "  + selected
    })

    document.getElementById('test-font').addEventListener('change', function () {
        const selected = this.options[this.selectedIndex].value;
        contentArea.classList.add('shadownorth');
        contentArea.classList.remove("color", "display", "outline", "shadow", "bold", "script", "bold", "thin", "sans", "condensed","calligraphy","slanted");
        if (selected === 'SeventyColor') {
            contentArea.classList.add('color');
            document.getElementById('font-fontColor').disabled = true
            document.getElementById('outlined').disabled = true
            document.getElementById('palette').style.display = "grid"
        }
        if (selected === 'SeventyOutline') {
            contentArea.classList.add('outline');
            document.getElementById('outlined').disabled = true
            document.getElementById('font-fontColor').disabled = false
            document.getElementById('palette').style.display = "none"
        }
        if (selected === 'SeventyShadow') {
            contentArea.classList.add('shadow');
            document.getElementById('outlined').disabled = true
            document.getElementById('font-fontColor').disabled = false
            document.getElementById('palette').style.display = "none"
        }
        if (selected === 'Seventy') {
            contentArea.classList.remove('color');
            document.getElementById('font-fontColor').disabled = false
            document.getElementById('outlined').disabled = false
            document.getElementById('palette').style.display = "none"
        }
        if (selected === 'SeventyBold') {
            contentArea.classList.remove('color');
            contentArea.classList.add('bold');
            document.getElementById('font-fontColor').disabled = false
            document.getElementById('outlined').disabled = false
            document.getElementById('palette').style.display = "none"
        }
        if (selected === 'SeventyThin') {
            contentArea.classList.remove('color');
            contentArea.classList.add('thin');
            document.getElementById('font-fontColor').disabled = false
            document.getElementById('outlined').disabled = false
            document.getElementById('palette').style.display = "none"
        }
        if (selected === 'SeventyDisplay') {
            contentArea.classList.remove('color');
            contentArea.classList.add('display');
            document.getElementById('font-fontColor').disabled = false
            document.getElementById('outlined').disabled = false
            document.getElementById('palette').style.display = "none"
        }
        if (selected === 'SeventyScript') {
            contentArea.classList.remove('color');
            contentArea.classList.add('script');
            document.getElementById('font-fontColor').disabled = false
            document.getElementById('outlined').disabled = false
            document.getElementById('palette').style.display = "none"
        }
        if (selected === 'SeventyCalligraphy') {
            contentArea.classList.remove('color');
            contentArea.classList.add('calligraphy');
            document.getElementById('font-fontColor').disabled = false
            document.getElementById('outlined').disabled = false
            document.getElementById('palette').style.display = "none"
        }
        if (selected === 'SeventySlanted') {
            contentArea.classList.remove('color');
            contentArea.classList.add('slanted');
            document.getElementById('font-fontColor').disabled = false
            document.getElementById('outlined').disabled = false
            document.getElementById('palette').style.display = "none"
        }
        if (selected === 'SeventySans') {
            contentArea.classList.remove('color');
            contentArea.classList.add('sans');
            document.getElementById('font-fontColor').disabled = false
            document.getElementById('outlined').disabled = false
            document.getElementById('palette').style.display = "none"
        }
        if (selected === 'SeventyCondensed') {
            contentArea.classList.remove('color');
            contentArea.classList.add('condensed');
            document.getElementById('font-fontColor').disabled = false
            document.getElementById('outlined').disabled = false
            document.getElementById('palette').style.display = "none"
        }
    });


    document.getElementById('next-test').addEventListener('click', () => {
        if (currentTestIndex + 1 >= testContents.length) {
            currentTestIndex = 0;
        }
        contentArea.innerHTML = testContents[++currentTestIndex];
    });
    document.getElementById('prev-test').addEventListener('click', () => {
        if (currentTestIndex -1 <= 0 ) {
            currentTestIndex = testContents.length;
        }
        contentArea.innerHTML = testContents[--currentTestIndex];
    });

    document.getElementById('outlined').addEventListener('change', function () {
        const outlined = this.checked;
        if (outlined) {
            contentArea.classList.add('outline-text');
        } else {
            contentArea.classList.remove('outline-text');
        }
    });
    document.getElementById('squint').addEventListener('change', function () {
        const squint = this.checked;
        if (squint) {
            contentArea.classList.add('blurry');
        } else {
            contentArea.classList.remove('blurry');
        }
    });
    document.getElementById('grid').addEventListener('change', function () {
        const squint = this.checked;
        if (squint) {
            contentArea.classList.add('grid');
        } else {
            contentArea.classList.remove('grid');
        }
    });
    document.querySelectorAll('.controls.align > li').forEach((element) => {
        element.addEventListener('click', () => {
            contentArea.style.textAlign = element.dataset.align;
        });
    });

    document.querySelectorAll("[data-id='fontSize']").forEach((element) => {
        element.addEventListener('input', function () {
            const fontSize = element.value;
            if (element.type == 'range') {
                document.querySelector('#font-fontSize').value = fontSize;
            } else {
                document.querySelector('#font-size > input[type="range"]').value = fontSize;
            }
            contentArea.style.fontSize = fontSize;
        });
    });
    document.querySelectorAll("[data-id='lineHeight']").forEach((element) => {
        element.addEventListener('input', () => {
            const lineHeight = element.value;
            if (element.type == 'range') {
                document.querySelector('#font-lineHeight').value = lineHeight;
            } else {
                document.querySelector('#line-height > input[type="range"]').value = lineHeight;
            }
            contentArea.style.lineHeight = lineHeight;
        });
    });

    document.querySelectorAll("[data-id='letterSpacing']").forEach((element) => {
        element.addEventListener('input', () => {
            const letterSpacing = element.value;
            if (element.type == 'range') {
                document.querySelector('#font-letterSpacing').value = letterSpacing;
            } else {
                document.querySelector('#letter-spacing > input[type="range"]').value =
                    letterSpacing;
            }
            contentArea.style.letterSpacing = letterSpacing;
        });
    });

    new Pickr({
        el: '#font-fontColor',
        theme: 'nano',
        useAsButton: true,
        defaultRepresentation: 'HEX',
        default: '#000000',
        swatches:[
            'rgba(255, 255, 255, 1)',
            'rgba(244, 67, 54, 1)',
            'rgba(233, 30, 99, 0.95)',
            'rgba(156, 39, 176, 0.9)',
            'rgba(103, 58, 183, 0.85)',
            'rgba(63, 81, 181, 0.8)',
            'rgba(33, 150, 243, 0.75)',
            'rgba(3, 169, 244, 0.7)',
            'rgba(0, 188, 212, 0.7)',
            'rgba(0, 150, 136, 0.75)',
            'rgba(76, 175, 80, 0.8)',
            'rgba(139, 195, 74, 0.85)',
            'rgba(205, 220, 57, 0.9)',
            'rgba(255, 235, 59, 0.95)',
            'rgba(255, 193, 7, 1)'
        ],
        components: {
            preview: true,
            opacity: true,
            hue: true,
            // Input / output Options
            interaction: {
                hex: true,
                input: true,
            }
        }
    }).on('change', (color, source, instance) => {
        document.body.style.color = color.toHEXA();
    })

    new Pickr({
        el: '#background-color',
        theme: 'nano',
        useAsButton: true,
        defaultRepresentation: 'HEX',
        default: '#fff',
        swatches:[
            'rgba(46, 52, 64, 1)',
            'rgba(0, 30, 60, 1)',
            'rgba(244, 67, 54, 1)',
            'rgba(233, 30, 99, 0.95)',
            'rgba(156, 39, 176, 0.9)',
            'rgba(103, 58, 183, 0.85)',
            'rgba(63, 81, 181, 0.8)',
            'rgba(33, 150, 243, 0.75)',
            'rgba(3, 169, 244, 0.7)',
            'rgba(0, 188, 212, 0.7)',
            'rgba(0, 150, 136, 0.75)',
            'rgba(76, 175, 80, 0.8)',
            'rgba(139, 195, 74, 0.85)',
            'rgba(205, 220, 57, 0.9)',
            'rgba(255, 235, 59, 0.95)',
            'rgba(255, 193, 7, 1)'
        ],
        components: {
            preview: true,
            opacity: true,
            hue: true,
            // Input / output Options
            interaction: {
                hex: true,
                input: true,
            }
        }
    }).on('change', (color, source, instance) => {
        document.body.style.backgroundColor = color.toHEXA();
    })


    const outlineColorPickr = new Pickr({
        el: '#font-fontOutlineColor',
        theme: 'nano',
        useAsButton: true,
        default: outlineColor,
        defaultRepresentation: 'HEX',
        components: {
            preview: true,
            opacity: true,
            hue: true,

            // Input / output Options
            interaction: {
                hex: true,
                input: true,
            }
        }
    }).on('change', (color, source, instance) => {
        setCustomColors(baseColor, shadowColor, color.toHEXA())
        document.getElementById('font-fontOutlineColor').style.backgroundColor = color.toHEXA()
    })

    document.getElementById('font-fontColorPalette').addEventListener('input', function () {
        const palette = this.value;
        [shadowColor, baseColor, outlineColor] = pallettes[palette+""]
        setCustomColors(baseColor, shadowColor, outlineColor, palette)
        shadowColorPickr.setColor(shadowColor)
        baseColorPickr.setColor(baseColor)
        outlineColorPickr.setColor(outlineColor)
    })

    const baseColorPickr = new Pickr({
        el: '#font-fontBaseColor',
        theme: 'nano',
        useAsButton: true,
        default: baseColor,
        defaultRepresentation: 'HEX',
        components: {
            preview: true,
            opacity: true,
            hue: true,

            // Input / output Options
            interaction: {
                hex: true,
                input: true,
            }
        }
    }).on('change', (color, source, instance) => {
        setCustomColors(color.toHEXA(), shadowColor, outlineColor)
        document.getElementById('font-fontBaseColor').style.backgroundColor = color.toHEXA()
    })

   const shadowColorPickr =  new Pickr({
        el: '#font-fontShadowColor',
        theme: 'nano',
        useAsButton: true,
        defaultRepresentation: 'HEX',
        default: shadowColor,
        components: {
            preview: true,
            opacity: true,
            hue: true,

            // Input / output Options
            interaction: {
                hex: true,
                input: true,
            }
        }
    }).on('change', (color, source, instance) => {
        setCustomColors(baseColor, color.toHEXA(), outlineColor)
        document.getElementById('font-fontShadowColor').style.backgroundColor = color.toHEXA()
    })

    document.querySelectorAll("[name=opentype]").forEach((element) => {
        element.addEventListener('change', function () {
            const checked = this.checked;
            otFeatures[element.value] = !!checked
            const fontFeatureSettings = [];
            for (let otFeature in otFeatures) {
                if (otFeatures.hasOwnProperty(otFeature) && !otFeatures[otFeature]) {
                    fontFeatureSettings.push(`"${otFeature}" off`);
                }
            }
            contentArea.style.fontFeatureSettings = fontFeatureSettings.join(',');
        });
    });

    document.getElementById('palette').style.display = "none"
    document.getElementById('font-fontBaseColor').style.backgroundColor = baseColor.substring(0, 7)
    document.getElementById('font-fontOutlineColor').style.backgroundColor = outlineColor.substring(0, 7)
    document.getElementById('font-fontShadowColor').style.backgroundColor = shadowColor.substring(0, 7)
    document.getElementById('font-fontColor').style.backgroundColor = '#214761'
    document.getElementById('background-color').style.backgroundColor = '#f5f5dc'
    setCustomColors()
}

function setCustomColors(base = baseColor, shadow = shadowColor, outline = outlineColor, palette=0) {
    baseColor = base;
    shadowColor = shadow
    outlineColor = outline
    const colorFontName = "SeventyColor"
    const sheetId = "custompalette"
    var sheet = document.getElementById(sheetId)
    if (!sheet) {
        sheet = document.createElement('style')
        sheet.id = sheetId
        document.body.appendChild(sheet);
    }

    sheet.innerHTML = `@font-palette-values --custom  {font-family: '${colorFontName}'; base-palette: ${palette}; override-colors: 0 ${shadowColor}, 1 ${baseColor}, 2 ${outlineColor};}`;
}


window.onload = listen
