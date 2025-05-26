Vi requires the **+clipboard** feature flag for it to integrate with the system keyboard

```vimrc
" Check for +clipboard feature flag
echo has('clipboard') " => 1
```

A selection can be yanked to the clipboard by specifying the `"+` register ++double-quote+plus+y++
Pasting from the clipboard is done by specifying the same register ++double-quote+plus+p++ or with the standard shortcut ++ctrl+shift+v++

Text can be pasted into the command-line using ++ctrl+r+plus++ (or ++ctrl+shift+v++).

