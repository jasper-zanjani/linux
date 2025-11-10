Neovim offers an [integrated terminal](http://neovim.io/doc/user/nvim_terminal_emulator.html).
It is opened with the **:terminal** command, and by entering into insert mode the terminal can be used as normal.
Bizarrely, the binding ++ctrl++++backslash+ctrl++++n++ is the sequence that must be pressed to exit terminal mode and to be able to interact with Neovim.
A sensible alternative keymapping provided in the documentation also illustrates there is a **t** mode for keymappings:

```lua
vim.keymap.set('t', '<Esc>', '<C-bslash><C-N>' )
```

Additionally there is the [toggleterm](https://github.com/akinsho/toggleterm.nvim) plugin which allows customization of terminal behavior.
