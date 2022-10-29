#!/usr/bin/make -f
SHELL:=/bin/bash
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
UFODIR=${SOURCEDIR}/ufo
INSTALLDIR=~/.fonts/$(FAMILY)

UFO=$(STYLES:%=$(UFODIR)/$(FAMILY)-%.ufo) \
	$(UFODIR)/$(FAMILY)-Color-Regular.ufo \
	$(UFODIR)/$(FAMILY)-Color-Thin.ufo \
	$(UFODIR)/$(FAMILY)-Color-Black.ufo \
	$(UFODIR)/$(FAMILY)-Arrows-Color.ufo

.PHONY: $(STYLES) ufo clean glyphs build proofs autobuild

default: build

help:
	@echo "Build targets"
	@echo
	@echo " make build: Builds the fonts and places them in the fonts/ directory"
	@echo " make test:  Tests the fonts with fontbakery"
	@echo " make proof: Creates HTML proof documents in the proof/ directory"
	@echo

build: ufo Nupuram Nupuram-Calligraphy Nupuram-Color Nupuram-Display Nupuram-Dots Nupuram-Arrows-Color
# Recursively watch the file changes and make the (debug) svgs.
# Useful in design workflow.
# Package inotify-tools are available in linux distros
autobuild:
	while inotifywait -r -e MODIFY $(SOURCEDIR)/glyphs/; do $(MAKE) -C $(SOURCEDIR); done;

# Targets for preparing the glyphs from metapost and preparing master UFOs.
glyphs: $(STYLES)

$(STYLES):
	@mkdir -p $(SOURCEDIR)/svgs/$@
	VARIANT=$@ $(MAKE) -C $(SOURCEDIR)

$(UFODIR)/$(FAMILY)-%.ufo: %
	@echo " BUILD UFO  $(@F)"
	@mkdir -p ${UFODIR}
	$(PY) tools/builder.py --style $* --source $(SOURCEDIR)/svgs/$* --output $@
	@ufonormalizer -q -m $@
	@# remove dangling semicolons in features.fea which font editors cannot handle
	@sed -i 's/ ;$\//g' $@/features.fea

$(UFODIR)/$(FAMILY)-Color-%.ufo: $(UFODIR)/$(FAMILY)-Regular.ufo $(UFODIR)/$(FAMILY)-Shadow-%.ufo
	@echo " BUILD UFO  $(@F)"
	$(PY) tools/build_color_v0.py $@
	@ufonormalizer -q -m $@

$(UFODIR)/$(FAMILY)-Arrows-Color.ufo: $(UFODIR)/$(FAMILY)-Arrows.ufo $(UFODIR)/$(FAMILY)-Regular.ufo
	@echo " BUILD UFO  $(@F)"
	$(PY) tools/build_color_v0.py $@
	@ufonormalizer -q -m $@

ufo: glyphs $(UFO)

# Build targets for prepating the fonts from master UFO sources.
Nupuram: $(FONTSDIR)/Nupuram/ttf-variable\
	$(FONTSDIR)/Nupuram/otf-variable \
	$(FONTSDIR)/Nupuram/otf \
	$(FONTSDIR)/Nupuram/ttf \
	$(FONTSDIR)/Nupuram/webfonts \
	$(FONTSDIR)/Nupuram/ufo
Nupuram-Calligraphy: $(FONTSDIR)/Nupuram-Calligraphy/ttf-variable \
	$(FONTSDIR)/Nupuram-Calligraphy/otf-variable \
	$(FONTSDIR)/Nupuram-Calligraphy/otf \
	$(FONTSDIR)/Nupuram-Calligraphy/ttf \
	$(FONTSDIR)/Nupuram-Calligraphy/ufo \
	$(FONTSDIR)/Nupuram-Calligraphy/webfonts
Nupuram-Color: $(FONTSDIR)/Nupuram-Color/ttf-variable \
	$(FONTSDIR)/Nupuram-Color/otf-variable \
	$(FONTSDIR)/Nupuram-Color/ttf-color \
	$(FONTSDIR)/Nupuram-Color/otf-color \
	$(FONTSDIR)/Nupuram-Color/webfonts \
	$(FONTSDIR)/Nupuram-Color/ufo
