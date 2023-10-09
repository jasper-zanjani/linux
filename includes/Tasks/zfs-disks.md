```sh title="Replace disk"
# Clear errors first
zpool clear tank

# Take disk offline
zpool offline tank sdb

# Replace disk physically

# Begin the resilvering process
zpool replace tank sdb sdc

# Monitor resilvering process
watch zpool status tank
```

If a disk has gone bad, it must first be taken offline using [**zpool offline**](https://openzfs.github.io/openzfs-docs/man/8/zpool-offline.8.html) before physically replacing it.
Failing to do this will produce errors.

Sometimes the UUID must be provided to take a disk offline.
This can be retrieved using [**blkid**](#blkid).

```sh
blkid /dev/sdb2
zpool offline $UUID
```

Then [**zpool replace**](https://openzfs.github.io/openzfs-docs/man/8/zpool-replace.8.html) initiates the process of rebuilding redundant groups, or **resilvering**.

[Replacing](https://docs.oracle.com/cd/E19253-01/819-5461/gazgd/index.html) a used disk with one that is unused (without physical replacement) similarly uses [**zpool replace**](https://openzfs.github.io/openzfs-docs/man/8/zpool-replace.8.html).

Ongoing resilvers can be cancelled using [**zpool detach**](https://openzfs.github.io/openzfs-docs/man/8/zpool-detach.8.html):

```sh
zpool detach tank sdc
```

When simply moving a disk's physical location (from one bay to another), it must also be taken offline, but no other configuration is necessary before bringing it back online.

```sh
zpool offline tank sdb
# Move disk physically
zpool online tank sdb
```

[**zpool remove**](https://openzfs.github.io/openzfs-docs/man/8/zpool-remove.8.html) is used to remove spare, cache, log and top-level data devices that are **not** raidz (top-level raidz vdevs cannot be removed).

```sh
# Hot spares
zpool add tank spare sdg
zpool remove tank sdg

# When incorrectly adding a device to a pool
zpool add tank sdh
zpool remove sdh
zpool add tank mirror sdh
```

Alternatively, [**zpool detach**](https://openzfs.github.io/openzfs-docs/man/8/zpool-detach.8.html) is used exclusively to remove a mirrored data device.

```sh title="Mirrored arrays"
zpool add tank mirror sde sdf
zpool detach sdb
```

