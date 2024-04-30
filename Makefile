# var
MODULE  = $(notdir $(CURDIR))

# dir
CWD   = $(CURDIR)
BIN   = $(CWD)/bin
INC   = $(CWD)/inc
SRC   = $(CWD)/src
TMP   = $(CWD)/tmp
REF   = $(CWD)/ref
GZ    = $(HOME)/gz
BUILD = $(CWD)/tmp/$(MODULE)

# tool
CURL = curl -L -o
CF   = clang-format -style=file

# src
C += $(wildcard src/*.c*)
H += $(wildcard inc/*.h*)
F += $(wildcard lib/*.ini) $(wildcard lib/*.of) $(wildcard lib/*.f)

# cfg
CFLAGS += -I$(INC) -I$(TMP)

# all
.PHONY: all
all:

# format
.PHONY: format
format: tmp/format_c tmp/format_d
tmp/format_c: $(C) $(H)
	$(CF) -i $? && touch $@

# rule
bin/$(MODULE): $(C) $(H) $(CP) $(HP) $(CWD)/CMakeLists.txt Makefile
	cmake -DAPP=$(MODULE) -S$(CWD) -B$(BUILD) build

# doc
.PHONY: doc
doc:

# install
.PHONY: install update gz ref
install: doc gz ref
	$(MAKE) update
	dub build dfmt
update:
	sudo apt update
	sudo apt install -yu `cat apt.txt`
gz:
ref:

# merge
MERGE += Makefile README.md apt.txt apt.msys LICENSE
MERGE += .clang-format .doxygen .gitignore
MERGE += .vscode bin doc lib inc src tmp ref

.PHONY: dev
dev:
	git push -v
	git checkout $@
	git pull -v
	git checkout shadow -- $(MERGE)

.PHONY: shadow
shadow:
	git push -v
	git checkout $@
	git pull -v

.PHONY: release
release:
	git tag $(NOW)-$(REL)
	git push -v --tags
	$(MAKE) shadow

.PHONY: zip
zip:
	git archive \
		--format zip \
		--output $(TMP)/$(MODULE)_$(NOW)_$(REL).src.zip \
	HEAD
