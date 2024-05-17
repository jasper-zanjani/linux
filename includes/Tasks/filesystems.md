```sh title="ext4"
mkfs.ext4 /dev/sda1
fsck.ext4 /dev/sda1
```
```sh title="xfs"
mkfs.xfs /dev/sda2
xfs_repair /dev/sda2
```