ifeq ($(OS),Windows_NT)
	EXE_EXTENSION := .exe
else
	EXE_EXTENSION :=
endif

all: build

build:
	dmd JSONBuilder.d -ofJSONBuilder$(EXE_EXTENSION)
	rm -f *.o
	rm -f *.obj