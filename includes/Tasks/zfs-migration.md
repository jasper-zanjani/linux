[Migrating pools](https://serverfault.com/questions/88638/moving-a-zfs-filesystem-from-one-pool-to-another) is done using snapshots as well, with the commands [**zfs send**](https://openzfs.github.io/openzfs-docs/man/8/zfs-send.8.html) and [**zfs receive**](https://openzfs.github.io/openzfs-docs/man/8/zfs-receive.8.html).
First a [snapshot](#snapshot-management) is taken, then:

```sh
# Use pv to monitor progress
zfs send -R source-tank@moving | pv | zfs receive -Fd receive-tank/ # (1)
```

1. Without **-d**, the recursive copy will be performed into the same destination [without recreating the dataset](https://ptribble.blogspot.com/2012/09/recursive-zfs-send-and-receive.html).