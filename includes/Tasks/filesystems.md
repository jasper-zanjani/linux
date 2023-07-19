```sh title="Formatting filesystems"
mkfs.ext4 /dev/sda1
fsck.ext4 /dev/sda1

mkfs.xfs /dev/sda2
xfs_repair /dev/sda2
```