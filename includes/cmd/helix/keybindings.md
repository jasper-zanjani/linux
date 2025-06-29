[Key remappings](https://docs.helix-editor.com/remapping.html) are performed with each mode (normal, insert, etc) its own section.
 
```toml
[keys.normal]
";" = "command_mode"
```

The [`toggle` command](https://docs.helix-editor.com/commands.html?highlight=toggle#typable-commands) can be used to toggle between boolean values

```toml
[keys.normal]
"A-z" = ":toggle soft-wrap.enable"
```

[Space mode](https://docs.helix-editor.com/keymap.html#space-mode) is accessed by typing space in normal mode.
These commands are remappable by using the [`keys.normal.space` table](https://github.com/helix-editor/helix/issues/2841).

```toml
[keys.normal.space]
minus = "file_picker"
```

A sequence of actions is specified by defining an array.

```toml
[keys.insert]
"C-s" = ["normal_mode", ":write"]
```
