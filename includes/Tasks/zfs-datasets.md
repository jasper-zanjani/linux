A **dataset**{: #dataset } in ZFS is equivalent to the [btrfs](#btrfs) [**subvolume**](#subvolume), defined as an independently mountable POSIX filetree.
Commands under [**zfs**](https://openzfs.github.io/openzfs-docs/man/8/zfs.8.html) exist for [displaying](https://openzfs.github.io/openzfs-docs/man/8/zfs-list.8.html), [creating](https://openzfs.github.io/openzfs-docs/man/8/zfs-create.8.html), [renaming](https://openzfs.github.io/openzfs-docs/man/8/zfs-rename.8.html), and [destroying](https://openzfs.github.io/openzfs-docs/man/8/zfs-destroy.8.html) datasets:

```sh title="Create dataset"
zfs create tank/dataset

# Datasets are not displayed recursively without -r
zfs list -r tank

zfs rename tank pool

zfs remove pool/dataset
```

Dataset properties can be changed with [**zfs set**](https://openzfs.github.io/openzfs-docs/man/8/zfs-set.8.html):

```sh title="Configure dataset"
zfs set mountpoint=/mnt/tank tank
zfs set compression=on tank/dataset
zfs set sync=disabled tank/dataset
zfs set acme:disksource=vendorname  
```
