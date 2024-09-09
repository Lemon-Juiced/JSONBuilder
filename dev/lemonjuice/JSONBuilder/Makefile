ifeq ($(OS),Windows_NT)
	EXE_EXTENSION := .exe
	RM_COMMAND := del
else
	EXE_EXTENSION :=
	RM_COMMAND := rm
endif

all:
	dmd JSONRecipeBuilder.d -ofJSONRecipeBuilder$(EXE_EXTENSION)
	$(RM_COMMAND) JSONRecipeBuilder.obj