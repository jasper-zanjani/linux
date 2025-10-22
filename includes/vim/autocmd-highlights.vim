" Turn syntax highlighting on only for certain filetypes
augroup PatchDiffHighlight
autocmd!
autocmd BufEnter *.patch,*.rej,*.diff syntax enable
augroup END
