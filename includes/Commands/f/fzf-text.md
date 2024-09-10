Browse source code of all bash scripts in **/usr/bin**.
The **--bind** option is set to open the script for editing.

```sh
file /usr/bin/* | sed -n '/Bourne/p' | cut -d: -f1 | 
    fzf --reverse --preview 'bat {}' \
        --bind 'enter:become(sudo vim {})'
```

This example uses [nihaalghul/marclidown](https://codeberg.org/NihaAlGhul/MarCLIdown) to render markdown.
Lines of output are truncated by default so line wrapping is enabled by passing "wrap" to **--preview-window**.

```sh
ls -I '*links*' | 
    fzf --reverse --preview 'marclidown {}' \
        --preview-window=wrap,80% 
```