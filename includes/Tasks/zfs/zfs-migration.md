[Exporting a pool](https://docs.oracle.com/cd/E19253-01/819-5461/gazqr/index.html) using [**zpool export**](https://openzfs.github.io/openzfs-docs/man/8/zpool-export.8.html) takes it offline, allowing all disks to be removed for physical shipment.

[Importing a pool](https://docs.oracle.com/cd/E19253-01/819-5461/gazuf/index.html) is also straightforward.
Unless there is a name conflict, the name of the pool is all that is needed.
The UUID of the pool can be retrieved by inspecting member disks using lsblk. (1)
{ .annotate }

1. Note that for TrueNAS, a pool should be imported through the GUI, otherwise attempting to create network shares will produce [errors](https://www.truenas.com/community/threads/einval-sharingsmb_create-path_local-the-path-must-reside-within-a-pool-mount-point.107389/).

```sh
zpool export tank
zpool import tank
```

[**Migrating pools**](https://serverfault.com/questions/88638/moving-a-zfs-filesystem-from-one-pool-to-another) is done using snapshots as well, with the commands [**zfs send**](https://openzfs.github.io/openzfs-docs/man/8/zfs-send.8.html) and [**zfs receive**](https://openzfs.github.io/openzfs-docs/man/8/zfs-receive.8.html).
First a [snapshot](#snapshot-management) is taken, then:

```sh
# Use pv to monitor progress
zfs send -R source-tank@moving | pv | zfs receive -Fd receive-tank/ # (1)
```

1. Without **-d**, the recursive copy will be performed into the same destination [without recreating the dataset](https://ptribble.blogspot.com/2012/09/recursive-zfs-send-and-receive.html).