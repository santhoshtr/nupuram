#!/usr/bin/make -f

PY=python3
FAMILY=Nupuram
STYLES=$(shell $(PY) tools/read_config.py styles)
SOURCEDIR=sources
FONTSDIR=fonts
PROOFDIR=proofs
TESTSDIR=tests
TTFDIR=${FONTSDIR}/ttf
OTFDIR=${FONTSDIR}/otf
WEBFONTSDIR=${FONTSDIR}/webfonts
UFODIR=${FONTSDIR}/ufo

UFO=$(STYLES:%=$(FONTSDIR)/ufo/$(FAMILY)-%.ufo) \
	$(FONTSDIR)/ufo/$(FAMILY)-Color.ufo \
	$(FONTSDIR)/ufo/$(FAMILY)-Arrows-Color.ufo
OTF=$(STYLES:%=$(OTFDIR)/$(FAMILY)-%.otf)
TTF=$(STYLES:%=${TTFDIR}/$(FAMILY)-%.ttf)
WOFF2=$(STYLES:%=$(FONTSDIR)/webfonts/$(FAMILY)-%.woff2)
VARTTF=${TTFDIR}/$(FAMILY)-VF.ttf ${TTFDIR}/$(FAMILY)-Calligraphy-VF.ttf
VAROTF=$(OTFDIR)/$(FAMILY)-VF.otf $(OTFDIR)/$(FAMILY)-Calligraphy-VF.otf
VARWOFF2=$(FONTSDIR)/webfonts/$(FAMILY)-VF.woff2 $(FONTSDIR)/webfonts/$(FAMILY)-Calligraphy-VF.woff2

.PHONY: variants $(STYLES) ufo otf ttf webfonts clean glyphs build proofs autobuild

default: build

help:
	@echo "Build targets"
	@echo
	@echo " make build: Builds the fonts and places them in the fonts/ directory"
	@echo " make test:  Tests the fonts with fontbakery"
	@echo " make proof: Creates HTML proof documents in the proof/ directory"
	@echo

build: ufo otf ttf webfonts

glyphs: $(STYLES)

$(STYLES):
	@mkdir -p $(SOURCEDIR)/svgs/$@
	VARIANT=$@ $(MAKE) -C $(SOURCEDIR)

# Recursively watch the file changes and make the (debug) svgs.
# Useful in design workflow.
# Package inotify-tools are available in linux distros
autobuild:
	while inotifywait -r -e MODIFY $(SOURCEDIR)/glyphs/; do $(MAKE) -C $(SOURCEDIR); done;

$(UFODIR)/$(FAMILY)-%.ufo: %
	@echo " BUILD UFO  $(@F)"
	@mkdir -p ${UFODIR}
	$(PY) tools/builder.py --style $* --source $(SOURCEDIR)/svgs/$* --output $@
	@ufonormalizer -q -m $@
	@# remove dangling semicolons in features.fea which font editors cannot handle
	@sed -i 's/ ;$\//g' $@/features.fea

$(UFODIR)/$(FAMILY)-Color.ufo: $(UFODIR)/$(FAMILY)-Regular.ufo $(UFODIR)/$(FAMILY)-Shadow.ufo
	@echo " BUILD UFO  $(@F)"
	$(PY) tools/build_color_v0.py $@
	@ufonormalizer -q -m $@

$(UFODIR)/$(FAMILY)-Arrows-Color.ufo: $(UFODIR)/$(FAMILY)-Arrows.ufo $(UFODIR)/$(FAMILY)-Regular.ufo
	@echo " BUILD UFO  $(@F)"
	$(PY) tools/build_color_v0.py $@
	@ufonormalizer -q -m $@

ufo: glyphs $(UFO)
ttf: $(TTF) $(VARTTF) $(TTFDIR)/$(FAMILY)-Color-v1.ttf $(TTFDIR)/$(FAMILY)-Arrows-Color-v1.ttf
otf: $(OTF) $(VAROTF) $(OTFDIR)/$(FAMILY)-Color-v1.otf $(OTFDIR)/$(FAMILY)-Arrows-Color-v1.otf
webfonts: $(WOFF2) $(VARWOFF2) $(WEBFONTSDIR)/$(FAMILY)-Color-v0.woff2 $(WEBFONTSDIR)/$(FAMILY)-Color-v1.woff2  $(WEBFONTSDIR)/$(FAMILY)-Arrows-Color-v0.woff2 $(WEBFONTSDIR)/$(FAMILY)-Arrows-Color-v1.woff2

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
	@echo " BUILD WEBFONT $(@F)"
	@mkdir -p ${WEBFONTSDIR}
	@fonttools ttLib.woff2 compress -q -o $@ $<

