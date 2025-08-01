The simplest possible LaTeX document.

-   `\documentclass{article}` declares the document _class_ or type.
    There are a great many [document classes available on CTAN](https://www.ctan.org/topic/class).
-   `\begin{document}` and `\end{document}` surround the _body_ of the document.
    Everything appearing before the body is called the _preamble_.


```latex title="overleaf/00"
--8<-- "includes/latex/overleaf/00/doc.tex"
```

Changes to the preamble will affect the appearance of the entire document.

-   With metadata provided to `\title` and `\author` in the preamble we can generate a title page using `\maketitle` in the body.
    If author is missing the document will still compile but produce an error.
-   If `\date` is not provided the current date is used.


```latex title="overleaf/01"
--8<-- "includes/latex/overleaf/01/doc.tex"
```
