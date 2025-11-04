The **/etc/sudoers** file (or files placed under **/etc/sudoers.d/**) contains **user specifications** that define commands that users may execute.

```sh
$USER $HOST=($RUNAS) $COMMAND
```

- **$USER** specifies usernames, UIDs, or group names when prefixed with **%** (i.e. **%wheel**), or GIDs when prefixed with **%#**
- **$HOST** hostnames, IP addresses, or a CIDR range (i.e. 192.0.2.0/24)
- **$RUNAS** controls the user or group as which sudo will run the command. If a username is specified, sudo will not accept a **-g** argument when running sudo. 
- **$COMMAND** is the full path to an executable, or a comma-delimited list of commands.

Any of these elements can be replaced with the keyword **ALL**.

```sh title="Example user specifications"
# Ansible service account
ansible ALL=(ALL) NOPASSWD: ALL

# Allow user to run all commands without authenticating"
user ALL=(ALL) NOPASSWD: ALL

# Allow user to run only the mkdir command"
user ALL=/bin/mkdir
```

```sh title="Command aliases"
--8<-- "includes/sudoers/cmnd-alias.sh"
```

```sh title="Example configurations"
--8<-- "includes/sudoers/examples.sh"
```
