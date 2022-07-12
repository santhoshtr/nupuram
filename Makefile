#!/usr/bin/make -f

# https://www.gnu.org/software/make/manual/html_node/One-Shell.html
.ONESHELL:

PY=python3
FONTFORGE=/usr/bin/fontforge
FAMILY=$(shell $(PY) tools/read_config.py name)
STYLES=$(shell $(PY) tools/read_config.py styles)
VERSION=$(shell $(PY) tools/read_config.py version)
SOURCEDIR=$(shell $(PY) tools/read_config.py sources)
FONTSDIR=$(shell $(PY) tools/read_config.py build)
PROOFDIR=$(shell $(PY) tools/read_config.py proofs)
TESTSDIR=$(shell $(PY) tools/read_config.py tests)
TTFDIR=${FONTSDIR}/ttf
OTFDIR=${FONTSDIR}/otf
WEBFONTSDIR=${FONTSDIR}/webfonts
UFODIR=${FONTSDIR}/ufo

UFO=$(STYLES:%=$(FONTSDIR)/ufo/$(FAMILY)-%.ufo)
OTF=$(STYLES:%=$(OTFDIR)/$(FAMILY)-%.otf)
TTF=$(STYLES:%=${TTFDIR}/$(FAMILY)-%.ttf)
WOFF2=$(STYLES:%=$(FONTSDIR)/webfonts/$(FAMILY)-%.woff2)


default: build

help:
	@echo "Build targets"
	@echo
	@echo "  make build:  Builds the fonts and places them in the fonts/ directory"
	@echo "  make test:   Tests the fonts with fontbakery"
	@echo "  make proof:  Creates HTML proof documents in the proof/ directory"
	@echo

build: ufo otf ttf webfonts

glyphs:
	VARIANT=kids make -C sources/design
	VARIANT=regular make -C sources/design
	VARIANT=calligraphy make -C sources/design
	VARIANT=bold make -C sources/design
	VARIANT=debug make -C sources/design
	VARIANT=display make -C sources/design
	VARIANT=shadow make -C sources/design
	VARIANT=slanted make -C sources/design
	VARIANT=condense make -C sources/design
	VARIANT=sans make -C sources/design


$(UFODIR)/$(FAMILY)-Regular.ufo:
	@echo "  BUILD    $(@F)"
	@mkdir -p ${UFODIR}
	$(PY) tools/builder.py --style Regular --source $(SOURCEDIR)/design/regular --output $@
	@ufonormalizer -m $@

$(UFODIR)/$(FAMILY)-Display.ufo:
	@echo "  BUILD    $(@F)"
	@mkdir -p ${UFODIR}
	$(PY) tools/builder.py --style Regular --source $(SOURCEDIR)/design/display --output $@
	@ufonormalizer -m $@

$(UFODIR)/$(FAMILY)-Kids.ufo:
	@echo "  BUILD    $(@F)"
	@mkdir -p ${UFODIR}
	$(PY) tools/builder.py --style Regular --source $(SOURCEDIR)/design/kids --output $@
	@ufonormalizer -m $@

$(UFODIR)/$(FAMILY)-Calligraphy.ufo:
	@echo "  BUILD    $(@F)"
	@mkdir -p ${UFODIR}
	$(PY) tools/builder.py --style Regular --source $(SOURCEDIR)/design/calligraphy --output $@
	@ufonormalizer -m $@

$(UFODIR)/$(FAMILY)-Slanted.ufo:
	@echo "  BUILD    $(@F)"
	@mkdir -p ${UFODIR}
	$(PY) tools/builder.py --style Regular --source $(SOURCEDIR)/design/slanted --output $@
	@ufonormalizer -m $@

$(UFODIR)/$(FAMILY)-Condense.ufo:
	@echo "  BUILD    $(@F)"
	@mkdir -p ${UFODIR}
	$(PY) tools/builder.py --style Regular --source $(SOURCEDIR)/design/condense --output $@
	@ufonormalizer -m $@

