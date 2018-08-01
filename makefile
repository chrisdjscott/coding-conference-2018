## LaTeX makefile

FILE=main
LATEXMK=latexmk
MACPDFAPP="/Applications/Preview.app"

ifeq ($(shell uname -s),Darwin)
    OPEN=open -a $(MACPDFAPP)
else
    OPEN=xdg-open
endif

.PHONY: all $(FILE).pdf clean distclean open

all: $(FILE).pdf

$(FILE).pdf: $(FILE).tex
	latexmk -pdflatex='pdflatex -synctex=1 -shell-escape -interaction=nonstopmode' -pdf $(FILE).tex

open: $(FILE).pdf
	$(OPEN) $(FILE).pdf

clean:
	rm -f *.aux *.fdb_latexmk *.fls *.log *.nav *.out *.snm *.toc *.vrb *.pyg *.synctex.gz
	rm -rf _minted*

distclean: clean
	rm -f $(FILE).pdf
