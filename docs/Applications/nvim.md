# Neovim

[Lua guide](https://neovim.io/doc/user/lua-guide.html#lua-guide)

Nvim supports using **init.vim** or **init.lua** as the configuration file, but
not both at the same time.

- ~/.config/neovim/init.vim
- ~/.config/neovim/init.lua

Lua files can be pled in the **lua** directory and loaded with **require**.

```lua
" Load myluamodule.lua
require("myluamodule")

" Loading modules in subdirectories can be done by using slash or period
require('other_modules/anothermodule')
require('other_modules.anothermodule')

" Load a folder containing init.lua
require('other_modules')
```

Options in vim are set with children of [**vim.opt**](https://neovim.io/doc/user/lua.html#vim.opt)

- expandtab
- shiftwidth
- smartindent
- tabstop
- softtabstop