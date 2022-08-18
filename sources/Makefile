SRCDIR    := ./glyphs
VARIANT   ?= debug
GLYPHS    := $(wildcard $(SRCDIR)/*.mp)
SVGS      := $(patsubst $(SRCDIR)/%.mp,svgs/$(VARIANT)/%.svg,$(GLYPHS))

.PHONY: all clean

default: all

all: $(SVGS)

svgs/$(VARIANT)/%.svg: $(SRCDIR)/%.mp glyph.mp  pens.mp config/$(VARIANT).mp malayalam.mp latin.mp config.mp
	@echo " BUILD GLYPH   $@"
	@mpost  -s 'outputtemplate="$@"' -s 'jobname="config/$(VARIANT).mp"' --interaction=nonstopmode $< end
	@# remove svg comments which fonttools svglib does not like
	@sed -i 's/<!--.*$\//g' $@
	@rm -rf ./*.log ./*.mpo ./*.mpt

clean:
	@rm -rf *.tmp *.dvi *.svg *.log svgs/$(VARIANT)/*.svg *.mpt
