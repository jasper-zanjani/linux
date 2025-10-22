" Highlight added lines in green and removed lines in red in .diff files
filetype on
augroup PatchDiffHighlight
autocmd!
autocmd FileType diff syntax enable
augroup END
