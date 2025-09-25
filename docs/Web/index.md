# Static sites


## docfx

Docfx is a static site generator meant for technical documentation similar to mkdocs-material, but developed by Microsoft.

```sh
# Install docfx utility
dotnet tool update -g docfx
```

#### Includes

!!! warn

    -   Unlike in mkdocs-material, this statement cannot be used within a code block and only works with other markdown files.
    -   The file path is relative to the file being edited and absolute paths from the project root do not work.
        This means that includes with nested includes must be referred by the including file!
    -   There must be no space before the closing bracket.

```md
[!INCLUDE [Azure CLI](../includes/cmd/az/info.md)]
```

#### Navigation

Document headings up to level 3 appear in the in-article navigation which appears on the right.

The table of contents 
