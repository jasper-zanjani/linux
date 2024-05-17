If a disk has gone bad, it must first be taken offline using [**zpool offline**](https://openzfs.github.io/openzfs-docs/man/8/zpool-offline.8.html) before physically replacing it.
Failing to do this will produce errors.


```sh
# Clear errors first
zpool clear tank

# Take disk offline
zpool offline tank sdb # (1)
```

1. 
Sometimes the UUID must be provided to take a disk offline.
```sh
# Display UUID
blkid /dev/sdb2

# Take disk offline using UUID
zpool offline $UUID
```

The disk is then replaced physically before using [**zpool replace**](https://openzfs.github.io/openzfs-docs/man/8/zpool-replace.8.html) to initiate the process of **resilvering**, which rebuilds redundant groups.

```sh
# Begin the resilvering process
zpool replace tank sdb sdc

# Monitor resilvering process
watch zpool status tank
```

[Replacing](https://docs.oracle.com/cd/E19253-01/819-5461/gazgd/index.html) a used disk with one that is unused (without physical replacement) similarly uses [**zpool replace**](https://openzfs.github.io/openzfs-docs/man/8/zpool-replace.8.html).

Ongoing resilvers can be cancelled using [**zpool detach**](https://openzfs.github.io/openzfs-docs/man/8/zpool-detach.8.html):

```sh
zpool detach tank sdc
```

