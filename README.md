## Resume in Markdown, LaTeX and HTML

#### resume generation process

1. edit the `resume.md` file to update resume info
2. use a `make` command at the terminal prompt to
   generate the appropriate resume format.
   - `make tex`, `make html`, or `make pdf` will
     create those formats.  
   - `make all` will generate all of them.
   - `make clean` will delete all the outputs so
     you can remake them
   - `make help` for all the commands.

For details on how the conversions are being done,
look in the `makefile`.

Currently the Markdown version has an ugly YAML
header, as it's needed by `pandoc` when converting
the Markdown file to LaTeX or HTML.

