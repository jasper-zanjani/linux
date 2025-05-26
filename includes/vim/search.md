```vim
" Replace foo with bar across all lines, wherever they occur
%s/foo/bar/g
```

```vim
" Turn off search highlighting
noh " nohlsearch

" Clear last used search pattern
let @/ = ""
```

Use ["fightin' one-eyed Kirby"](https://www.youtube.com/watch?v=v2a6Nv7RSd0) `\(.*\)`  and the first capture group `\1` to replace an entire line or to behave like multiline cursor.


A visual selection can be yanked and putted into the command-line using ++ctrl++++r+double-quote++

