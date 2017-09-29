.PHONY: all clean
.SUFFIXES: .md .pdf

include local.mk
include subdirs.mk

PANDOC_ARGS=-t beamer -s --template=./kth.beamer --slide-level 2

RM=rm -f

all: $(SLIDES).slides.pdf $(SLIDES).handout.pdf

%.slides.pdf: %.md
	pandoc $^ $(PANDOC_ARGS) -o $@

%.handout.pdf: %.md
	pandoc $^ $(PANDOC_ARGS) -V handout -o $@
	pdfnup $@ --nup 1x2 --no-landscape --keepinfo \
		--paper letterpaper --frame true --scale 0.9 \
		--suffix "nup"
	mv $*.handout-nup.pdf $@

clean: dist
	$(RM) *.pdf

dist:
	$(RM) *~

