There are two kinds of keybindings in Vim

- **Recursive** using command words map, nmap, vmap, etc. In these keybindings, the mapping itself is interpreted.
- **Nonrecursive** 

There are two types of keycodes:

- [**Vim keycodes**](https://vim.fandom.com/wiki/Mapping_fast_keycodes_in_terminal_Vim) which are identifiable as being in angle brackets: `<Space>`, `<Return>`, etc
- [**Terminal keycodes**](https://wiki.archlinux.org/index.php/Keyboard_input#Identifying_keycodes_in_Xorg) that appear similar to `^[[1;2A`. These may or may not be identifiable with the **keycodes** which the Linux kernel maps to raw keyboard **scancodes**.

The **leader** key (++backslash++ by default) is used to create more complicated keybindings using any arbitrary keypress, for example using ++comma++ or ++space++.

```vim
" Set Leader f to format the document
nnoremap <Leader>f gg=G
```

```vim
let mapleader = ' '
```

```vim
" Map ++alt+j++ and ++alt+k++ to move lines of text up or down
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
```
