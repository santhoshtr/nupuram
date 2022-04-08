#!/usr/bin/make -f

# https://www.gnu.org/software/make/manual/html_node/One-Shell.html
.ONESHELL:

PY=python3
FAMILY=$(shell $(PY) tools/read_config.py name)
VERSION=$(shell $(PY) tools/read_config.py version)
FONTSDIR=$(shell $(PY) tools/read_config.py build)
PROOFDIR=$(shell $(PY) tools/read_config.py proofs)
TESTSDIR=$(shell $(PY) tools/read_config.py tests)

default: build

help:
	@echo "Build targets for $(FAMILY)"
	@echo
	@echo "  make build:  Builds the fonts and places them in the fonts/ directory"
	@echo "  make test:   Tests the fonts with fontbakery"
	@echo "  make proof:  Creates HTML proof documents in the proof/ directory"
	@echo

build: build.stamp

test: venv build.stamp proof
	# fontbakery check-fontval $(FONTSDIR)/*.ttf <- enable when https://github.com/microsoft/Font-Validator/issues/62 fixed
	fontbakery check-ufo-sources $(FONTSDIR)/*.ufo
	fontbakery check-opentype $(FONTSDIR)/*.otf
	# fontbakery check-googlefonts -x com.google.fonts/check/name/license -x com.google.fonts/check/version_bump -x com.google.fonts/check/glyph_coverage -x com.google.fonts/check/repo/zip_files $(FONTSDIR)/*.ttf

outline:
	@mkdir -p ${FONTSDIR}
	$(PY) tools/outline.py

build.stamp: .venv .init.stamp config.yaml
	rm -rf $(FONTSDIR)
	@mkdir -p ${FONTSDIR}
	. .venv/bin/activate
	$(PY) tools/builder.py
	touch build.stamp

.init.stamp: .venv
	. .venv/bin/activate
	touch .init.stamp

.venv: .venv/touchfile

.venv/touchfile: requirements.txt
	$(PY) -m venv .venv
	. .venv/bin/activate
	pip install -Ur requirements.txt
	touch .venv/touchfile

update:
	pip install --upgrade $(dependency)
	pip freeze > requirements.txt

clean:
	rm -rf .venv
	find -iname "*.pyc" -delete
	@rm -rf $(FONTSDIR)
	@rm -rf $(PROOFDIR)

proof: build.stamp
	@hb-view  $(FONTSDIR)/*.otf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/ligatures.txt \
		--output-file $(PROOFDIR)/ligatures.pdf;
	@hb-view $(FONTSDIR)/*.otf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/content.txt \
		--output-file $(PROOFDIR)/content.pdf;

	@hb-view  $(FONTSDIR)/*.otf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/kerning.txt \
		--output-file  $(PROOFDIR)/kerning.pdf ;
	@hb-view  $(FONTSDIR)/*.otf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/latin.txt \
		--output-file  $(PROOFDIR)/latin.pdf ;

	# Color pdfs
	@hb-view  $(FONTSDIR)/*.color.ttf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/ligatures.txt \
		--output-file $(PROOFDIR)/ligatures.color.pdf;
	@hb-view $(FONTSDIR)/*.color.ttf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/content.txt \
		--output-file $(PROOFDIR)/content.color.pdf;

	@hb-view  $(FONTSDIR)/*.color.ttf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/kerning.txt \
		--output-file  $(PROOFDIR)/kerning.color.pdf ;
	@hb-view  $(FONTSDIR)/*.color.ttf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/latin.txt \
		--output-file  $(PROOFDIR)/latin.color.pdf ;
