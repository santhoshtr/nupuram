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

UFO=$(STYLES:%=$(SOURCEDIR)/$(FAMILY)-%.ufo)
OTF=$(STYLES:%=$(FONTSDIR)/$(FAMILY)-%.otf)
TTF=$(STYLES:%=$(FONTSDIR)/$(FAMILY)-%.ttf)
WOFF2=$(STYLES:%=$(FONTSDIR)/$(FAMILY)-%.woff2)

default: build

help:
	@echo "Build targets"
	@echo
	@echo "  make build:  Builds the fonts and places them in the fonts/ directory"
	@echo "  make test:   Tests the fonts with fontbakery"
	@echo "  make proof:  Creates HTML proof documents in the proof/ directory"
	@echo

build: otf ttf webfonts

test: proof
	# fontbakery check-fontval $(FONTSDIR)/*.ttf <- enable when https://github.com/microsoft/Font-Validator/issues/62 fixed
	fontbakery check-ufo-sources $(FONTSDIR)/*.ufo
	fontbakery check-opentype $(FONTSDIR)/*.otf
	# fontbakery check-googlefonts -x com.google.fonts/check/name/license -x com.google.fonts/check/version_bump -x com.google.fonts/check/glyph_coverage -x com.google.fonts/check/repo/zip_files $(FONTSDIR)/*.ttf

$(SOURCEDIR)/$(FAMILY)-Regular.ufo:
	@echo "  BUILD    $(@F)"
	$(PY) tools/builder.py --style Regular --source $(SOURCEDIR)/design/Regular --output $(SOURCEDIR)/$(FAMILY)-Regular.ufo

$(SOURCEDIR)/$(FAMILY)-Outline.ufo: ${FONTSDIR}/$(FAMILY)-Regular.otf
	@echo "  BUILD    $(@F)"
	@mkdir -p ${FONTSDIR}
	$(FONTFORGE) tools/ff_gen_outline_font.pe ${FONTSDIR}/$(FAMILY)-Regular.otf ${FONTSDIR}/$(FAMILY)-Outline.otf 10
	cp -rf $(SOURCEDIR)/$(FAMILY)-Regular.ufo $@
	$(PY) tools/otf2ufo.py ${FONTSDIR}/$(FAMILY)-Outline.otf $@
	rm ${FONTSDIR}/$(FAMILY)-Outline.otf

$(SOURCEDIR)/$(FAMILY)-Shadow.ufo: ${FONTSDIR}/$(FAMILY)-Regular.otf
	@echo "  BUILD    $(@F)"
	@mkdir -p ${FONTSDIR}
	$(FONTFORGE) tools/ff_gen_shadow_font.pe ${FONTSDIR}/$(FAMILY)-Regular.otf ${FONTSDIR}/$(FAMILY)-Shadow.otf -45 10 100
	cp -rf $(SOURCEDIR)/$(FAMILY)-Regular.ufo $@
	$(PY) tools/otf2ufo.py ${FONTSDIR}/$(FAMILY)-Shadow.otf $@
	rm ${FONTSDIR}/$(FAMILY)-Shadow.otf

$(SOURCEDIR)/$(FAMILY)-Color.ufo: $(SOURCEDIR)/$(FAMILY)-Regular.ufo $(SOURCEDIR)/$(FAMILY)-Outline.ufo $(SOURCEDIR)/$(FAMILY)-Shadow.ufo
	@echo "  BUILD    $(@F)"
	$(PY) tools/build_color_v0.py $@

ufo: $(UFO)
ttf: $(TTF) $(FONTSDIR)/$(FAMILY)-Color-v1.ttf
otf: $(OTF) $(FONTSDIR)/$(FAMILY)-Color-v1.otf
webfonts: $(WOFF2) $(FONTSDIR)/$(FAMILY)-Color-v1.woff2

$(FONTSDIR)/$(FAMILY)-Color-v0.ttf: $(FONTSDIR)/$(FAMILY)-Color.ttf
	cp $< $@

$(FONTSDIR)/$(FAMILY)-Color-v0.otf: $(FONTSDIR)/$(FAMILY)-Color.otf
	cp $< $@

$(FONTSDIR)/$(FAMILY)-Color-v0.woff2: $(FONTSDIR)/$(FAMILY)-Color.woff2
	cp $< $@

$(FONTSDIR)/$(FAMILY)-Color-v1.ttf: $(FONTSDIR)/$(FAMILY)-Color-v0.ttf
	$(PY) tools/build_color_v1.py $< $@

$(FONTSDIR)/$(FAMILY)-Color-v1.otf: $(FONTSDIR)/$(FAMILY)-Color-v0.otf
	$(PY) tools/build_color_v1.py $< $@

$(FONTSDIR)/$(FAMILY)-Color-v1.woff2: $(FONTSDIR)/$(FAMILY)-Color-v1.ttf
	@echo " BUILD   $(@F)"
	@fonttools ttLib.woff2 compress  $<

$(FONTSDIR)/%.otf: $(SOURCEDIR)/%.ufo
	@echo "  BUILD    $(@F)"
	@fontmake --validate-ufo --verbose=WARNING -o otf --output-dir $(FONTSDIR) -u $<
	$(PY) tools/fix_font.py $@

$(FONTSDIR)/%.ttf: $(SOURCEDIR)/%.ufo
	@echo "  BUILD    $(@F)"
	@fontmake --verbose=WARNING -o ttf -e 0.01 --output-dir $(FONTSDIR) -u $<
	$(PY) tools/fix_font.py $@

$(FONTSDIR)/%.woff2: $(FONTSDIR)/%.ttf
	@echo " BUILD   $(@F)"
	@fonttools ttLib.woff2 compress  $<

clean:
	find -iname "*.pyc" -delete
	@rm -rf $(FONTSDIR)
	@rm -rf $(PROOFDIR)

proof:
	@mkdir -p ${PROOFDIR}
	@hb-view  $(FONTSDIR)/*Regular.otf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/ligatures.txt \
		--output-file $(PROOFDIR)/ligatures.pdf;
	@hb-view $(FONTSDIR)/*Regular.otf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/content.txt \
		--output-file $(PROOFDIR)/content.pdf;

	@hb-view  $(FONTSDIR)/*Regular.otf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/kerning.txt \
		--output-file  $(PROOFDIR)/kerning.pdf ;
	@hb-view  $(FONTSDIR)/*Regular.otf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/latin.txt \
		--output-file  $(PROOFDIR)/latin.pdf ;

	# Color pdfs
	@hb-view  $(FONTSDIR)/*-colrv0.ttf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/ligatures.txt \
		--output-file $(PROOFDIR)/ligatures-colrv0.pdf;
	@hb-view $(FONTSDIR)/*-colrv0.ttf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/content.txt \
		--output-file $(PROOFDIR)/content-colrv0.pdf;

	@hb-view  $(FONTSDIR)/*-colrv0.ttf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/kerning.txt \
		--output-file  $(PROOFDIR)/kerning-colrv0.pdf ;
	@hb-view  $(FONTSDIR)/*-colrv0.ttf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/latin.txt \
		--output-file  $(PROOFDIR)/latin-colrv0.pdf ;
