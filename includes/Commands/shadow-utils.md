```sh title="gpasswd"
## Administer /etc/group and /etc/gshadow 
# Add user to group
gpasswd -a $USER $GROUP

# Add user as admin of group
gpasswd -A $USER $GROUP

# Remove user from group
gpasswd -d $USER $GROUP
```

```sh title="useradd"
# Create a new user with default home directory and specifying shell
useradd -m -s /usr/bin/fish $USER

# Display configuration
useradd -D
```

```ini title="/etc/default/useradd"
--8<-- "includes/Configs/useradd-arch"

# useradd also inherits settings from /etc/login.defs
```

```sh title="userdel"
# Delete an existing user account as well as the user's home directory
userdel -r $USER
```
