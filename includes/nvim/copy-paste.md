There are many registers available for use in Vim, but when using yank and paste a single register is used called the "unnamed" register, signified by **`"`**.

<div class="grid cards" markdown>

```vim
" Display contents of unnamed register
reg "

" Display contents of clipboard
reg +
```

-   If there is more than one selection in the register, they will be marked as:

    - **c** for characterwise text
    - **l** for linewise text
    - **b** for blockwise text

</div>

The system's clipboard is accessible using [**`"+`**](https://vimdoc.sourceforge.net/htmldoc/gui_x11.html#quoteplus).
There are various registers in Vim and Neovim available for copying and pasting.
In command and normal modes, every register can be accessed by prefixing its name with ++double-quote++.

- ++double-quote++++double-quote++ text that is yanked uses the default, unnamed register

- ++double-quote++++plus++ the system clipboard

- ++double-quote++++x++ every letter and symbol can be made a register

In insert mode they can be accessed using ++ctrl++++r++.

