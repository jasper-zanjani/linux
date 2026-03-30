XeLaTeX process .tex files and produces a .xdv (Extended DVI) file.
The **xdvipdfmx** utility completes the process of conversion to PDF.

!!! warning "Compilation"

    Note that the command used for compilation will need the `-pdfxe` option (as opposed to `-pdf` which hardcodes the selection of pdflatex and overrides the selection of xelatex).

    ```sh
    latexmk -pdfxe -xelatex doc.tex
    ```

    If specified fonts are not found, compilation will fail.
    System fonts can be displayed with `fc-list`
