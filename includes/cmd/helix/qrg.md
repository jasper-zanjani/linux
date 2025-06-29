Vim command     | Helix | Note
---      | ---   | ---
`dd`     | `xd`
`0` | `gh`
`^` | `gs`
`S`      | `ms` | Surround is integrated in Helix, but multiple characters are not yet supported.
`gg`     | `ge` | [Goto mode](https://docs.helix-editor.com/keymap.html?highlight=goto%20mode#goto-mode)
`+`_`n`_ | _`n`_`gg` | Goto specified line `n`
`C-PgUp`, `C-PgDn` | `gp`, `gn` | Open buffers become tabs, which can be displayed across any or all of open panes.
