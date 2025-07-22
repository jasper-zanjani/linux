
# Vim

--8<-- "includes/vim/info.md"

## Syntax

```vim title="Normal-mode commands"
" Select all lines of a buffer
normal ggVG
```

#### Keybindings

--8<-- "includes/vim/keybindings.md"

#### Autocommands

--8<-- "includes/vim/autocommands.md"

#### Colors

--8<-- "includes/vim/colors.md"

#### Formatting characters

```vim
" Toggle visibilty of formatting characters (whitespace, etc)
set list!

" Customize characters displayed to represent classes of formatting characters
set listchars=space:·
```

List characters are governed by the **SpecialKey** highlight group, although other groups like **Whitespace** also appear to work.

The tilde character used to fill lines at the end of files is its own highlight group, although it usually links to NonText.

```vim
highlight EndOfBuffer ctermfg=Black
```

## Tasks

#### Invocation

```sh
# Open with cursor at line 13
vim .bashrc +13
```

#### Search and replace

--8<-- "includes/vim/search.md"


#### Yanking STDOUT 

--8<-- "includes/vim/yank-stdout.md"

#### Clipboard

--8<-- "includes/vim/clipboard.md"

#### Plugins

--8<-- "includes/vim/plugins.md"

#### Splits

--8<-- "includes/vim/splits.md"

#### Tabs

--8<-- "includes/vim/tabs.md"

#### Markdown

--8<-- "includes/vim/markdown.md"

