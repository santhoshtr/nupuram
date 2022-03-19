#!/usr/bin/make -f

INSTALLPATH=/usr/share/fonts/opentype/malayalam
PY=python3

NAME=`awk -F " " '/^name:/ {print $$2}' config.yaml`
VERSION=`awk -F ": " '/version/ {print $$2}' config.yaml`
BLDDIR=`awk -F ": " '/build/ {print $$2}' config.yaml`
tests=tests
default: build
all: clean build test pdfs

build:
	$(PY) tools/builder.py

install: otf
	@mkdir -p ${DESTDIR}${INSTALLPATH}
	install -D -m 0644 $(BLDDIR)/*.otf ${DESTDIR}${INSTALLPATH}/

test: build
	# fontbakery check-fontval $(BLDDIR)/*.ttf <- enable when https://github.com/microsoft/Font-Validator/issues/62 fixed
	fontbakery check-ufo-sources $(BLDDIR)/*.ufo
	fontbakery check-opentype $(BLDDIR)/*.otf
	# fontbakery check-googlefonts -x com.google.fonts/check/name/license -x com.google.fonts/check/version_bump -x com.google.fonts/check/glyph_coverage -x com.google.fonts/check/repo/zip_files $(BLDDIR)/*.ttf

clean:
	@rm -rf $(BLDDIR)

pdfs:
	@hb-view  $(BLDDIR)/*.otf --font-size 1 --margin 1 --line-space 1 \
		--foreground=333333 --text-file $(tests)/ligatures.txt \
		--output-file $(BLDDIR)/ligatures.pdf;
	@hb-view $(BLDDIR)/*.otf --font-size 1 --margin 1 --line-space 1 \
		--foreground=333333 --text-file $(tests)/content.txt \
		--output-file $(BLDDIR)/content.pdf;

	@hb-view  $(BLDDIR)/*.otf  --font-size 1 --margin 1 --line-space 1 \
		--foreground=333333 --text-file $(tests)/kerning.txt \
		--output-file  $(BLDDIR)/kerning.pdf ;
	@hb-view  $(BLDDIR)/*.otf --font-size 1 --margin 1 --line-space 1 \
		--foreground=333333 --text-file $(tests)/latin.txt \
		--output-file  $(BLDDIR)/latin.pdf ;
