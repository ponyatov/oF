# var
MODULE = $(notdir $(CURDIR))
PEPS   = E26,E302,E305,E401,E402,E701,E702

# tool
CURL = curl -L -o
CF   = clang-format-11 -style=file -i
PY   = $(shell which python3)
PEP  = $(shell which autopep8) --ignore=$(PEPS) --in-place

# src
Y = metaL.py $(MODULE).py
F = $(MODULE).f
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