${TTFDIR}/$(FAMILY)-Arrows-Color-v0.ttf: ${TTFDIR}/$(FAMILY)-Arrows-Color.ttf
	@cp $< $@

$(OTFDIR)/$(FAMILY)-Arrows-Color-v0.otf: $(OTFDIR)/$(FAMILY)-Arrows-Color.otf
	@cp $< $@

$(OTFDIR)/$(FAMILY)-Arrows-Color-v0.woff2: $(WEBFONTSDIR)/$(FAMILY)-Arrows-Color.woff2
	@cp $< $@

${TTFDIR}/$(FAMILY)-Arrows-Color-v1.ttf: ${TTFDIR}/$(FAMILY)-Arrows-Color-v0.ttf
	$(PY) tools/build_color_v1.py $< $@

$(OTFDIR)/$(FAMILY)-Arrows-Color-v1.otf: $(OTFDIR)/$(FAMILY)-Arrows-Color-v0.otf
	$(PY) tools/build_color_v1.py $< $@

$(WEBFONTSDIR)/$(FAMILY)-Arrows-Color-v1.woff2: ${TTFDIR}/$(FAMILY)-Arrows-Color-v1.ttf
	@echo " BUILD WEBFONT $(@F)"
	@mkdir -p ${WEBFONTSDIR}
	@fonttools ttLib.woff2 compress -q -o $@ $<

$(OTFDIR)/%.otf: ${UFODIR}/%.ufo
	@echo " BUILD OTF $(@F)"
	@fontmake --validate-ufo --verbose=WARNING -o otf --output-dir $(OTFDIR) -u $(UFODIR)/$*.ufo
	$(PY) tools/fix_font.py $@

${TTFDIR}/%.ttf: ${UFODIR}/%.ufo
	@echo " BUILD TTF $(@F)"
	@fontmake --verbose=WARNING -o ttf --flatten-components --filter DecomposeTransformedComponentsFilter --output-dir ${TTFDIR} -u $(UFODIR)/$*.ufo
	$(PY) tools/fix_font.py $@

$(FONTSDIR)/webfonts/%.woff2: ${TTFDIR}/%.ttf
	@echo " BUILD WEBFONT $(@F)"
	@mkdir -p ${WEBFONTSDIR}
	@fonttools ttLib.woff2 compress -q -o $@ $<

${TTFDIR}/%-VF.ttf: %.designspace
	fontmake --filter DecomposeTransformedComponentsFilter -m $*.designspace -o variable --output-dir ${TTFDIR}
	$(PY) tools/fix_font.py $@
	$(PY) tools/stat.py $@

${OTFDIR}/%-VF.otf: %.designspace
	fontmake -m $*.designspace -o variable-cff2 --output-dir ${OTFDIR}
	$(PY) tools/fix_font.py $@
	$(PY) tools/stat.py $@

variableinstances:
	fontmake -i --output-dir $(FONTSDIR)/instances -m $(FAMILY).designspace

clean:
	@find -iname "*.pyc" -delete
	@rm -rf $(FONTSDIR) $(PROOFDIR)

proofs: $(OTFDIR)/$(FAMILY)-Regular.otf
	@mkdir -p ${PROOFDIR}
	@hb-view $(OTFDIR)/$(FAMILY)-Regular.otf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/ligatures.txt \
		--output-file $(PROOFDIR)/ligatures.pdf;
	@hb-view $(OTFDIR)/$(FAMILY)-Regular.otf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/content.txt \
		--output-file $(PROOFDIR)/content.pdf;

	@hb-view $(OTFDIR)/$(FAMILY)-Regular.otf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/kerning.txt \
		--output-file $(PROOFDIR)/kerning.pdf ;
	@hb-view $(OTFDIR)/$(FAMILY)-Regular.otf --font-size 24 --margin 100 --line-space 2.4 \
		--foreground=333333 --text-file $(TESTSDIR)/latin.txt \
		--output-file $(PROOFDIR)/latin.pdf ;

