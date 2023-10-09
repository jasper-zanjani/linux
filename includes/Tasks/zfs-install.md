On [Arch](https://openzfs.github.io/openzfs-docs/Getting%20Started/Arch%20Linux/index.html), the **zfs-linux** package must be installed from the [**archzfs**](https://github.com/archzfs/archzfs) repo.

```ini title="/etc/pacman.conf"
--8<-- "includes/Configs/archzfs.cfg"
```

```sh
# Install ZFS
pacman -S zfs-linux
```

On [Fedora](https://openzfs.github.io/openzfs-docs/Getting%20Started/Fedora/index.html), the **zfs** package must be installed from the ZFS repo.

```sh
dnf install -y https://zfsonlinux.org/fedora/zfs-release-2-3$(rpm --eval "%{dist}").noarch.rpm

# Install kernel headers
dnf install -y kernel-devel

# Install ZFS
dnf install -y zfs
```