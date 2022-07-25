SRCDIR    := ./glyphs
VARIANT   ?= debug
GLYPHS    := $(wildcard $(SRCDIR)/*.mp)
SVGS      := $(patsubst $(SRCDIR)/%.mp,$(VARIANT)/%.svg,$(GLYPHS))

.PHONY: all clean

default: all

all: $(SVGS)

$(VARIANT)/%.svg: $(SRCDIR)/%.mp config.mp glyph.mp pens.mp $(VARIANT).mp
	@echo " BUILD   $(@F)"
	@mkdir -p $(VARIANT)
	@cp $(VARIANT).mp font.mp
	mpost -s 'outputtemplate="$(VARIANT)/%j.svg"' --interaction=nonstopmode $< end
	@# remove svg comments which fonttools svglib does not like
	@sed -i 's/<!--.*$\//g' $@
	@rm -rf ./*.log ./*.mpo ./*.mpt

clean:
	@rm -rf *.tmp *.dvi *.svg *.log $(VARIANT)/*.svg *.mpt
