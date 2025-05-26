Autocommands expose an API that allows handling editor events like `BufNewFile`, `BufReadPost`, `BufWritePost`, `BufWinLeave`, and especially to implement functionality specific to filetypes.



```vim
" Highlight added lines in green and removed lines in red in .diff files
filetype on
augroup PatchDiffHighlight
autocmd!
autocmd FileType diff syntax enable
augroup END
```

```vim
" Turn syntax highlighting on only for certain filetypes
augroup PatchDiffHighlight
autocmd!
autocmd BufEnter *.patch,*.rej,*.diff syntax enable
augroup END
```

```vim title="Color"
" Change the color of ELEMENT
highlight ELEMENT ctermfg=COLOR ctermbg=COLOR guifg=#abc123 guibg=#abc123

" Select alternative colorschemes
:colo[rscheme] <tab>

" Display all available colorschemes
:colo <C-d>

" Clear custom color commands
:highlight clear
:hi clear
```

```vim
" Set file format to Unix/DOS
:set fileformat=unix
:set fileformat=dos
```

```vim
" Set indentation behavior specific to YAML
autocmd FileType yaml setlocal ai ts=2 sw=2 et
```
