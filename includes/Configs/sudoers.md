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
# Command aliases are defined using the Cmnd_Alias directive.

# All the shutdown commands
Cmnd_Alias SHUTDOWN_CMDS = /sbin/poweroff, /sbin/reboot, /sbin/halt

# Printing commands
Cmnd_Alias PRINTING_CMDS = /usr/sbin/lpc, /usr/sbin/lprm

# Admin commands
Cmnd_Alias ADMIN_CMDS = /usr/sbin/passwd, /usr/sbin/useradd, /usr/sbin/userdel, /usr/sbin/usermod, /usr/sbin/visudo
```

```sh title="Example configurations"
# Change timeout to 10 minutes
Defaults timestamp_timeout=10

# Change timeout to 10 minutes only for user
Defaults:$USER timestamp_timeout=10

# Default editor for use with visudo
Defaults editor=/usr/bin/vim
```