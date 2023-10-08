# LXD

LXD was acquired by Canonical recently and appears to be the preferred container runtime on Ubuntu.

```sh
# Add user to lxd group
usermod -aG lxd $USER

# Confirm
id

# Initialize lxd
lxd init

# Display containers
lxc list

# Run a container
lxc launch ubuntu:22.04

# Stop it, using the randomly generated name
lxc stop accurate-lion

lxc rm accurate-lion
```