Execute a command at a given time.

```sh
# Jobs can be created by piping strings or by using the interactive shell.
at $TIME
at> echo "Hello, world!"

# Equivalent to:
echo "Hello, world!" | at $TIME
at>^D

# Specify time
at now + 1 min

echo "sed -i '/jdoe/d' /etc/sudoers.d/jdoe" | sudo at now + 7 days
```

