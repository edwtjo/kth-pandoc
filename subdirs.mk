MAKE=make

TOPTARGETS := all clean dist

SUBDIRS := $(dir $(wildcard */Makefile))

$(TOPTARGETS): $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)

.PHONY: $(TOPTARGETS) $(SUBDIRS)
