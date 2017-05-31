OUT := abgabe.pdf

# The main tex file is defined by the pdf name
TEX := $(patsubst %.pdf,%.tex,${OUT})

# Define all latex files that are required for building
PREQ := $(wildcard chapters/*.tex) config.tex

all: ${OUT}

%.pdf: ${TEX} ${PREQ}
	latexmk -bibtex -lualatex -use-make $<

# Clean up - latexmk -C does not clean all files...
clean:
	latexmk -C
	rm $(patsubst %.pdf,%.bbl,${OUT}) $(patsubst %.pdf,%.run.xml,${OUT}) || exit 0