$(UFODIR)/$(FAMILY)-Sans.ufo:
	@echo "  BUILD    $(@F)"
	@mkdir -p ${UFODIR}
	$(PY) tools/builder.py --style Regular --source $(SOURCEDIR)/design/sans --output $@
	@ufonormalizer -m $@

$(UFODIR)/$(FAMILY)-Outline.ufo: ${OTFDIR}/$(FAMILY)-Regular.otf
	@echo "  BUILD    $(@F)"
	@mkdir -p ${OTFDIR}
	@mkdir -p ${UFODIR}
	$(FONTFORGE) tools/ff_gen_outline_font.pe ${OTFDIR}/$(FAMILY)-Regular.otf ${OTFDIR}/$(FAMILY)-Outline.otf 10
	cp -rf $(UFODIR)/$(FAMILY)-Regular.ufo $@
	$(PY) tools/otf2ufo.py ${OTFDIR}/$(FAMILY)-Outline.otf $@
	rm ${OTFDIR}/$(FAMILY)-Outline.otf
	$(PY) tools/fix_ufo_info.py -u  $@ -f "$(FAMILY) Outline" -s Regular
	@ufonormalizer -m $@

$(UFODIR)/$(FAMILY)-Shadow.ufo: ${OTFDIR}/$(FAMILY)-Regular.otf
	@echo "  BUILD    $(@F)"
	@mkdir -p ${UFODIR}
	$(FONTFORGE) tools/ff_gen_shadow_font.pe ${OTFDIR}/$(FAMILY)-Regular.otf ${OTFDIR}/$(FAMILY)-Shadow.otf -45 6 80
	cp -rf $(UFODIR)/$(FAMILY)-Regular.ufo $@
	$(PY) tools/otf2ufo.py ${OTFDIR}/$(FAMILY)-Shadow.otf $@
	rm ${OTFDIR}/$(FAMILY)-Shadow.otf
	$(PY) tools/fix_ufo_info.py -u  $@ -f "$(FAMILY) Shadow" -s Regular
	@ufonormalizer -m $@

$(UFODIR)/$(FAMILY)-Color.ufo: ${UFODIR}/$(FAMILY)-Regular.ufo ${UFODIR}/$(FAMILY)-Outline.ufo ${UFODIR}/$(FAMILY)-Shadow.ufo
	@echo "  BUILD    $(@F)"
	$(PY) tools/build_color_v0.py $@
	$(PY) tools/fix_ufo_info.py -u  $@ -f "$(FAMILY) Color" -s Regular
	@ufonormalizer -m $@

ufo: glyphs $(UFO)
ttf: $(TTF) $(TTFDIR)/$(FAMILY)-Color-v1.ttf
otf: $(OTF) $(OTFDIR)/$(FAMILY)-Color-v1.otf
webfonts: $(WOFF2) $(WEBFONTSDIR)/$(FAMILY)-Color-v1.woff2

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
	@echo " BUILD   $(@F)"
	@mkdir -p ${WEBFONTSDIR}
	@fonttools ttLib.woff2 compress -o  $@ $<

$(OTFDIR)/%.otf: ${UFODIR}/%.ufo
	@echo "  BUILD    $(@F)"
	@fontmake --validate-ufo --verbose=WARNING -o otf --output-dir $(OTFDIR) -u $(UFODIR)/$*.ufo
	$(PY) tools/fix_font.py $@

${TTFDIR}/%.ttf: ${UFODIR}/%.ufo
	@echo "  BUILD    $(@F)"
	@fontmake --verbose=WARNING -o ttf --flatten-components --filter DecomposeTransformedComponentsFilter -e 0.01 --output-dir ${TTFDIR} -u $(UFODIR)/$*.ufo
	$(PY) tools/fix_font.py $@

$(FONTSDIR)/webfonts/%.woff2: ${TTFDIR}/%.ttf
	@echo " BUILD   $(@F)"
	@mkdir -p ${WEBFONTSDIR}
	@fonttools ttLib.woff2 compress -o  $@ $<

clean:
	find -iname "*.pyc" -delete
	@rm -rf $(FONTSDIR)
	@rm -rf $(PROOFDIR)

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
