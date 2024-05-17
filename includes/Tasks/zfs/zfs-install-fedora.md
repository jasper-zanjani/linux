On [Fedora](https://openzfs.github.io/openzfs-docs/Getting%20Started/Fedora/index.html), the **zfs** package must be installed from the ZFS repo.

```sh
dnf install -y https://zfsonlinux.org/fedora/zfs-release-2-3$(rpm --eval "%{dist}").noarch.rpm

# Install kernel headers
dnf install -y kernel-devel

# Install ZFS while removing the zfs-fuse package
dnf install -y zfs --allowerasing
```
