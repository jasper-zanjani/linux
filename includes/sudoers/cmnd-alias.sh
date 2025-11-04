# Command aliases are defined using the Cmnd_Alias directive.

# All the shutdown commands
Cmnd_Alias SHUTDOWN_CMDS = /sbin/poweroff, /sbin/reboot, /sbin/halt

# Printing commands
Cmnd_Alias PRINTING_CMDS = /usr/sbin/lpc, /usr/sbin/lprm

# Admin commands
Cmnd_Alias ADMIN_CMDS = /usr/sbin/passwd, /usr/sbin/useradd, /usr/sbin/userdel, /usr/sbin/usermod, /usr/sbin/visudo
