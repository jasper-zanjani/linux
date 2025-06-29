When there is only one tab ("window") open, the command **close** will not function, but the editor will throw the error "E444: Cannot close last window".
By contrast the commands **exit** or **quit** can be used to close the program entirely.
This means two separate keybindings must be used to exit or to close tabs.

However, Vim support [error handling](https://stackoverflow.com/questions/5850103/try-catch-in-vimscript) using **try** and **catch**.

```lua
vim.keymap.set('n', '<C-w>', "execute 'try | close | catch | quit | endtry'")
```

