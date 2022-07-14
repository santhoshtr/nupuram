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

%.tex: %.mp
	mpost $<
	cp $< _t_m_p.mp
	mft _t_m_p.mp -style=mplain.mft
	echo "\input mplain.sty" > $@
	test -f piclist.tex && cat piclist.tex >> $@
	test -f _t_m_p.tex && cat _t_m_p.tex >> $@
	echo "\endproof" >> $@

clean:
	@rm -rf *.tmp *.dvi *.svg *.log $(VARIANT)/*.svg *.mpt
