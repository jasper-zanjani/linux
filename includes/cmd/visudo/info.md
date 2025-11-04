```sh
# Specify file other than /etc/sudoers
visudo -f $SUDOERS_FILE

# Check configuration
visudo -c
```

Despite the name, the default editor spawned by visudo is actually nano.
The default can be changed with an entry in the sudoers file itself.

```sh
# Default editor for use with visudo
Defaults editor=/usr/bin/vim
```

```sh
# Provide editor in-line
EDITOR=$EDITOR visudo
```

