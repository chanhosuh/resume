.DEFAULT_GOAL := help

publish_dir := "$(HOME)/git/chanhosuh.github.io/assets"
input_file := resume.md
latex_template := latex_resume_template.tex
html_template := html_resume_template.html

.PHONY: help
help:
	@echo ""
	@echo "Available commands:"
	@echo ""
	@echo "all              make tex pdf html"
	@echo "tex              create LaTeX resume from Markdown"
	@echo "pdf              create PDF from LaTex resume"
	@echo "html             create HTML resume from Markdown"
	@echo "private          same as 'make tex' but using private, personal info"
	@echo "publish          publish HTML and PDF resumes to website"
	@echo "clean            delete LaTeX, PDF, and HTML resumes"
	@echo ""
	@echo "docker_build     build Docker image"
	@echo "docker_bash      start bash shell in Docker container"
	@echo ""

.PHONY: docker_build
docker_build:
	docker build . -t resume

.PHONY: docker_bash
docker_bash:
	docker run -it -v ${PWD}:/app resume bash

.PHONY: all
all: tex pdf html

.PHONY: tex
tex: resume.tex
resume.tex: $(input_file) $(latex_template)
	pandoc $(input_file) $(private_info) --template $(latex_template) -o resume.tex

.PHONY: pdf
pdf: resume.pdf
resume.pdf: resume.tex
	pdflatex resume.tex

.PHONY: html
html: resume.html
resume.html: $(input_file) $(html_template) github-markdown.css
	pandoc $(input_file) --template $(html_template) --css github-markdown.css -o resume.html
	./change_header_levels.py resume.html

.PHONY: private
private: private_info=private.yaml
private: clean pdf
	rm -f resume.tex

.PHONY: publish
publish: pdf html 
	cp resume.html $(publish_dir)
	cp resume.pdf $(publish_dir)
	cp github-markdown.css $(publish_dir)

.PHONY: clean
clean:
	rm -f resume.tex resume.pdf resume.html
	rm -f $(publish_dir)/resume.html 
	rm -f $(publish_dir)/resume.pdf 

