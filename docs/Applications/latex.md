# L<small><sup>A</sup></small>T<sub>E</sub>X

--8<-- "includes/latex/info.md"

The first line in a LaTeX document is the `\documentclass` command which defines the class or type of document.
The most basic document class is **article**, but many are available on [CTAN](https://www.ctan.org/topic/class):

```latex
--8<-- "includes/latex/tasks/basic.tex"
```

Additional classes are available for download through the distribution's package manager, for example the [exam](https://ctan.org/pkg/exam) document class:

=== ":material-fedora: Fedora"

    ```sh
    dnf install -y texlive-exam
    ```

These classes define formatting and are associated with **.cls** files.
Document classes can be searched using **kpsewhich**

```sh
kpsewhich exam.cls # (1)
```

1. 
``` title="Output"
/usr/share/texlive/texmf-dist/tex/latex/exam/exam.cls
```

Font size and document dimensions are **options** defined in brackets after the command itself but before the .
External packages can be loaded with **\\usepackage** directive after defining \\documentclass.

```latex hl_lines="1"
--8<-- "includes/latex/tasks/preamble.tex"
```

The exam document class supports the **addpoints** option, which enables commands that add up points and produce grading tables.

An existing TeX Live installation is managed using **tlmgr**: commands must be run as superuser.

```sh
tlmgr paper letter
```

```sh
# Convert to PDF
pdftex $LATEXFILE
```

## Asymptote

[**Asymptote**](https://asymptote.sourceforge.io/) is a vector graphics language that enables technical drawings.

## Tasks

--8<-- "includes/latex/tasks.md"

