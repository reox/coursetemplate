all: abgabe.pdf

%.pdf: %.tex
	latexmk -bibtex -lualatex -use-make $<

clean:
	latexmk -C
	rm abgabe.bbl abgabe.run.xml
