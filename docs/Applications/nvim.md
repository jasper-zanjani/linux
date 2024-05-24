# Neovim

[Lua guide](https://neovim.io/doc/user/lua-guide.html#lua-guide)


Neovim supports using **init.vim** or **init.lua** as the configuration file, but
not both at the same time.

Neovim configuration using Lua is most often done taking advantage of Lua modules.

Lua files can be placed in the **lua** directory and loaded with **require**.

```lua
" Load myluamodule.lua
require("myluamodule")

" Loading modules in subdirectories can be done by using slash or period
require('other_modules/anothermodule')
require('other_modules.anothermodule')

" Load a folder containing init.lua
require('other_modules')
```

Vim options are set with children of [**vim.opt**](https://neovim.io/doc/user/lua.html#vim.opt).

<div class="grid cards" markdown>

-   
    ```lua title="Lua configuration"
    -- Prevent vim from creating backups files
    opt.backup = false

    -- Set relative line numbers
    opt.relativenumber = true

    -- Line wrapping
    opt.wrap = true

    -- Mouse support is enabled by default
    opt.mouse = "a"
    ```
-   
    ```vim title="Vim configuration"
    " Prevent vim from creating backups files
    set nobackup

    " Set relative line numbers
    set rnu

    " Line wrapping
    set wrap

    " Mouse support
    set mouse=a
    ```

</div>

#### Keymaps

Neovim keymappings use the **keymap.set** or **keymap** commands.

```lua
--8<-- "includes/Configs/nvim/keymaps.lua"
```

A common keymapping is to use ++ctrl+h++, ++ctrl+j++ etc to navigate between window panes.

```lua
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
```


??? info "Resources"

    - [How I set up Neovim to make it amazing in 2024: the ultimate guide](https://www.youtube.com/watch?v=6pAG3BHurdM)