**Snap** is one of several recent containerized application distribution solutions for Linux.

Snap apps are slow to start because data is stored in **squashfs** images.

```sh title="Installation"
# Red Hat
dnf install -y snapd
ln -s /var/lib/snapd/snap /snap
```

