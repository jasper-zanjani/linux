Using the **help** command with a topic will look up that topic in the help files, located at **/usr/share/vim/vim91/doc/**. 
These are text files, and their filename can also be passed to help:
```vim
:help map-special-keys

" Specify a manual file
:help help.txt
```

The help screen can be opened in a [vertical split](#split) with

```vim
:vertical help help.txt
```
