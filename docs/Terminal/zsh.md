# zsh

#### Key bindings

[++ctrl+left++ and ++ctrl+right++](https://unix.stackexchange.com/questions/58870/ctrl-left-right-arrow-keys-issue) don't appear to work by default:

```zsh title=".zshrc"
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
```


#### history

The **history** builtin command works differently from that in bash and will only produce a few commands.
It can accept a number as argument

```zsh
history 0
```
