# Install a package, providing confirmation preemptively
dnf install -y bat

# Enable a repo for just one command
dnf --enablerepo=fedora-debuginfo,updates-debuginfo install kernel-debuginfo -y
