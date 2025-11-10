Neovim [keymappings](https://neovim.io/doc/user/map.html#mapping) use the [**vim.keymap.set**](https://neovim.io/doc/user/lua.html#_lua-module:-vim.keymap) command.

```lua
vim.keymap.set("n", ";", ":")
```

Multiple modes are specified by providing a list.

```lua
-- Use Ctrl-<motion> to navigate between panes
vim.keymap.set({ "n", 'i', 'v' }, "<C-h>", "<C-w>h")
vim.keymap.set({ "n", 'i', 'v' }, "<C-j>", "<C-w>j")
vim.keymap.set({ "n" , 'i', 'v'}, "<C-l>", "<C-w>l")
vim.keymap.set({ "n" , 'i', 'v'}, "<C-k>", "<C-w>k")
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

