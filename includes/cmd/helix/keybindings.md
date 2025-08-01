[Key remappings](https://docs.helix-editor.com/remapping.html) are performed with each mode (normal, insert, etc) its own section.
 
```toml
[keys.normal]
";" = "command_mode"
"A-z" = ":toggle soft-wrap.enable" # (1)

[keys.normal.space]
minus = "file_picker" # (2)

[keys.insert]
"C-s" = ["normal_mode", ":write"] # (3)
```

1.  The [`toggle` command](https://docs.helix-editor.com/commands.html?highlight=toggle#typable-commands) can be used to toggle between boolean values

2. [Space mode](https://docs.helix-editor.com/keymap.html#space-mode) is accessed by typing space in normal mode.
These commands are remappable by using the [`keys.normal.space` table](https://github.com/helix-editor/helix/issues/2841).

3.  A sequence of actions is specified by defining an array.
