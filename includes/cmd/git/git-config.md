**git config** provides a frontend to the INI formatted config files typically found within **.git/config** in each repo or, when using **-g**/**--global**, **$HOME/.gitconfig**.

```sh
# List all configuration (includes directive in global .gitconfig)
git config --list

# Store authentication details in the credential store (2)
git config --global credential.helper store

# Set up alias "br" for branch (1)
git config --system alias.br branch

# Define a directory as safe (3)
git config --global --add safe.directory $PATH
```


1. 
```ini title="/etc/gitconfig"
[alias]
    br = branch
```
2. 
```ini title=".gitconfig"
[credential]
    helper = cache
```
3. 
```ini title=".gitconfig"
[safe]
    directory = $PATH
```

```sh
# Git will automatically append CRLF endings on Windows. 
# This setting can be displayed with the following command:
git config core.autocrlf

# Disable appending CRLF endings
git config core.autocrlf false
```
