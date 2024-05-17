# Stratis

**Stratis** is an open-source managed pooled storage solution in the vein of ZFS or btrfs.

Stratis block devices can be disks, partitions, LUKS-encrypted volumes, LVM logical volumes, or DM multipath devices.
Stratis pools are mounted under **/stratis** and, like other pooled storage systems, support multiple filesystems.
Stratis file systems are thinly provisioned and formatted with **xfs**, although vanilla xfs utilities cannot be used on Stratis file systems.

```sh
--8<-- "includes/Tasks/stratis-install.sh"
```

```sh title="Pool management"
--8<-- "includes/Tasks/stratis-pool.sh"
```

```fstab title="/etc/fstab"
--8<-- "includes/Configs/fstab-stratis"
```

```sh title="Snapshot management"
--8<-- "includes/Tasks/stratis-snapshot.sh"
```