.PHONY: all tex pdf html private publish clean

publish_dir="$(HOME)/git/chanhosuh.github.io-src/content/static"
input_file=resume.md
latex_template=latex_resume_template.tex
html_template=html_resume_template.html


all: tex pdf html

tex: resume.tex
resume.tex: $(input_file) $(latex_template)
	pandoc $(private_info) $(input_file) --template $(latex_template) -o resume.tex

pdf: resume.pdf
resume.pdf: resume.tex
	pdflatex resume.tex

html: resume.html
resume.html: $(input_file) $(html_template) github-markdown.css
	pandoc $(private_info) $(input_file) --template $(html_template) --self-contained --css github-markdown.css -o resume.html
	./change_header_levels.py resume.html

private: private_info=private.yaml
private: pdf
	rm -f resume.tex

publish: pdf html 
	cp resume.html $(publish_dir)
	cp resume.pdf $(publish_dir)

clean:
	rm -f resume.tex resume.pdf resume.html
	rm -f $(publish_dir)/resume.html 
	rm -f $(publish_dir)/resume.pdf 
