all: tex pdf html

tex: resume.tex
resume.tex: resume.md latex_resume_template.tex
	pandoc resume.md --template latex_resume_template.tex -o resume.tex

pdf: resume.pdf
resume.pdf: resume.tex
	pdflatex resume.tex

html: resume.html
resume.html: resume.md html_resume_template.html github-markdown.css
	pandoc resume.md --template html_resume_template.html --self-contained --css github-markdown.css -o resume.html
	./change_header_levels.py resume.html

private:
	pandoc private.yaml resume.md  --template latex_resume_template.tex -o resume.tex
	pdflatex resume.tex

clean:
	rm -f resume.tex resume.pdf resume.html
