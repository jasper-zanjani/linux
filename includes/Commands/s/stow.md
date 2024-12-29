[GNU Stow](https://www.gnu.org/software/stow/), associated with dotfiles management these days, was once used to manage dependencies used by compiled programs.
For this reason, a file tree used to create symlinks is referred to as a "package", defined as a related collection of files and directories that need to be administered as a unit and that needs to be installed in a particular directory structure.
A "target directory" is the root of a tree in which one or more packages must appear to be installed. (1)
{: .annotate }

1. Here the nvim package contains subdirectories under .config, intended to target $HOME.
    ```
    .
    └── nvim
        ├── 00Tree.html
        └── .config
            └── nvim
                ├── after
                ├── init.lua
                ├── lazy-lock.json
                ├── lua
                └── site

    7 directories, 3 files

    ```


Without providing additional options, stow will assume that the target directory is the parent of the current working directory.
For this reason, stow tutorials often place the dotfiles repository in a subdirectory of home.

```sh
# Create symlinks to package in target directory
stow $PACKAGE
stow $PACKAGE -t $HOME
            # --target
```
