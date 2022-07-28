#!/usr/bin/make -f

PY=python3
FAMILY=$(shell $(PY) tools/read_config.py name)
STYLES=$(shell $(PY) tools/read_config.py styles)
SOURCEDIR=sources
FONTSDIR=fonts
PROOFDIR=proofs
TESTSDIR=tests
TTFDIR=${FONTSDIR}/ttf
OTFDIR=${FONTSDIR}/otf
WEBFONTSDIR=${FONTSDIR}/webfonts
UFODIR=${FONTSDIR}/ufo

UFO=$(STYLES:%=$(FONTSDIR)/ufo/$(FAMILY)-%.ufo)
OTF=$(STYLES:%=$(OTFDIR)/$(FAMILY)-%.otf)
TTF=$(STYLES:%=${TTFDIR}/$(FAMILY)-%.ttf)
WOFF2=$(STYLES:%=$(FONTSDIR)/webfonts/$(FAMILY)-%.woff2)

.PHONY: variants $(STYLES) ufo otf ttf webfonts clean

default: build

help:
	@echo "Build targets"
	@echo
	@echo "  make build:  Builds the fonts and places them in the fonts/ directory"
	@echo "  make test:   Tests the fonts with fontbakery"
	@echo "  make proof:  Creates HTML proof documents in the proof/ directory"
	@echo

build: ufo otf ttf webfonts

glyphs: $(STYLES)

$(STYLES):
	VARIANT=$@ $(MAKE) -C $(SOURCEDIR)

$(UFODIR)/$(FAMILY)-%.ufo:
	@echo "  BUILD UFO   $(@F)"
	@mkdir -p ${UFODIR}
	$(PY) tools/builder.py --style $* --weight 400 --source $(SOURCEDIR)/svgs/$* --output $@
	@ufonormalizer -q -m $@

ufo: glyphs $(UFO)
ttf: $(TTF) # $(TTFDIR)/$(FAMILY)-Color-v1.ttf
otf: $(OTF) # $(OTFDIR)/$(FAMILY)-Color-v1.otf
webfonts: $(WOFF2) # $(WEBFONTSDIR)/$(FAMILY)-Color-v1.woff2

${TTFDIR}/$(FAMILY)-Color-v0.ttf: ${TTFDIR}/$(FAMILY)-Color.ttf
	@cp $< $@

$(OTFDIR)/$(FAMILY)-Color-v0.otf: $(OTFDIR)/$(FAMILY)-Color.otf
	@cp $< $@

$(OTFDIR)/$(FAMILY)-Color-v0.woff2: $(WEBFONTSDIR)/$(FAMILY)-Color.woff2
	@cp $< $@

${TTFDIR}/$(FAMILY)-Color-v1.ttf: ${TTFDIR}/$(FAMILY)-Color-v0.ttf
	$(PY) tools/build_color_v1.py $< $@

$(OTFDIR)/$(FAMILY)-Color-v1.otf: $(OTFDIR)/$(FAMILY)-Color-v0.otf
	$(PY) tools/build_color_v1.py $< $@

$(WEBFONTSDIR)/$(FAMILY)-Color-v1.woff2: ${TTFDIR}/$(FAMILY)-Color-v1.ttf
	@echo " BUILD  WEBFONT $(@F)"
	@mkdir -p ${WEBFONTSDIR}
	@fonttools ttLib.woff2 compress -o  $@ $<

$(OTFDIR)/%.otf: ${UFODIR}/%.ufo
	@echo "  BUILD  OTF  $(@F)"
	@fontmake --validate-ufo --verbose=WARNING -o otf --output-dir $(OTFDIR) -u $(UFODIR)/$*.ufo
	$(PY) tools/fix_font.py $@

${TTFDIR}/%.ttf: ${UFODIR}/%.ufo
	@echo "  BUILD  TTF  $(@F)"
	@fontmake --verbose=WARNING -o ttf --flatten-components --filter DecomposeTransformedComponentsFilter -e 0.01 --output-dir ${TTFDIR} -u $(UFODIR)/$*.ufo
	$(PY) tools/fix_font.py $@

$(FONTSDIR)/webfonts/%.woff2: ${TTFDIR}/%.ttf
	@echo " BUILD WEBFONT  $(@F)"
	@mkdir -p ${WEBFONTSDIR}
	@fonttools ttLib.woff2 compress -q -o  $@ $<

vf: variablefont

variablefont:
	fontmake -m $(FAMILY).designspace -o variable --output-dir $(FONTSDIR)/variable-ttf
	fontmake -m $(FAMILY).designspace -o variable-cff2 --output-dir $(FONTSDIR)/variable-cff2

variableinstances:
	fontmake -i --output-dir $(FONTSDIR)/instances -m $(FAMILY).designspace

clean:
	@find -iname "*.pyc" -delete
	@rm -rf $(FONTSDIR) $(PROOFDIR)

proofs: otf
	@mkdir -p ${PROOFDIR}
	@hb-view  $(OTFDIR)/$(FAMILY)-Regular.otf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/ligatures.txt \
		--output-file $(PROOFDIR)/ligatures.pdf;
	@hb-view $(OTFDIR)/$(FAMILY)-Regular.otf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/content.txt \
		--output-file $(PROOFDIR)/content.pdf;

	@hb-view  $(OTFDIR)/$(FAMILY)-Regular.otf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/kerning.txt \
		--output-file  $(PROOFDIR)/kerning.pdf ;
	@hb-view  $(OTFDIR)/$(FAMILY)-Regular.otf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/latin.txt \
		--output-file  $(PROOFDIR)/latin.pdf ;

test: otf ttf proofs
	# fontbakery check-fontval $(FONTSDIR)/$(FAMILY)-Regular.ttf <- enable when https://github.com/microsoft/Font-Validator/issues/62 fixed
	fontbakery check-ufo-sources $(FONTSDIR)/ufo/$(FAMILY)-Regular.ufo
	fontbakery check-opentype $(OTFDIR)/$(FAMILY)-Regular.otf
	fontbakery check-googlefonts -x com.google.fonts/check/name/license -x com.google.fonts/check/license/OFL_body_text -x com.google.fonts/check/version_bump -x com.google.fonts/check/repo/zip_files $(TTFDIR)/$(FAMILY)-Regular.ttf
