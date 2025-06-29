There are a variety of solutions available for managing package installations.

[junegunn/vim-plug](https://github.com/junegunn/vim-plug)'s main [script file](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim) must be downloaded to **$HOME/.local/share/nvim/site/autoload**.
This must be downloaded separately from the configuration files present in **.config/nvim**.
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

