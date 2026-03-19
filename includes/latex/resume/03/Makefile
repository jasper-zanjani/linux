.phony: BUILD
BUILD: doc.tex markdown_to_latex.sh
	bash markdown_to_latex.sh
	latexmk -xelatex -pdf doc.tex
	xpdf doc.pdf
