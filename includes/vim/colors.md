```vim
" Set language manually for an open buffer
set syntax=xml
```

Syntax highlighting for various languages are stored in **syntax files**, stored in **/usr/share/vim/vim82/syntax**.

Defining highlighting for pymdownx [snippets](https://squidfunk.github.io/mkdocs-material/setup/extensions/python-markdown-extensions/?h=snippet#snippets)

```vim
syn match markdownPymdownxSnippet '^-\{2,}8<-\{2,} .*' " (1)
hi def link markdownPymdownxSnippet Error
```

1. Note that the quantifier specifying at least two instances of the preceding hyphen requires the initial brace to be escaped.
However, this is not the case for the open angle bracket.

Element colors are changed using `highlight`.

```vim
" Change comments to use the Grey terminal color
highlight Comment ctermfg=Grey

" Change color of whitespace (made visible with list)
hi Whitespace ctermfg=DarkGrey
```
