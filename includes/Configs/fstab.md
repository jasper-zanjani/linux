Traditionally, filesystems are mounted using **/etc/fstab**, a whitespace-delimited config file.

Typical fstab entries have six columns, delimited by whitespace:

1. Block special device can appear in any number of ways depending on the nature of the device
2. Mount point
3. Filesystem type
4. Mount options
    - **\_netdev** prevents the filesystem from being mounted until the system's network has been enabled
5. **fs\_freq** is used by **dump** to determine which filesystems need to be dumped (usually 0)
6. **fs\_passno** is used by **fsck** to determine the order in which filesystem checks are done at boot time (usually 0)

```sh title="/etc/fstab"
# NFS
--8<-- "includes/Configs/fstab-nfs"

# SMB
--8<-- "includes/Configs/fstab-smb"

# VDO
--8<-- "includes/Configs/fstab-vdo"

# Stratis
--8<-- "includes/Configs/fstab-stratis"

# btrfs
--8<-- "includes/Configs/fstab-btrfs"
```
