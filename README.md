### Resume in Markdown, LaTeX and HTML:
Currently the MarkDown version has an ugly YAML header, 
as it's needed by `pandoc` when converting the .md file to LaTeX or HTML.

The `makefile` contains the details on exactly how the conversions are done
(e.g. which commands and templates are used).  

To use the templates as is for your own resume:

1. edit the `resume.md` file to reflect your info
2. type `make all` at the command line, after switching to
   the directory with all the files
    - you can use `make tex`, `make html`, or `make pdf` to 
      generate the individual outputs
    - use `make clean` to delete the outputs so you can remake them

