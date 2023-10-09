A variety of ZFS topologies can be [created](https://docs.oracle.com/cd/E36784_01/html/E36835/gaynr.html) on a single line by passing subcommands and arguments to [**zpool create**](https://openzfs.github.io/openzfs-docs/man/8/zpool-create.8.html).

```sh
# Three-wide mirror
zpool create tank mirror /dev/sd{a,b} # (1)

# Two two-wide mirrors
zpool create tank mirror /dev/sd{a,b} mirror /dev/sd{c,d}

# Raidz
zpool create tank raidz /dev/sd{a,b,c}

# Setting a property at creation with -o
zpool create tank mirror /dev/sd{a,b} -o compression=lz4
```

1. Zpools, or pools for short, are conventionally named "tank" in documentation.

Additional **vdevs**{: #vdev } ("virtual device") can be added to existing pools using **zpool add** using identical syntax.

```sh
zpool add tank mirror /dev/sd{e,f}
```



Pools are most commonly displayed using [**zpool status**](https://openzfs.github.io/openzfs-docs/man/8/zpool-status.8.html).
Depending on the installation, by default disks are identified by UUID or block device name.

```sh
zpool status tank -g # GUIDs
zpool status tank -L # Block device names
zpool list -v

# Destroy pool
zpool destroy tank
```

[Exporting a pool](https://docs.oracle.com/cd/E19253-01/819-5461/gazqr/index.html) using [**zpool export**](https://openzfs.github.io/openzfs-docs/man/8/zpool-export.8.html) takes it offline, allowing all disks to be removed.

[Importing a pool](https://docs.oracle.com/cd/E19253-01/819-5461/gazuf/index.html) is also straightforward.
Unless there is a name conflict, the name of the pool is all that is needed.
The UUID of the pool can be retrieved by inspecting member disks using lsblk.

```sh
zpool export tank
zpool import tank
```

Note that for TrueNAS, a pool should be imported through the GUI, otherwise attempting to create network shares will produce [errors](https://www.truenas.com/community/threads/einval-sharingsmb_create-path_local-the-path-must-reside-within-a-pool-mount-point.107389/).

