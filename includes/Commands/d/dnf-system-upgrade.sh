# Download upgrade files
dnf system-upgrade download --releasever 38

# Start upgrade
dnf system-upgrade reboot

# Show logs from last upgrade attempt
dnf system-upgrade log --number=1

# Remove cached metadata and transactions
dnf system-upgrade clean
