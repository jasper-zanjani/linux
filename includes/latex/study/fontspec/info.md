Using the **fontspec** (1) package as well as the **XeLaTeX** (2) engine allows system fonts to be used in documents.
{: .annotate }

1.  **Installation**

    === ":material-fedora: Fedora"

        ```sh
        dnf install -y texlive-fontspec
        ```

2.  **XeLaTeX**

    --8<-- "includes/latex/xelatex.md"

<!-- -->

-   **`\setmainfont`** specifies the font used by the entire document for roman type.
    `\setsansfont` and `\setmonofont` similarly specify font used for sans serif and monospace type.

-   **`\newfontfamily`** is a macro that defines a new font family declaration (1).
    This means that the declaration must occur within a scope (i.e. between braces), or the family must be reset for the remainder of the document using another declaration.
    {: .annotate }

    1.  

        --8<-- "includes/latex/font-family-commands.md"

```latex title="fontspec/00"
--8<-- "includes/latex/study/fontspec/00/doc.tex"
```

`\newfontfamily` can be incorporated into a macro.

```latex title="fontspec/01" hl_lines="8"
--8<-- "includes/latex/study/fontspec/01/doc.tex"
```

It can be moved into a class.

```latex title="fontspec/02/doc.tex"
--8<-- "includes/latex/study/fontspec/02/doc.tex"
```

```latex title="fontspec/02/resume.cls"
--8<-- "includes/latex/study/fontspec/02/resume.cls"
```
