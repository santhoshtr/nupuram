filename=stencil

SRCDIR := ./glyphs
SVGDIR    := ./svgs
GLYPHS    := $(wildcard $(SRCDIR)/*.mp)
SVGS      := $(patsubst $(SRCDIR)/%.mp,$(SVGDIR)/%.svg,$(GLYPHS))

.PHONY: all clean

default: all

all: $(SVGS)

$(SVGDIR)/%.svg: $(SRCDIR)/%.mp config.mp glyph.mp pens.mp
	@echo " BUILD   $(@F)"
	mkdir -p $(SVGDIR)
	# Can be mpost "\generating:=0; \input $<"
	mpost --mem=metafun.mem -s 'outputtemplate="$(SVGDIR)/%j.svg"' --interaction=nonstopmode $<
	@rm -rf *.log *.mpo *.mpt

%.tex: %.mp
	mpost $<
	cp $< _t_m_p.mp
	mft _t_m_p.mp -style=mplain.mft
	echo "\input mplain.sty" > $@
	test -f piclist.tex && cat piclist.tex >> $@
	test -f _t_m_p.tex && cat _t_m_p.tex >> $@
	echo "\endproof" >> $@

clean:
	@rm -rf *.tmp *.dvi *.svg *.log svgs/*.svg *.mpt
