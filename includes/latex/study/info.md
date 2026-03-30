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

