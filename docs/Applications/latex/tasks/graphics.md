# Graphics

#### Embedding diagrams

Geometric diagrams produced in the Asymptote vector graphics language can be included as follows:

```latex
--8<-- "includes/latex/tasks/asymptote.tex"
```

Note that compiling this document requires the following command sequence to be run:

```sh
pdflatex $LATEXFILE

# The asymptote code is extracted to a separate file located in the working directory where the command was executed.
asy $LATEXFILE-1.asy

# Run the command again, resulting in the final PDF
pdflatex $LATEXFILE
```

#### Geometric diagrams

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
