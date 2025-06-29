I need to learn more about the functions, but this is an example of a Neovim function I found on [Reddit](https://www.reddit.com/r/neovim/comments/10kah18/how_to_insert_newline_without_entering_insert_mode/) to insert newlines without entering Insert mode.

```lua
-- Insert newline after current line
vim.keymap.set('n', '<CR>', "<Cmd>call append(line('.'), repeat([''], v:count1))<CR>")
```
