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
        contentArea.classList.remove("color", "outline", "shadow", "shadoweast", "shadowwest", "shadowsouth", "shadownorth");
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