test: proofs ${TTFDIR}/$(FAMILY)-VF.ttf
	# fontbakery check-fontval $(FONTSDIR)/$(FAMILY)-Regular.ttf <- enable when https://github.com/microsoft/Font-Validator/issues/62 fixed
	fontbakery check-ufo-sources $(FONTSDIR)/ufo/$(FAMILY)-Regular.ufo
	fontbakery check-opentype $(OTFDIR)/$(FAMILY)-Regular.otf
	cp ${TTFDIR}/$(FAMILY)-VF.ttf ${TTFDIR}/$(FAMILY)[slnt,soft,wdth,wght].ttf
	fontbakery check-googlefonts --full-lists -x com.google.fonts/check/name/license -x com.google.fonts/check/license/OFL_body_text -x com.google.fonts/check/version_bump -x com.google.fonts/check/repo/zip_files ${TTFDIR}/$(FAMILY)[slnt,soft,wdth,wght].ttf

install: otf
	@cp ${OTFDIR}/$(FAMILY)-VF.otf ~/.fonts;
	@cp ${OTFDIR}/$(FAMILY)-Calligraphy-VF.otf ~/.fonts;
	@cp ${OTFDIR}/$(FAMILY)-Dots.otf ~/.fonts;
	@cp ${OTFDIR}/$(FAMILY)-Arrows.otf ~/.fonts;
	@cp ${OTFDIR}/$(FAMILY)-Color-v0.otf ~/.fonts;
	@cp ${OTFDIR}/$(FAMILY)-Arrows-Color-v0.otf ~/.fonts;
	@fc-cache -fr

release:
	# Tar files - OTF, TTF, WEBFONTS
	tar czvf $(FONTSDIR)/$(FAMILY).tar.gz *.conf OFL.txt README.md ${TTFDIR} ${OTFDIR} ${WEBFONTSDIR}
	sha256sum $(FONTSDIR)/$(FAMILY).tar.gz > $(FONTSDIR)/$(FAMILY).tar.gz.sha256
	md5sum $(FONTSDIR)/$(FAMILY).tar.gz > $(FONTSDIR)/$(FAMILY).tar.gz.md5
	# Zip files
	zip -r $(FONTSDIR)/$(FAMILY).zip README.md OFL.txt ${TTFDIR} ${OTFDIR} ${WEBFONTSDIR}
	sha256sum $(FONTSDIR)/$(FAMILY).zip > $(FONTSDIR)/$(FAMILY).zip.sha256
	md5sum $(FONTSDIR)/$(FAMILY).zip > $(FONTSDIR)/$(FAMILY).zip.md5

	# Webfonts Tar files
	tar czvf $(FONTSDIR)/$(FAMILY)-webfonts.tar.gz *.conf OFL.txt README.md ${WEBFONTSDIR}
	sha256sum $(FONTSDIR)/$(FAMILY)-webfonts.tar.gz > $(FONTSDIR)/$(FAMILY)-webfonts.tar.gz.sha256
	md5sum $(FONTSDIR)/$(FAMILY)-webfonts.tar.gz > $(FONTSDIR)/$(FAMILY).tar.gz.md5
	# Webfonts Zip files
	zip -r $(FONTSDIR)/$(FAMILY)-webfonts.zip README.md OFL.txt ${WEBFONTSDIR}
	sha256sum $(FONTSDIR)/$(FAMILY)-webfonts.zip > $(FONTSDIR)/$(FAMILY)-webfonts.zip.sha256
	md5sum $(FONTSDIR)/$(FAMILY)-webfonts.zip > $(FONTSDIR)/$(FAMILY)-webfonts.zip.md5

	# UFO Tar files
	tar czvf $(FONTSDIR)/$(FAMILY)-ufo.tar.gz *.conf OFL.txt README.md ${UFODIR}
	sha256sum $(FONTSDIR)/$(FAMILY)-ufo.tar.gz > $(FONTSDIR)/$(FAMILY)-ufo.tar.gz.sha256
	md5sum $(FONTSDIR)/$(FAMILY)-ufo.tar.gz > $(FONTSDIR)/$(FAMILY).tar.gz.md5
	# UFO Zip files
	zip -r $(FONTSDIR)/$(FAMILY)-ufo.zip README.md OFL.txt ${UFODIR}
	sha256sum $(FONTSDIR)/$(FAMILY)-ufo.zip > $(FONTSDIR)/$(FAMILY)-ufo.zip.sha256
	md5sum $(FONTSDIR)/$(FAMILY)-ufo.zip > $(FONTSDIR)/$(FAMILY)-ufo.zip.md5

