Configuration data can be stored in a variety of locations:

-   /etc/gitconfig
-   $HOME/.gitconfig
-   $REPO/.git/config

```ini title="Conditional configuration"
[includeIf "gitdir:~/projects/work/"]
    path = ~/projects/work/.gitconfig

[includeIf "gitdir:~/projects/oss/"]
    path = ~/projects/oss/.gitconfig
```
