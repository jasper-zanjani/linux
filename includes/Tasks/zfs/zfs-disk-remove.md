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
