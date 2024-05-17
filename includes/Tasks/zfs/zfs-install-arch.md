On [Arch](https://openzfs.github.io/openzfs-docs/Getting%20Started/Arch%20Linux/index.html), the **zfs-linux** package must be installed from the [**archzfs**](https://github.com/archzfs/archzfs) repo.

```ini title="/etc/pacman.conf"
--8<-- "includes/Configs/archzfs.cfg"
```

```sh
# Install ZFS
pacman -S zfs-linux
```