COMMONFORM=node_modules/.bin/commonform

all: docx

docx: agreement.docx

pdf: agreement.pdf

html: agreement.html

md: agreement.md

%.docx: %.commonform %.title.txt %.blanks.json %.signatures.json $(COMMONFORM)
	$(COMMONFORM) render \
		--blanks $*.blanks.json \
		--format docx \
		--number ase \
		--signatures $*.signatures.json \
		--title "$(shell cat $*.title.txt)" \
		< $*.commonform \
		> $@

%.html: %.commonform %.blanks.json $(COMMONFORM)
	$(COMMONFORM) render \
		--blanks $*.blanks.json \
		--format html5 \
		--ordered-lists \
		< $*.commonform \
		> $@

%.md: %.commonform %.blanks.json $(COMMONFORM)
	$(COMMONFORM) render \
		--blanks $*.blanks.json \
		--format markdown \
		< $*.commonform \
		> $@

%.pdf: %.docx
	doc2pdf $<

$(COMMONFORM):
	npm i --save "commonform-cli@^0.23.0"

.SECONDARY: node_modules

.PHONY: test lint critique clean

test: lint critique

lint: $(TARGET:docx=commonform) $(COMMONFORM)
	$(COMMONFORM) lint < $<

critique: $(TARGET:docx=commonform) $(COMMONFORM)
	$(COMMONFORM) critique < $<

clean:
	rm -f $(TARGET) $(TARGET:docx=pdf)