# $(FONTSDIR)/Nupuram-Color/otf $(FONTSDIR)/Nupuram-Color/ttf \ They are failing in instance creation.
# See https://github.com/googlefonts/fontmake/issues/928#issuecomment-1227311804
Nupuram-Arrows-Color: $(FONTSDIR)/Nupuram-Arrows-Color/ttf-color \
	$(FONTSDIR)/Nupuram-Arrows-Color/otf-color \
	$(FONTSDIR)/Nupuram-Arrows-Color/webfonts
Nupuram-Display: $(FONTSDIR)/Nupuram-Display/otf \
	$(FONTSDIR)/Nupuram-Display/ttf \
	$(FONTSDIR)/Nupuram-Display/ufo \
	$(FONTSDIR)/Nupuram-Display/webfonts
Nupuram-Dots: $(FONTSDIR)/Nupuram-Dots/otf \
	$(FONTSDIR)/Nupuram-Dots/ttf \
	$(FONTSDIR)/Nupuram-Dots/ufo \
	$(FONTSDIR)/Nupuram-Dots/webfonts

# Create ttf instances if a designspace exist
$(FONTSDIR)/%/ttf: %.designspace
	fontmake --mm-designspace $*.designspace \
		--interpolate \
		--flatten-components  \
		--filter DecomposeTransformedComponentsFilter  \
		--filter "ufo2ft.filters.dottedCircleFilter::DottedCircleFilter(pre=True, dots=10)" \
		--verbose WARNING \
		--output-dir $@  \
		--output ttf  \
		--optimize-cff 1
	$(PY) tools/fix_font.py $(FONTSDIR)/$*/ttf/*.ttf

# Create otf instances if a designspace exist
$(FONTSDIR)/%/otf : %.designspace
	fontmake --mm-designspace $*.designspace \
		--verbose WARNING \
		--flatten-components  \
		--filter DecomposeTransformedComponentsFilter  \
		--filter "ufo2ft.filters.dottedCircleFilter::DottedCircleFilter(pre=True, dots=10)" \
		--interpolate  \
		--optimize-cff 1 \
		--output-dir $@ \
		--output otf
	$(PY) tools/fix_font.py $@/*.otf

# Create ttf variablefont from the given designspace
$(FONTSDIR)/%/ttf-variable: %.designspace
	fontmake --mm-designspace $*.designspace \
		--filter DecomposeTransformedComponentsFilter \
		--filter "ufo2ft.filters.dottedCircleFilter::DottedCircleFilter(pre=True, dots=10)" \
		--flatten-components \
		--verbose WARNING \
		--output-dir $@ \
		--optimize-cff 1 \
		--output variable
	$(PY) tools/fix_font.py $@/*.ttf
	$(PY) tools/stat.py $* $@/*.ttf

# Create otf variablefont from the given designspace
$(FONTSDIR)/%/otf-variable : %.designspace
	fontmake --mm-designspace $*.designspace \
		--output-dir $@ \
		--flatten-components \
		--filter DecomposeTransformedComponentsFilter  \
		--filter "ufo2ft.filters.dottedCircleFilter::DottedCircleFilter(pre=True, dots=10)" \
		--verbose WARNING \
		--optimize-cff 1 \
		--output variable-cff2
	$(PY) tools/fix_font.py $@/*.otf
	$(PY) tools/stat.py $* $@/*.otf

# Create Variable Color fonts-OTF from variable font. The variable font will be colrv0 already
# We just rename as per naminc conventions. Then build colrv1 from it.
$(FONTSDIR)/%/otf-color : $(FONTSDIR)/%/otf-variable
	@mkdir -p $@
	@mv $</$*-VF.otf $@/$*.colrv0.otf
	$(PY) tools/build_color_v1.py $@/$*.colrv0.otf $@/$*.colrv1.otf
	@rm -rf $<

# Create Color fonts-OTF from otf font. The otf font will be colrv0 already
# We just rename as per naminc conventions. Then build colrv1 from it.
$(FONTSDIR)/%/otf-color : $(FONTSDIR)/%/otf
	@mkdir -p $@
	@mv $</$*.otf $@/$*.colrv0.otf
	$(PY) tools/build_color_v1.py $@/$*.colrv0.otf $@/$*.colrv1.otf
	@rm -rf $<

# Create Variable Color fonts-TTF from variable font. The variable font will be colrv0 already
# We just rename as per naminc conventions. Then build colrv1 from it.
$(FONTSDIR)/%/ttf-color : $(FONTSDIR)/%/ttf-variable
	@mkdir -p $@
	@mv $</$*-VF.ttf $@/$*.colrv0.ttf
	$(PY) tools/build_color_v1.py $@/$*.colrv0.ttf $@/$*.colrv1.ttf
	@rm -rf $<

# Create Color fonts-TTF from TTF font. The otf font will be colrv0 already
# We just rename as per naminc conventions. Then build colrv1 from it.
$(FONTSDIR)/%/ttf-color : $(FONTSDIR)/%/ttf
	@mkdir -p $@
	@mv $</$*.ttf $@/$*.colrv0.ttf
	$(PY) tools/build_color_v1.py $@/$*.colrv0.ttf $@/$*.colrv1.ttf
	@rm -rf $<

# Create UFO instances from the given designspace
# Note that ufo instance created for multi layer color fonts will be invalid
# See # See https://github.com/googlefonts/fontmake/issues/928#issuecomment-1227311804
$(FONTSDIR)/%/ufo: %.designspace
	fontmake --mm-designspace $*.designspace \
		--interpolate \
		--output ufo

# Compile otf from UFO file. This target will be picked up only if designspace is missing for the variant
$(FONTSDIR)/%/otf: ${UFODIR}/%.ufo
	fontmake --validate-ufo \
		--verbose=WARNING \
		--optimize-cff 1 \
		--flatten-components \
		--filter DecomposeTransformedComponentsFilter  \
		--filter "ufo2ft.filters.dottedCircleFilter::DottedCircleFilter(pre=True, dots=10)" \
		--output otf \
		--output-dir $@ \
		--ufo-paths $(UFODIR)/$*.ufo
	$(PY) tools/fix_font.py $@/*

# Compile ttf from UFO file. This target will be picked up only if designspace is missing for the variant
$(FONTSDIR)/%/ttf: ${UFODIR}/%.ufo
	@fontmake --verbose=WARNING \
		--output ttf \
		--flatten-components \
		--filter DecomposeTransformedComponentsFilter \
		--filter "ufo2ft.filters.dottedCircleFilter::DottedCircleFilter(pre=True, dots=10)" \
		--optimize-cff 1 \
		--output-dir $@ \
		--ufo-paths $(UFODIR)/$*.ufo
	$(PY) tools/fix_font.py $@/*.ttf

# Package the ufo in fonts directory, directly from the source UFO.
$(FONTSDIR)/%/ufo: ${UFODIR}/%.ufo
	@cp -r $</ $@/

# Create woff2 formatted webfonts for all the ttfs available
# Could be done using fonttools but using a python script to avoid hassles of loop
# and filename mangling in Makefile
$(FONTSDIR)/%/webfonts:
	@mkdir -p  $@
	$(PY) tools/gen_webfonts.py $(FONTSDIR)/$*/**/*.ttf

clean:
	@find -iname "*.pyc" -delete
	@rm -rf $(FONTSDIR) $(PROOFDIR)

proofs:
	@mkdir -p ${PROOFDIR}
	hb-view $(FONTSDIR)/Nupuram/otf/Nupuram-Regular.otf \
		--font-size 24 \
		--margin 100 \
		--line-space 2.4 \
		--foreground=333333 \
		--text-file $(TESTSDIR)/ligatures.txt \
		--output-file $(PROOFDIR)/ligatures.pdf;
	hb-view $(FONTSDIR)/Nupuram/otf/Nupuram-Regular.otf \
		--font-size 24 \
		--margin 100 \
		--line-space 2.4 \
		--foreground=333333 \
		--text-file $(TESTSDIR)/content.txt \
		--output-file $(PROOFDIR)/content.pdf;

	hb-view $(FONTSDIR)/Nupuram/otf/Nupuram-Regular.otf \
		--font-size 24 \
		--margin 100 \
		--line-space 2.4 \
		--foreground=333333 \
		--text-file $(TESTSDIR)/kerning.txt \
		--output-file $(PROOFDIR)/kerning.pdf ;
	hb-view $(FONTSDIR)/Nupuram/otf/Nupuram-Regular.otf \
		--font-size 24 \
		--margin 100 \
		--line-space 2.4 \
		--foreground=333333 \
		--text-file $(TESTSDIR)/latin.txt \
		--output-file $(PROOFDIR)/latin.pdf ;

test: proofs
	# fontbakery check-fontval $(FONTSDIR)/$(FAMILY)-Regular.ttf <- enable when https://github.com/microsoft/Font-Validator/issues/62 fixed
	fontbakery check-ufo-sources $(UFODIR)/$(FAMILY)-Regular.ufo
	fontbakery check-opentype $(FONTSDIR)/Nupuram/otf/Nupuram-Regular.otf
	cp $(FONTSDIR)/Nupuram/ttf-variable/Nupuram-VF.ttf $(FONTSDIR)/Nupuram/ttf-variable/Nupuram[slnt,soft,wdth,wght].ttf
	fontbakery check-googlefonts \
		--full-lists \
		-x com.google.fonts/check/name/license \
		-x com.google.fonts/check/license/OFL_body_text \
		-x com.google.fonts/check/version_bump \
		-x com.google.fonts/check/repo/zip_files \
		$(FONTSDIR)/Nupuram/ttf-variable/Nupuram[slnt,soft,wdth,wght].ttf

install: otf
	@mkdir -p $(INSTALLDIR);
	@cp $(FONTSDIR)/Nupuram/otf-variable/Nupuram-VF.otf $(INSTALLDIR);
	@cp $(FONTSDIR)/Nupuram-Color/otf-color/Nupuram-Color.colrv1.otf $(INSTALLDIR);
	@cp $(FONTSDIR)/Nupuram-Arrows-Color/otf-color/Nupuram-Arrows-Color.colrv1.otf $(INSTALLDIR);
	@cp $(FONTSDIR)/Nupuram-Calligraphy/otf-variable/Nupuram-Calligraphy-VF.otf $(INSTALLDIR);
	@cp $(FONTSDIR)/Nupuram-Dots/otf/Nupuram-Dots.otf $(INSTALLDIR);
	@cp $(FONTSDIR)/Nupuram-Display/otf/Nupuram-Display.otf $(INSTALLDIR);
	@fc-cache -fr

release:
	# Tar files - Nupuram
	tar czvf $(FONTSDIR)/Nupuram.tar.gz *.conf OFL.txt README.md $(FONTSDIR)/Nupuram
	sha256sum $(FONTSDIR)/Nupuram.tar.gz > $(FONTSDIR)/Nupuram.tar.gz.sha256
	md5sum $(FONTSDIR)/Nupuram.tar.gz > $(FONTSDIR)/Nupuram.tar.gz.md5
	# Zip files
	zip -r $(FONTSDIR)/Nupuram.zip README.md OFL.txt $(FONTSDIR)/Nupuram
	sha256sum $(FONTSDIR)/Nupuram.zip > $(FONTSDIR)/Nupuram.zip.sha256
	md5sum $(FONTSDIR)/Nupuram.zip > $(FONTSDIR)/Nupuram.zip.md5

	# Tar files - Nupuram Calligraphy
	tar czvf $(FONTSDIR)/Nupuram-Calligraphy.tar.gz *.conf OFL.txt README.md $(FONTSDIR)/Nupuram-Calligraphy
	sha256sum $(FONTSDIR)/Nupuram-Calligraphy.tar.gz > $(FONTSDIR)/Nupuram-Calligraphy.tar.gz.sha256
	md5sum $(FONTSDIR)/Nupuram-Calligraphy.tar.gz > $(FONTSDIR)/Nupuram-Calligraphy.tar.gz.md5
	# Zip files
	zip -r $(FONTSDIR)/Nupuram-Calligraphy.zip README.md OFL.txt $(FONTSDIR)/Nupuram-Calligraphy
	sha256sum $(FONTSDIR)/Nupuram-Calligraphy.zip > $(FONTSDIR)/Nupuram-Calligraphy.zip.sha256
	md5sum $(FONTSDIR)/Nupuram-Calligraphy.zip > $(FONTSDIR)/Nupuram-Calligraphy.zip.md5

	# Tar files - Nupuram Color
	tar czvf $(FONTSDIR)/Nupuram-Color.tar.gz *.conf OFL.txt README.md $(FONTSDIR)/Nupuram-Color
	sha256sum $(FONTSDIR)/Nupuram-Color.tar.gz > $(FONTSDIR)/Nupuram-Color.tar.gz.sha256
	md5sum $(FONTSDIR)/Nupuram-Color.tar.gz > $(FONTSDIR)/Nupuram-Color.tar.gz.md5
	# Zip files
	zip -r $(FONTSDIR)/Nupuram-Color.zip README.md OFL.txt $(FONTSDIR)/Nupuram-Color
	sha256sum $(FONTSDIR)/Nupuram-Color.zip > $(FONTSDIR)/Nupuram-Color.zip.sha256
	md5sum $(FONTSDIR)/Nupuram-Color.zip > $(FONTSDIR)/Nupuram-Color.zip.md5

	# Tar files - Nupuram Arrows Color
	tar czvf $(FONTSDIR)/Nupuram-Arrows-Color.tar.gz *.conf OFL.txt README.md $(FONTSDIR)/Nupuram-Arrows-Color
	sha256sum $(FONTSDIR)/Nupuram-Arrows-Color.tar.gz > $(FONTSDIR)/Nupuram-Arrows-Color.tar.gz.sha256
	md5sum $(FONTSDIR)/Nupuram-Arrows-Color.tar.gz > $(FONTSDIR)/Nupuram-Arrows-Color.tar.gz.md5
	# Zip files
	zip -r $(FONTSDIR)/Nupuram-Arrows-Color.zip README.md OFL.txt $(FONTSDIR)/Nupuram-Arrows-Color
	sha256sum $(FONTSDIR)/Nupuram-Arrows-Color.zip > $(FONTSDIR)/Nupuram-Arrows-Color.zip.sha256
	md5sum $(FONTSDIR)/Nupuram-Arrows-Color.zip > $(FONTSDIR)/Nupuram-Arrows-Color.zip.md5

	# Tar files - Nupuram Dots
	tar czvf $(FONTSDIR)/Nupuram-Dots.tar.gz *.conf OFL.txt README.md $(FONTSDIR)/Nupuram-Dots
	sha256sum $(FONTSDIR)/Nupuram-Dots.tar.gz > $(FONTSDIR)/Nupuram-Dots.tar.gz.sha256
	md5sum $(FONTSDIR)/Nupuram-Dots.tar.gz > $(FONTSDIR)/Nupuram-Dots.tar.gz.md5
	# Zip files
	zip -r $(FONTSDIR)/Nupuram-Dots.zip README.md OFL.txt $(FONTSDIR)/Nupuram-Dots
	sha256sum $(FONTSDIR)/Nupuram-Dots.zip > $(FONTSDIR)/Nupuram-Dots.zip.sha256
	md5sum $(FONTSDIR)/Nupuram-Dots.zip > $(FONTSDIR)/Nupuram-Dots.zip.md5

	# Tar files - Nupuram Display
	tar czvf $(FONTSDIR)/Nupuram-Display.tar.gz *.conf OFL.txt README.md $(FONTSDIR)/Nupuram-Display
	sha256sum $(FONTSDIR)/Nupuram-Display.tar.gz > $(FONTSDIR)/Nupuram-Display.tar.gz.sha256
	md5sum $(FONTSDIR)/Nupuram-Display.tar.gz > $(FONTSDIR)/Nupuram-Display.tar.gz.md5
	# Zip files
	zip -r $(FONTSDIR)/Nupuram-Display.zip README.md OFL.txt $(FONTSDIR)/Nupuram-Display
	sha256sum $(FONTSDIR)/Nupuram-Display.zip > $(FONTSDIR)/Nupuram-Display.zip.sha256
	md5sum $(FONTSDIR)/Nupuram-Display.zip > $(FONTSDIR)/Nupuram-Display.zip.md5