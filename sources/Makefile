SRCDIR    := ./glyphs
VARIANT   ?= debug
GLYPHS    := $(wildcard $(SRCDIR)/*.mp)
SVGS      := $(patsubst $(SRCDIR)/%.mp,svgs/$(VARIANT)/%.svg,$(GLYPHS))

.PHONY: all clean

default: all

all: $(SVGS)

svgs/$(VARIANT)/%.svg: $(SRCDIR)/%.mp glyph.mp  pens.mp config/$(VARIANT).mp malayalam.mp latin.mp config.mp
	@echo " BUILD GLYPH   $@"
	@mkdir -p svgs/$(VARIANT)
	@cp config/$(VARIANT).mp font.mp
	@mpost -s 'outputtemplate="svgs/$(VARIANT)/%j.svg"' --interaction=nonstopmode $< end
	@# remove svg comments which fonttools svglib does not like
	@sed -i 's/<!--.*$\//g' $@
	@rm -rf ./*.log ./*.mpo ./*.mpt

clean:
	@rm -rf *.tmp *.dvi *.svg *.log svgs/$(VARIANT)/*.svg *.mpt
