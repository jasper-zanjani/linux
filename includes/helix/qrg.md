**Navigating**

vim | hx  |         | 
--- | --- | ------- |
`0` | `gh` | Beginning of line
`$` | `gl` | End of line
`^` | `gs` | First non-blank character in line
`gg` | `gg` | Top of file
`G`  | `ge` | Bottom of file
`+`_`n`_ | _`n`_`gg` | Goto specified line `n`
`C-PgUp`, `C-PgDn` | `gp`, `gn` | Open buffers become tabs, which can be displayed across any or all of open panes.

Many movement keys and normal commands used for navigation are consolidated in Helix's [Goto mode](https://docs.helix-editor.com/keymap.html#goto-mode)

Because motion keys actually create selections in Helix, navigating and selecting are deeply connected.
One trouble spot for me was trying to make a selection after navigating backwards in a line using ++b++: reversing direction to make a selection always ended up omitting the characters spanned in my final motion.
This is because a selection is 
    

**Selecting**

vim | hx  |         | 
--- | --- | ------- |
`V` | `x` | Select entire line: repeat `x` to select further lines down
-   | `%` | Select entire file
-   | `C` | Copy selection below (i.e. add cursor)
-   | `,` | Primary selection only (i.e. unselect)

Helix follows a [selection-first editing philosophy](https://docs.helix-editor.com/usage.html#selection-first-editing): in essence there is always a selection being made, and even the cursor is a selection of only a single character.

----

**Deleting**

vim | hx  |         | 
--- | --- | ------- |
`x` | `d` | Delete single character    
`dd`| `xd`| Delete line

----

**Unique features**

-  [Autojump](https://felix-knorr.net/posts/2025-03-16-helix-review.html) `gw`

-   Tree sitter based code navigation, allowing "mark-around" motions:

  -  `map` mark around paragraph

-  However, Helix lacks marks.

-   `<space>s` symbol picker
-   `<space>r` rename
-   `gr` list all references for symbol under cursor

**Search and replace**

Search and replace is done by editing multiple selections simultaneously.

1. Search the entire file with `%`
2. Enter select mode with `s`
3. Type search text and end with ++enter++
4. Change all occurrences by pressing `c`
5. Exit multiple selection mode with ++esc++ or `,`

Selections can also be sent to external command-line tools like sed with `|`
