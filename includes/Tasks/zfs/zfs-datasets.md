A **dataset**{: #dataset } in ZFS is equivalent to the [btrfs](#btrfs) [**subvolume**](#subvolume), defined as an independently mountable POSIX filetree.

Commands under [**zfs**](https://openzfs.github.io/openzfs-docs/man/8/zfs.8.html) exist for [displaying](https://openzfs.github.io/openzfs-docs/man/8/zfs-list.8.html), [creating](https://openzfs.github.io/openzfs-docs/man/8/zfs-create.8.html), [renaming](https://openzfs.github.io/openzfs-docs/man/8/zfs-rename.8.html), [destroying](https://openzfs.github.io/openzfs-docs/man/8/zfs-destroy.8.html), [copying](https://docs.oracle.com/cd/E19253-01/819-5461/gbcxz/index.html), and [configuring](https://openzfs.github.io/openzfs-docs/man/8/zfs-set.8.html) datasets:


##### :material-plus:{ .lg .middle } Create

```sh
zfs create tank/dataset
```

##### :material-view-list:{ .lg .middle } Display

```sh
# Datasets are not displayed recursively without -r
zfs list -r tank
```

##### :material-rename:{ .lg .middle } Rename

```sh
zfs rename tank pool
```

##### :material-wrench:{ .lg .middle } Configure

```sh
zfs set mountpoint=/mnt/tank tank
zfs set compression=on tank/dataset
zfs set sync=disabled tank/dataset
zfs set acme:disksource=vendorname  
```

##### :material-content-copy:{ .lg .middle } Copy

A dataset can be copied using [**zfs clone**](https://docs.oracle.com/cd/E19253-01/819-5461/gbcxz/index.html) (note that the source must be a snapshot).

```sh
zfs clone tank/dataset@snapshot tank/newdataset
```

##### :material-delete:{ .lg .middle } Remove

```sh
zfs remove pool/dataset
```
