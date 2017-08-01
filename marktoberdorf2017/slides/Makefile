# This uses Madoko (https://madoko.codeplex.com/)

deck:
	@madoko slides02.mdk --odir=out/02 | grep -v "warning: unable to read language definition: fstar" | true
	@sed -i "s/lib\/font\/source-sans-pro\/source-sans-pro\.css/slides\/reveal.js\/lib\/font\/source-sans-pro\/source-sans-pro.css/g" out/02/slides02.html
	@madoko slides03.mdk --odir=out/03 | grep -v "warning: unable to read language definition: fstar" | true

clean:
	rm -f *~ css.sty madoko.css madoko.sty *math-dvi.tex *math-pdf.tex *math-dvi.final.tex *math-pdf.final.tex  *.aux *.dim *.dvi *.log *.out *.upa *.dimx *.html *.log *.pdf *.upa *.upb *.bbl *.blg .*~
	rm -dfr math
