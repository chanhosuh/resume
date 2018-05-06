all: tex pdf html

tex: resume.tex
resume.tex: resume.md latex_resume_template.tex
	pandoc resume.md --template latex_resume_template.tex -o resume.tex

pdf: resume.pdf
resume.pdf: resume.tex
	pdflatex resume.tex

html: resume.html
resume.html: resume.md github-pandoc.css html_resume_template.html
	pandoc resume.md --template html_resume_template.html --self-contained --css github-pandoc.css -o resume.html
	./change_header_levels.py resume.html

clean:
	rm -f resume.tex resume.pdf resume.html
