function loadFont(version) {
    let font = new FontFace("Seventy", `url(../fonts/Seventy-Regular.woff2?v=${version}) format("woff2")`);
    font.load().then(function (loadedFont) {
        document.fonts.add(loadedFont);
    }).catch(console.error);
}

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

let baseColor='#ffa348ff', shadowColor="#63452cff", outlineColor="#63452cff";

function listen(){
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


    document.getElementById('test-font').addEventListener('change', function () {
        const selected = this.options[this.selectedIndex].value;
            contentArea.classList.add('shadownorth');
            contentArea.classList.remove("color", "outline", "shadow" ,"shadoweast", "shadowwest", "shadowsouth", "shadownorth");
        if (selected==='SeventyColor') {
            contentArea.classList.add('color');
            document.getElementById('font-fontColor').disabled=true
            document.getElementById('outlined').disabled=true
            document.getElementById('palette').style.display="block"
        }
        if (selected==='SeventyOutline') {
            contentArea.classList.add('outline');
            document.getElementById('outlined').disabled=true
            document.getElementById('font-fontColor').disabled=false
            document.getElementById('palette').style.display="none"
        }
        if (selected==='SeventyShadow') {
            contentArea.classList.add('shadow');
            document.getElementById('outlined').disabled=true
            document.getElementById('font-fontColor').disabled=false
            document.getElementById('palette').style.display="none"
        }
        if (selected==='Seventy') {
            contentArea.classList.remove('color');
            document.getElementById('font-fontColor').disabled=false
            document.getElementById('outlined').disabled=false
            document.getElementById('palette').style.display="none"
        }
    });


    document.getElementById('next-test').addEventListener('click', () => {
        if (currentTestIndex + 1 >= testContents.length) {
            currentTestIndex = 0;
        }
        contentArea.innerHTML = testContents[++currentTestIndex];
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

    document.querySelectorAll("[data-id='fontColor']").forEach((element) => {
        element.addEventListener('input', function () {
            const fontColor = element.value;
            document.body.style.color = fontColor;
        });
    });

    document.querySelectorAll("[data-id='background-color']").forEach((element) => {
        element.addEventListener('input', function () {
            const color = element.value;
            document.body.style.backgroundColor = color;
        });
    });
    debugger;
    new Pickr({
        el: '#font-fontOutlineColor',
        theme: 'nano',
        useAsButton: true,
        components: {
        preview: true,
        opacity: true,
        hue: true,
        default: outlineColor,
        // Input / output Options
        interaction: {
            hex: true,
            input: true,
        }
        }
    }).on('change', (color, source, instance) => {
        setCustomColors(baseColor, color, outlineColor.toHEXA())
        document.getElementById('font-fontOutlineColor').style.backgroundColor=color.toHEXA()
    })


    new Pickr({
        el: '#font-fontBaseColor',
        theme: 'nano',
        useAsButton: true,
        components: {
        preview: true,
        opacity: true,
        hue: true,
        default: baseColor,
        // Input / output Options
        interaction: {
            hex: true,
            input: true,
        }
        }
    }).on('change', (color, source, instance) => {
        setCustomColors(color.toHEXA(), shadowColor, outlineColor)
        document.getElementById('font-fontBaseColor').style.backgroundColor=color.toHEXA()
    })

    new Pickr({
        el: '#font-fontShadowColor',
        theme: 'nano',
        useAsButton: true,
        components: {
        preview: true,
        opacity: true,
        hue: true,
        default: shadowColor,
        // Input / output Options
        interaction: {
            hex: true,
            input: true,
        }
        }
    }).on('change', (color, source, instance) => {
        setCustomColors(baseColor, color.toHEXA(), outlineColor)
        document.getElementById('font-fontShadowColor').style.backgroundColor=color.toHEXA()
    })

    document.querySelectorAll("[name=opentype]").forEach((element) => {
        let otFeatures = {
            'kern': true,
            'blwf': true,
            'blws': true,
            'pref': true,
            'pres': true,
            'akhn': true,
            'pstf': true,
            'psts': true,
            'liga': true
        }

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

    document.getElementById('palette').style.display="none"
    document.getElementById('font-fontBaseColor').style.backgroundColor=baseColor.substring(0,7)
    document.getElementById('font-fontOutlineColor').style.backgroundColor=outlineColor.substring(0,7)
    document.getElementById('font-fontShadowColor').style.backgroundColor=shadowColor.substring(0,7)
    setCustomColors()
}

function setCustomColors(base='#ffa348ff', shadow="#63452cff", outline="#63452cff"){
    const colorFontName = "SeventyColor"
    const sheetId = "custompalette"
    var sheet = document.getElementById(sheetId)
    if (!sheet){
        sheet = document.createElement('style')
        sheet.id = sheetId
        document.body.appendChild(sheet);
    }

    sheet.innerHTML = `@font-palette-values --custom  {font-family: '${colorFontName}'; base-palette: 0; override-colors: 0 ${shadow}, 1 ${base}, 2 ${outline};}`;
}

window.onload = listen
const source = new EventSource('/stream');
source.onmessage = (event) => {
    const message = JSON.parse(event.data);
    document.getElementById("font-version").innerText = `${message.fontname}: ${message.version}-${message.build}`
    loadFont(`${message.version}-${message.build}`)
};
