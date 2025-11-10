Autocommands expose an API that allows handling editor events like `BufNewFile`, `BufReadPost`, `BufWritePost`, `BufWinLeave`, and especially to implement functionality specific to filetypes. (1)
{: .annotate }

1.  **References**

    -   [Forget plugins! Neovim IDE features with autocmds](https://www.youtube.com/watch?v=v36vLiFVOXY)

    ```vim
    --8<-- "includes/vim/autocmd-diff.vim"
    ```

    ```vim
    --8<-- "includes/vim/autocmd-highlights.vim"
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

" Set file format to Unix/DOS
:set fileformat=unix
:set fileformat=dos

" Set indentation behavior specific to YAML
autocmd FileType yaml setlocal ai ts=2 sw=2 et
```

In cases where a file with the incorrect filename extension is opened, the `BufRead` or `BufNewFile` editor events will not fire (i.e. when using **jrnl** to create new journal entries in markdown).
The filetype can be set manually:

```vim
:set filetype=markdown
```

A more permanent solution would be to use `vim.filetype.add()` to add a filename pattern.

```lua
--8<-- "includes/cmd/nvim/vim.filetype.add.lua"
```
