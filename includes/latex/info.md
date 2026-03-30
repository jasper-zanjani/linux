LaTeX (1) is a typesetting system.
{: .annotate }

1.  

    --8<-- "includes/latex/callout.md"

<!-- -->

-   **TeX** is a typesetting program created by Donald Knuth for his book _The Art of Computer Programming_.
-   **LaTeX** is a macro system built on top of TeX.

There are various **engines** available for Latex, including _XeLaTeX_ (which allows use of system fonts) and _pdflatex_.

--8<-- "includes/latex/packages.md"

The simplest possible empty LaTeX document.

<div class="grid cards" markdown>

-    

    -   `\documentclass{article}` declares the document _class_ or type.
        There are a great many [document classes available on CTAN](https://www.ctan.org/topic/class).
    -   `\begin{document}` and `\end{document}` surround the _body_ of the document.
        Everything appearing before the body is called the _preamble_.

-    

    ```latex
    \documentclass{article}
    \begin{document}
    \end{document}
    ```

</div>

Page margins can be set using the geometry package

```latex
\usepackage[margin=0.5in]{geometry}
```
