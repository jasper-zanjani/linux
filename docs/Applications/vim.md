[https://vim.fandom.com/wiki/Moving_lines_up_or_down]: https://vim.fandom.com/wiki/Moving_lines_up_or_down "Vim Tips Wiki: \"Moving lines up or down\""
[Oualline]: http://sci.notbc.org/~weiss/resources/vim/Vim-course/others/vim-1.0.pdf "Oualline, Steve. _The Vim Book_. 2007."
[https://youtu.be/wlR5gYd6um0]: https://youtu.be/wlR5gYd6um0 "Mastering the Vim Language"

# Vim

??? info "Resources"

    - [Damian Conway - More Instantly Better Vim - OSCON 2013](https://youtu.be/aHm36-na4-4)


Unlike WYSIWYG editors which optimize input for writing text, vim optimizes for editing it.
Vim offers a **composable** language for expressing these editing changes whose syntax can be composed into two elements, **operations** and **text objects**, which are analogous to **verbs** and **nouns** in language.

The framework of understanding vim's syntax as a language appears to date back to an influential 2011 Stack Overflow [post](https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118 "What is your most productive shortcut with Vim?").

On Unix-derived operating systems the main config file for Vim is placed at **$HOME/.vimrc**.
On Windows it is placed at **$HOME/\_vimrc**.

## Commands

- **U** uppercase
- **u** lowercase
- **~** toggle uppercase/lowercase per character

## Syntax

    
```vim title="Normal-mode commands"
" Select all lines of a buffer
normal ggVG
```

#### Keybindings

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


#### Autocommands
:   
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

<div class="grid cards" markdown>

-   #### Colors

    ---

    Element colors are changed using **hi\[light\]**.

    ```vim
    " Change comments to use the Grey terminal color
    highlight Comment ctermfg=Grey

    " Change color of whitespace (made visible with list)
    hi Whitespace ctermfg=DarkGrey

    ```

-   #### Formatting characters

    ---

    ```vim
    " Toggle visibilty of formatting characters (whitespace, etc)
    set list!

    " Customize characters displayed to represent classes of formatting characters
    set listchars=space:·
    ```

    List characters are governed by the **SpecialKey** highlight group, although other groups like **Whitespace** also appear to work.

    The tilde character used to fill lines at the end of files is its own highlight group, although it usually links to NonText.

    ```vim
    highlight EndOfBuffer ctermfg=Black
    ```


</div>

#### Completion

- [Context-aware completion](https://youtu.be/3TX3kV3TICU?t=1005)
- [++ctrl+x++ ++ctrl+l++](https://youtu.be/3TX3kV3TICU?t=1260)
- [Omni completion ++ctrl+x++ ++ctrl+o++](https://youtu.be/3TX3kV3TICU?t=1350)

## Tasks

<div class="grid cards" markdown>

-   #### Invocation

    ---

    ```sh
    # Open with cursor at line 13
    vim .bashrc +13
    ```

-   #### Search and replace

    ---

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


-   #### Configuration

    ---

    ```vim
    set nobackup        " Prevent vim from creating backups files
    set relativenumber  " Set relative line numbers
    set number          " Set current line number to be displayed
    set wrap            " Line wrapping
    set linebreak       " Line wrapping without breaking words
    set mouse=a         " Mouse support
    ```

-   #### Mapping keys

    ---

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

-   #### Yanking STDOUT 

    ---

    To run a shell command from the normal mode command line, you simply run the **!** command (["bang"](https://learnvimscriptthehardway.stevelosh.com/chapters/52.html)) in normal mode.

    ```vim
    !env
    ```

    However to [store the output of that command into a register](https://stackoverflow.com/questions/1694392/vim-store-output-of-external-command-into-a-register), you must run a command like the following, which stores the output of the shell command into the **a** register.

    ```vim
    let @a = system('env')
    ```
    The register signified by **@"** will be placed into the buffer by the **put** command (++p++).

    ```vim
    let @" = system('env')

    " Alternatively
    put =system('env')
    ```

-   #### Clipboard

    ---

    Vi requires the **+clipboard** feature flag for it to integrate with the system keyboard
    
    ```vimrc
    " Check for +clipboard feature flag
    echo has('clipboard') " => 1
    ```

    A selection can be yanked to the clipboard by specifying the `"+` register ++double-quote+plus+y++
    Pasting from the clipboard is done by specifying the same register ++double-quote+plus+p++ or with the standard shortcut ++ctrl+shift+v++

    Text can be pasted into the command-line using ++ctrl+r+plus++ (or ++ctrl+shift+v++).

-   #### Plugins

    ---

    Vim 8 supports native loading of plugins (put in **$HOME/.vim/pack/start/**)

    [vim-plug](https://github.com/junegunn/vim-plug) is a popular plugin manager.


    Install a plugin to provide [Rust language support](https://github.com/rust-lang/rust.vim)

    ```vim
    Plug 'rust-lang/rust.vim'
    ```

-   #### Syntax highlighting

    ---

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
    However, the open angle bracket does not.


-   #### Splits

    ---

    Panes are referred to as "splits" and are controlled by a variety of [bindings](https://vimtricks.com/p/vim-move-split/).

    - `sp` or `split` will open a horizontal split (i.e. a split to the top or bottom)
    - `vs` or `vsplit` will open a vertical split
    - `vert` will open a help query in a vertical split

-   #### Tabs

    ---

    - `tabedit` will open a file in a new tab, relative to the working directory from which vim was invoked
    - `tabn` or `tabnext` will navigate to a specified tab number.
    - The motion commands `gt` and `gT` will navigate to the next or previous tabs.
    Like other motion commands a number can be prepended to the motion to move a greater number of tabs.
    - `tabmove` moves a tab to a specified position number.

-   #### Markdown

    ---

    Reformat a section of markdown with [pandoc](https://www.reddit.com/r/vim/comments/10q8f4f/tip_reformat_a_markdown_table/)

    ```sh
    :'<,'>!pandoc -t commonmark_x
    ```

</div>
