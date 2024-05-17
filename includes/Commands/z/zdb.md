**zdb** can be used to display consistency and debugging information on pools. (1)
{ .annotate }

1. Note that on TrueNAS the cache path is different from that expected by zdb and the cache must be [explicitly specified](https://serverfault.com/questions/899814/zdb-doesn-t-recognize-my-pool) on every invocation.
```sh
zdb -U /data/zfs/zpool.cache $POOL
```

From https://forum.level1techs.com/t/zfs-metadata-special-device-z/159954
```sh
zdb -Lbbbs $POOL
```