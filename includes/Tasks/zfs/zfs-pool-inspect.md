Pools are most commonly displayed using [**zpool status**](https://openzfs.github.io/openzfs-docs/man/8/zpool-status.8.html).
Depending on the installation, by default disks are identified by UUID or block device name.

```sh
zpool status tank -g # GUIDs
zpool status tank -L # Block device names
zpool list -v

# Destroy pool
zpool destroy tank
```
