# Batch operations

A very common use case of bash scripts is performing the same operation over multiple files, typically using a `for` loop in modern bash.

Note that if no .md files are found in the current directory, the first and only iteration of the loop will use the string "*.md".
    

```sh hl_lines="4" title="markdown_to_latex.sh"
--8<-- "includes/bash/tasks/markdown_to_latex.sh"
```
