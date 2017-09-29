.PHONY: all clean
.SUFFIXES: .md .pdf

include local.mk
include subdirs.mk

RM=rm -f

all : $(SLIDES).slides.pdf $(HANDOUTS).handouts.pdf

%.slides.pdf : %.md
	pandoc $^ -t beamer -s --template=./kth.beamer --slide-level 2 -o $@

%.handout.pdf : %.md
	pandoc $^ -t beamer --slide-level 2 -V handout -o $@
	pdfnup $@ --nup 1x2 --no-landscape --keepinfo \
		--paper letterpaper --frame true --scale 0.9 \
		--suffix "nup"
	mv $*.md.handout-nup.pdf $@

clean: dist
	$(RM) *.pdf

dist:
	$(RM) *~

