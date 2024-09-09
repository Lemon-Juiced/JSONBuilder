ifeq ($(OS),Windows_NT)
    EXE_EXTENSION := .exe
else
    EXE_EXTENSION :=
endif

all: build 

build:
	dmd JSONBuilder.d ToolModelGenerator.d -ofJSONBuilder$(EXE_EXTENSION)