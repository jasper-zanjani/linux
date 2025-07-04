There are two JavaScript projects that allow use of LaTeX in a mkdocs-material project.

- [MathJax](https://squidfunk.github.io/mkdocs-material/reference/math/?h=math#mathjax)
- [KaTeX](https://squidfunk.github.io/mkdocs-material/reference/math/?h=math#mathjax)

```mdd
$$
\operatorname{ker} f=\{g\in G:f(g)=e_{H}\}{\mbox{.}}
$$
```


=== "docs/javascripts/mathjax.js"

    ```js
    markdown_extensions:
    - pymdownx.arithmatex:
      generic: true

    extra_javascript:
    - javascripts/mathjax.js
    - https://unpkg.com/mathjax@3/es5/tex-mml-chtml.js
    ```

=== "docs/javascripts/katex.js"

    ```js
    document$.subscribe(({ body }) => { 
      renderMathInElement(body, {
        delimiters: [
          { left: "$$",  right: "$$",  display: true },
          { left: "$",   right: "$",   display: false },
          { left: "\\(", right: "\\)", display: false },
          { left: "\\[", right: "\\]", display: true }
        ],
      })
    })
    ```

=== "mkdocs.yml"

    ```yaml
    markdown_extensions:
    - pymdownx.arithmatex:
        generic: true

    # MathJax
    extra_javascript:
    - javascripts/mathjax.js
    - https://unpkg.com/mathjax@3/es5/tex-mml-chtml.js

    # KaTeX
    extra_javascript:
    - javascripts/katex.js
    - https://unpkg.com/katex@0/dist/katex.min.js
    - https://unpkg.com/katex@0/dist/contrib/auto-render.min.js

    extra_css:
    - https://unpkg.com/katex@0/dist/katex.min.css
    ```

