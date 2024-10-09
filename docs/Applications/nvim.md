# Neovim

[Lua guide](https://neovim.io/doc/user/lua-guide.html#lua-guide)

Neovim supports using **init.vim** or **init.lua** as the configuration file, but
not both at the same time.

!!! info "Ideas"

    - How to manage scrolling behavior so that it's more legible, keeping the cursor in the middle of the screen and preventing empty screens with only a single line visible when at the end of the buffer?

    - Set an autocmd (?) to enforce **nonu** and **nornu** on a terminal pane.

    - Figure out how to open help in a vertical split to the right and a terminal in a horizontal split to the bottom automatically.

    - Find out how plugin setup works

    - Explore tag system

    - Explore [helix configuration](https://docs.helix-editor.com/configuration.html)

<div class="grid cards" markdown>

-   #### Configuration

    ---

    Settings in Neovim can be defined using **either** Lua or Vimscript configuration files (but not both).

    Vim options are set with children of [**vim.opt**](https://neovim.io/doc/user/lua.html#vim.opt) which are set to various values.

    ```lua
    vim.opt.expandtab = true
    vim.opt.shiftwidth = 4
    vim.opt.softtabstop = 4
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.breakindent = true -- (1)
    vim.opt.linebreak = true
    vim.opt.splitbelow = true
    vim.opt.splitright = true
    ```

    1. 
    ```vimscript
    set et sw=4 sts=4 nu rnu bri
    ```

    Arbitrary vim commands can be specified by passing a string argument to [**vim.cmd**](https://neovim.io/doc/user/lua.html#vim.cmd()), although many commands appear to be methods on this object.
    This appears to be the best way to specify highlighting outside of a colorscheme:

    ```lua
    -- Apparently equivalent
    vim.cmd("highlight NonText ctermfg=Black")
    vim.cmd.highlight("NonText ctermfg=Black")
    ```

    Lua inclusions are done with **require**, which takes a module name as argument (filename excluding .lua extension).
    These must appear in the subdirectory named **lua** sibling to the init.lua

    ```lua title="init.lua"
    -- Load lua/keymaps.lua
    require("keymaps")
    ```

-   #### Help

    ---

    Using the **help** command with a topic will look up that topic in the help files, located at **/usr/share/vim/vim91/doc/**. 
    These are text files, and their filename can also be passed to help:
    ```vim
    :help map-special-keys

    " Specify a manual file
    :help help.txt
    ```

    The help screen can be opened in a [vertical split](#split) with

    ```vim
    :vertical help help.txt
    ```

-   #### Keymaps

    ---

    Neovim [keymappings](https://neovim.io/doc/user/map.html#mapping) use the [**vim.keymap.set**](https://neovim.io/doc/user/lua.html#_lua-module:-vim.keymap) command.

    ```lua
    vim.keymap.set("n", ";", ":") -- (1)
    ```

    1. 
    ```vimscript
    nmap ; :
    ```

    ```lua
    --8<-- "includes/Configs/nvim/leader.lua"
    ```

    When using commands from a plugin like **nvim-surround**, remapping must be enabled to make it recursive.


    ```lua
    --8<-- "includes/Configs/nvim/markdown.lua"
    ```

    Effective keymappings can be displayed within nvim using:

    ```vimscript
    verbose map <C-w>
    verbose imap <space>
    ```

    In some cases, an existing keymapping will interfere with a new one.
    For example, ++ctrl+w++ ++d++ and ++ctrl+w++ ++ctrl+d++ are mapped by default.
    This will introduce a delay when mapping ++ctrl+w++ because the editor will wait for furth input.

    These keymappings can be removed using **vim.keymap.del**

    ```lua
    vim.keymap.del('n', '<C-w>d')
    vim.keymap.del('n', '<C-w><C-d>')
    ```

    If attempting to determine the internal code specifying a keypress, use ++ctrl+k++ in command mode.

    Setting a keymap for **command** mode will cause interference while typing normal commands in the command line.


    !!! info "Resources"

        - [How I set up Neovim to make it amazing in 2024: the ultimate guide](https://www.youtube.com/watch?v=6pAG3BHurdM)

-   #### Plugins

    ---

    There are a variety of solutions available for managing package installations.

    [junegunn/vim-plug](https://github.com/junegunn/vim-plug)'s main [script file](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim) must be downloaded to **$HOME/.local/share/nvim/site/autoload**.
    Then the vim config must be edited:

    ```lua
    local Plug = vim.fn['plug#']
    vim.call('plug#begin')
    
    Plug('williamboman/mason.nvim')
    
    vim.call('plug#end') -- (1)
    ```

    1. 
    ```vimscript
    call plug#begin()

    Plug 'williamboman/mason.nvim'

    call plug#end()
    ```

    Use the **PlugInstall** command to install the specified plugins and then display them using **PlugStatus**.

    - [**Mason**](https://github.com/williamboman/mason.nvim) is used to installl LSPs, linters, and other coding tools.
    The **Mason** command brings up a modal dialog box which displays both installed packages and available ones.

    - **nvim-tree**

    Many installed plugins must have a require statement to be loaded on startup.

    ```lua
    require("nvim-tree").setup()

    require("mason").setup()
    ```

    - [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)

-   #### Patterns

    ---

    The motion keys form the most common patterns used for actions, acting on the entire line, word, until whitespace, etc.

    The [**operate until pattern**](https://vimtricks.com/p/vimtrick-operate-until-pattern/) allows an action to take place until a given pattern is found.

    - **dtX** delete until character X
    - **cfX** change until (and including) character X
    - **d/foo&lt;Enter&gt;** delete until "foo" is found

-   #### Completion

    ---

    ```lua
    local cmp = require'cmp'

    cmp.setup({
      snippet = {
        expand = function(args)
             vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      sources =  {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'buffer' , keyword_length = 5 },
      },
    })
    ```

    [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) is a completion engine. 

    The plugin's **setup** method takes a table object that defines various configuration parameters.

    - **sources** defines ["source plugins"](https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources) that actually provide completions. 
    Sources can take various settings that affect completion:

        - **keyword\_length** changes how many letters are required before producing a completion from the buffer

    - **mapping** defines keymappings

    - **snippet** take settings that change depending on the snippets plugin


-   #### Copying and pasting

    ---

    There are various registers in Vim and Neovim available for copying and pasting.
    In command and normal modes, every register can be accessed by prefixing its name with ++double-quote++.

    - ++double-quote++++double-quote++ text that is yanked uses the default, unnamed register
  
    - ++double-quote++++plus++ the system clipboard
    
    - ++double-quote++++x++ every letter and symbol can be made a register


    
    In insert mode they can be accessed using ++ctrl++++r++.

-   #### Error handling

    ---

    When there is only one tab ("window") open, the command **close** will not function, but the editor will throw the error "E444: Cannot close last window".
    By contrast the commands **exit** or **quit** can be used to close the program entirely.
    This means two separate keybindings must be used to exit or to close tabs.

    However, Vim support [error handling](https://stackoverflow.com/questions/5850103/try-catch-in-vimscript) using **try** and **catch**.

    ```lua
    vim.keymap.set('n', '<C-w>', "execute 'try | close | catch | quit | endtry'")
    ```

-   #### Registers

    ---

    There are many registers available for use in Vim, but when using yank and paste a single register is used called the "unnamed" register, signified by **`"`**.

    The contents of a specified register can be displayed with the **reg** command.


    ```vim
    reg "
    ```

    If there is more than one selection in the register, they will be marked as:

    - **c** for characterwise text
    - **l** for linewise text
    - **b** for blockwise text


    The system's clipboard is accessible using [**`"+`**](https://vimdoc.sourceforge.net/htmldoc/gui_x11.html#quoteplus).

-   #### Syntax highlighting

    ---

    The [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) plugin is useful for enabling syntax highlighting on code snippets in markdown files.

-   #### To-do

    ---

    **Open help in a vertical split**


    It appears there are a [variety of ways](https://www.reddit.com/r/neovim/comments/ctrdtq/always_open_help_in_a_vertical_split/) of automating this, especially with an [autocommand](#autocommands):

    ```vim
    augroup vertical_help
    autocmd!
    autocmd FileType help wincmd L
    augroup END

    " Looking up keyword with K shows help in a vsplit
    :setlocal keywordprg=:vert\ help
    ```


-   #### Autocommands

    ---

    Read:

    - [Create autocommands in Neovim](https://andrewcourter.substack.com/p/create-autocommands-in-neovim)

    - [Learn Vimscript the Hard Way](https://learnvimscriptthehardway.stevelosh.com/chapters/12.html)

-   #### Terminal

    ---

    Neovim offers an [integrated terminal](http://neovim.io/doc/user/nvim_terminal_emulator.html).
    It is opened with the **:terminal** command, and by entering into insert mode the terminal can be used as normal.
    Bizarrely, the binding ++ctrl++++bslash+ctrl++++n++ is the sequence that must be pressed to exit terminal mode and to be able to interact with Neovim.
    A sensible alternative keymapping provided in the documentation also illustrates there is a **t** mode for keymappings:

    ```lua
    vim.keymap.set('t', '<Esc>', '<C-bslash><C-N>' )
    ```

-   #### Theming

    ---

    ```vim
    " Test theming by displaying highlight-groups
    :so $VIMRUNTIME/syntax/hitest.vim
    ```

-   #### Buffers

    ---

    Currently open files are referred to as "buffers"
    
    ```vim
    " List open buffers
    :buffers

    " Open a buffer for editing
    :b4

    " Close ("delete") buffer
    :bd3
    ```

-   #### Marks

    ---

    A mark is a bookmark or placeholder that allows the user to return to a location in the file.
    Use ++m++ to set a mark and ++single-quote++ or ++grave++ to jump to a specified mark.
    Any alphanumeric character can be used to store a mark, similar to named registers.


    - ++grave++++grave++ jump to previous context mark

    - ++grave++++less++ and ++grave++++greater++ start and end of visual selection

</div>

