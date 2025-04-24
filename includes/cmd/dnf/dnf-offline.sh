# Start system upgrade
dnf offline reboot

# Cancel system upgrade and delete files
dnf offline clean

# Show logs from last upgrade attempt
dnf offline log --number=1
