`\maketitle` displays the front matter.

```latex hl_lines="3-5 9"
--8<-- "includes/latex/study/freecodecamp/00/doc.tex"
```

- `$` enters inline math mode, used for setting equations.
- `$$` enters [display math mode](https://www.overleaf.com/learn/latex/Mathematical_expressions#Display_math_mode) where equations are put on separate lines and centered.

```latex
--8<-- "includes/latex/study/freecodecamp/01/doc.tex"
```

Bulleted (`itemize`) or numbered (`enumerate`) lists are created between `\begin` and `\end` statements using `\item`.
Various syntaxes are available for typesetting mathematical expressions.

```latex
--8<-- "includes/latex/study/freecodecamp/02/doc.tex"
```

In Latex, `\begin` and `\end` delimit **environments**.
Some environments like `align` (provided by the amsmath package) are in math mode by default.
Note that the `&` before the equal sign causes the equations to be aligned.

```latex hl_lines="2 5-9"
--8<-- "includes/latex/study/freecodecamp/03/doc.tex"
```

Various text formats are possible.
The hyperref package allows hyperlinks (note the second set of braces to delimit the display text.
Note the `\vspace` used to create vertical space.

```latex
--8<-- "includes/latex/study/freecodecamp/04/doc.tex"
```
