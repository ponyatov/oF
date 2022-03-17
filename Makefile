# var
MODULE = $(notdir $(CURDIR))
NOW    = $(shell date +%d%m%y)
REL    = $(shell git rev-parse --short=4 HEAD)
BRANCH = $(shell git rev-parse --abbrev-ref HEAD)
PEPS   = E26,E302,E305,E401,E402,E701,E702

# tool
CURL = curl -L -o
CF   = clang-format-11 -style=file -i
PY   = $(shell which python3)
PEP  = $(shell which autopep8) --ignore=$(PEPS) --in-place

# src
Y  = metaL.py $(MODULE).py
F  = lib/$(MODULE).f
S += $(Y) $(F) $(C) $(H)

# all
all: bin/$(MODULE) lib/$(MODULE)
	$^

meta: $(PY) $(MODULE).py
	$^
	$(MAKE) tmp/format_py

# format
format: tmp/format_py
tmp/format_py: $(Y)
	$(PEP) $? && touch $@

# merge
MERGE  = Makefile README.md .gitignore .clang-format apt.txt $(S)
MERGE += .vscode bin doc lib src tmp

.PHONY: dev shadow release zip

dev:
	git push -v
	git checkout $@
	git pull -v
	git checkout shadow -- $(MERGE)
#	$(MAKE) doxy ; git add -f docs

shadow:
	git push -v
	git checkout $@
	git pull -v

.PHONY: release
release:
	git tag $(NOW)-$(REL)
	git push -v --tags
	$(MAKE) shadow

ZIP = tmp/$(MODULE)_$(BRANCH)_$(NOW)_$(REL).src.zip
zip:
	git archive --format zip --output $(ZIP) HEAD
#	$(MAKE) doxy ; zip -r $(ZIP) docs
