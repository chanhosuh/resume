all: pdf html txt

pdf: resume.pdf
resume.pdf: resume.md latex_resume_template.tex
	pandoc resume.md --template latex_resume_template.tex -o resume.pdf

html: resume.html
resume.html: resume.md github-pandoc.css html_resume_template.html
	pandoc resume.md --template html_resume_template.html --self-contained --css github-pandoc.css -o resume.html
	./change_header_levels.py resume.html

txt: resume.txt
resume.txt: resume.yml plaintext_resume_template.plain
	pandoc resume.md -t plain --template resume.pandoc.plain -o resume.txt

clean:
	rm -f resume.pdf resume.html resume.txt
