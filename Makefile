# http://wiki.whatwg.org/wiki/GitHub#Makefile

ANOLIS = anolis

all: Overview.html ../xref/xrefs/dom/dom.json

../xref/xrefs/dom/dom.json: Overview.src.html Makefile
	$(ANOLIS) --dump-xrefs=$@ $< /tmp/spec

Overview.html: Overview.src.html ../xref Makefile
	$(ANOLIS) --omit-optional-tags --quote-attr-values --xref="../xref" \
	--w3c-compat-xref-a-placement --w3c-compat-substitutions --w3c-status=ED \
	--enable=xspecxref --enable=refs \
	--filter=".publish, .whatwgonly, title + style" $< $@
