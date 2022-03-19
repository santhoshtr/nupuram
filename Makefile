#!/usr/bin/make -f

INSTALLPATH=/usr/share/fonts/opentype/malayalam
PY=python3
version=`cat VERSION`
TOOLDIR=tools
SRCDIR=sources
tests=tests
BLDDIR=build
default: build
all: clean build test PDFS

PDFS=$(FONTS:%=$(BLDDIR)/$(NAME)-%-ligatures.pdf)   \
	$(FONTS:%=$(BLDDIR)/$(NAME)-%-content.pdf)  \
	$(FONTS:%=$(BLDDIR)/$(NAME)-%-latin.pdf)    \
	$(FONTS:%=$(BLDDIR)/$(NAME)-%-kerning.pdf)   \
	$(FONTS:%=$(BLDDIR)/$(NAME)-%-table.pdf)

$(BLDDIR)/%-table.pdf:
	@echo "   TEST    $(@F)"
	@fntsample --font-file $< --output-file $(BLDDIR)/*.otf        \
		--style="header-font: Noto Sans Regular 12"                   \
		--style="font-name-font: Noto Serif Regular 12"               \
		--style="table-numbers-font: Noto Sans 10"                 \
		--style="cell-numbers-font:Noto Sans Mono 8"

$(BLDDIR)/%-ligatures.pdf:
	@echo "   TEST    $(@F)"
	@hb-view $< --font-size 14 --margin 100 --line-space 1.5 \
		--foreground=333333 --text-file $(tests)/ligatures.txt \
		--output-file $(BLDDIR)/*.otf;

$(BLDDIR)/%-content.pdf:
	@echo "   TEST    $(@F)"
	@hb-view $< --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(tests)/content.txt \
		--output-file $(BLDDIR)/*.otf;

$(BLDDIR)/%-kerning.pdf:
	@echo "   TEST    $(@F)"
	@hb-view $< --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(tests)/kerning.txt \
		--output-file $(BLDDIR)/*.otf;

$(BLDDIR)/%-latin.pdf:
	@echo "   TEST    $(@F)"
	@hb-view $< --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(tests)/latin.txt \
		--output-file $(BLDDIR)/*.otf;

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
