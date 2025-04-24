# Add repo
dnf config-manager --add-repo $REPOURL

# Disable repo
dnf config-manager --set-disabled $REPONAME

# Enable repo (in this case a preexisting repo kept disabled by default)
dnf config-manager --enable zfs-testing

# Display configuration (run as root)
dnf config-manager --dump
