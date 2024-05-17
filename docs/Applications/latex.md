# LaTeX

The first line in a LaTeX document is the **\\documentclass** command which defines the class or type of document.
The most basic document class is **article**, but many are available on [CTAN](https://www.ctan.org/topic/class):

```latex
--8<-- "includes/Tasks/latex/basic.tex"
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
--8<-- "includes/Tasks/latex/preamble.tex"
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

<div class="grid cards" markdown>

-   #### Installation

    ---

    Installation of LaTeX utilities (**pdflatex** and **latex** to compile to PDF and DVI documents respectively, **tlmgr**):

    === ":material-fedora: Fedora"

        ```sh
        dnf install -y texlive texlive-xetex
        ```

    LaTeX packages and additional document classes can also be found as packages in Linux distributions

    === ":material-fedora: Fedora"

        ```sh
        dnf install -y texlive-xlop texlive-exam
        ```

    Depending on the type of package, this will install a **sty** file (for "packages") or a **cls** (for document classes).
    Note that some apparently more common packages appear to be preinstalled (**multicol** for example, but not **multirow**).
    
    ```sh
    # Confirm
    kpsewhich xlop.sty
    kpsewhich exam.cls
    ```

    ```latex
    \documentclass{exam}
    \usepackage{xlop}
    ```

-   #### Exam with multicol

    ---

    ```latex
    --8<-- "includes/Tasks/latex/exam-multicol.tex"
    ```

-   #### Embedding diagrams

    ---

    Geometric diagrams produced in the Asymptote vector graphics language can be included as follows:

    ```latex
    --8<-- "includes/Tasks/latex/asymptote.tex"
    ```

    Note that compiling this document requires the following command sequence to be run:

    ```sh
    pdflatex $LATEXFILE

    # The asymptote code is extracted to a separate file located in the working directory where the command was executed.
    asy $LATEXFILE-1.asy

    # Run the command again, resulting in the final PDF
    pdflatex $LATEXFILE
    ```

-   #### Long division

    ---

    A custom command can be defined to format long division problems:

    ```latex
    \documentclass{article}

    \newcommand\Mydiv[2]{%
    $\strut#1$\kern.25em\smash{\raise.3ex\hbox{$\big)$}}$\mkern-8mu
            \overline{\enspace\strut#2}$}

    \begin{document}

    \Mydiv{56}{3678}\quad\Mydiv{3}{37678}

    \end{document}
    ```

-   #### Geometric diagrams

    ---

    ```latex
    \documentclass[12pt, letterpage]{article}
    \usepackage{tikz}
    \begin{document}
    Hello, world!
    \begin{tikzpicture}
    \draw (0,0) -- (3,0) -- (3,3) -- cycle;
    \end{tikzpicture}
    \begin{tikzpicture}
        \draw (0,0) node[anchor=north east]{A}-- (1,3)node[anchor=south]{B} -- (10,0)node[anchor=north]{C}-- (0,0);
        \draw (1,3)--(1,0)node[anchor=north]{D};
    \end{tikzpicture}
    \begin{tikzpicture}
        \coordinate[label=below left:$A$] (A) at (0,0);
        \coordinate[label=below right:$B$] (B) at (10,0);
        \coordinate[label=above:$C$] (C) at (1,3);
        \coordinate[label=below:$D$] (D) at (1,0);
        \draw (A) -- (C) -- (B) -- cycle;
        \draw (C) -- (D) node[right,midway] {$m$};
        \draw[latex-latex,shift={(0,-0.6)}] (1,0) -- (10,0) node[below,midway] {$a$ units};
        \draw[latex-latex,shift={(0,-1.2)}] (0,0) -- (10,0) node[below,midway] {$b$ units};
        \tkzRightAngle (A/C/B, C/D/B);
    \end{tikzpicture}
    \end{document}
    ```

</div>