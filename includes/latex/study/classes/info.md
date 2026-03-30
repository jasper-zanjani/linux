!!! example

    === "Custom"

        This is a simple example of a class definition that contains only a single custom macro.

        <div class="grid cards" markdown>

        ```latex title="fontspec/02/doc.tex"
        --8<-- "includes/latex/study/fontspec/02/doc.tex"
        ```

        ```latex title="fontspec/02/resume.cls"
        --8<-- "includes/latex/study/fontspec/02/resume.cls"
        ```

        </div>

    === "Predefined"

        <div class="grid cards" markdown>

        -   **Article**

            --8<-- "includes/latex/classes/article.md"

        -   **Exam**

            --8<-- "includes/latex/classes/exam.md"

        </div>
  
Formatting defaults are specified in a Latex [**class**](https://www.overleaf.com/learn/latex/How_to_write_a_LaTeX_class_file_and_design_your_own_CV_(Part_1)), which is typically defined in a class file (ending in **.cls**).

The first line in a LaTeX document is the `\documentclass` command which defines the class or type of document.

```latex
--8<-- "includes/latex/tasks/basic.tex"
```

This will attempt to load **my_cv.cls** which will output in the default article style.

```latex hl_lines="1"
--8<-- "includes/latex/resume/00/doc.tex"
```

```latex title="my_cv.cls"
--8<-- "includes/latex/resume/00/my_cv.cls"
```

All class files should start with the highlighted lines.

```latex hl_lines="1 2"
--8<-- "includes/latex/resume/01/my_cv.cls"
```

We use the `\RequirePackage` command to import the **titlesec** package (the `\usepackage` command is not used here because this is a class file).
This provides the `\titleformat` command which allows us to customize section and subsection headings.

```latex hl_lines="4-14"
--8<-- "includes/latex/resume/02/my_cv.cls"
```

Bulleted list using the **itemize** environment.

```latex
--8<-- "includes/latex/resume/03/doc.tex"
```

Markup can be included from another file using `\input{}` providing the file name but excluding .tex.

```latex hl_lines="8"
--8<-- "includes/latex/resume/04/doc.tex"
```

```latex title="list.tex"
--8<-- "includes/latex/resume/04/list.tex"
```
