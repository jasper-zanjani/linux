```sh
# Start neovim with no configuration
nvim --clean
```


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
