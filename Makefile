#!/usr/bin/make -f

INSTALLPATH=/usr/share/fonts/opentype/malayalam
PY=python3

NAME=`awk -F " " '/^name:/ {print $$2}' config.yaml`
VERSION=`awk -F ": " '/version/ {print $$2}' config.yaml`
BLDDIR=`awk -F ": " '/build/ {print $$2}' config.yaml`
BASEDESIGNDIR=`awk -F ": " '/^design/ {print $$2}' config.yaml`
OUTLINEDESIGNDIR=`awk -F ": " '/^outline/ {print $$2}' config.yaml`
TESTSDIR=tests
default: build
all: clean build test pdfs

build:
	@mkdir -p ${BLDDIR}
	$(PY) tools/builder.py

install: otf
	@mkdir -p ${DESTDIR}${INSTALLPATH}
	install -D -m 0644 $(BLDDIR)/*.otf ${DESTDIR}${INSTALLPATH}/

test: build pdfs
	# fontbakery check-fontval $(BLDDIR)/*.ttf <- enable when https://github.com/microsoft/Font-Validator/issues/62 fixed
	fontbakery check-ufo-sources $(BLDDIR)/*.ufo
	fontbakery check-opentype $(BLDDIR)/*.otf
	# fontbakery check-googlefonts -x com.google.fonts/check/name/license -x com.google.fonts/check/version_bump -x com.google.fonts/check/glyph_coverage -x com.google.fonts/check/repo/zip_files $(BLDDIR)/*.ttf

outline:
	@mkdir -p ${BLDDIR}
	$(PY) tools/outline.py

clean:
	@echo ${call yaml,author,name}
	@rm -rf $(BLDDIR)

pdfs:
	@hb-view  $(BLDDIR)/*.otf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/ligatures.txt \
		--output-file $(BLDDIR)/ligatures.pdf;
	@hb-view $(BLDDIR)/*.otf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/content.txt \
		--output-file $(BLDDIR)/content.pdf;

	@hb-view  $(BLDDIR)/*.otf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/kerning.txt \
		--output-file  $(BLDDIR)/kerning.pdf ;
	@hb-view  $(BLDDIR)/*.otf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/latin.txt \
		--output-file  $(BLDDIR)/latin.pdf ;

	# Color pdfs
	@hb-view  $(BLDDIR)/*.color.ttf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/ligatures.txt \
		--output-file $(BLDDIR)/ligatures.color.pdf;
	@hb-view $(BLDDIR)/*.color.ttf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/content.txt \
		--output-file $(BLDDIR)/content.color.pdf;

	@hb-view  $(BLDDIR)/*.color.ttf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/kerning.txt \
		--output-file  $(BLDDIR)/kerning.color.pdf ;
	@hb-view  $(BLDDIR)/*.color.ttf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/latin.txt \
		--output-file  $(BLDDIR)/latin.color.pdf ;
