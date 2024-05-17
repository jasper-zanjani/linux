[**Snapshots**](https://docs.oracle.com/cd/E19253-01/819-5461/gbciq/index.html) are read-only copies of file systems or volumes.
They are managed using subcommands under [**zfs snapshot**](https://openzfs.github.io/openzfs-docs/man/8/zfs-snapshot.8.html) and appear as directories at the root of the file system of every dataset under **.zfs/snapshot**.

##### :material-plus:{ .lg .middle } Create

```sh
zfs snapshot tank@snapshot1

# Recursive
zfs snapshot -r tank@now
```

##### :material-skip-backward:{ .lg .middle } Revert

```sh
zfs rollback tank@snapshot1
```

##### :material-view-list:{ .lg .middle } Display

```sh
zfs list -t snapshot
```

##### :material-delete:{ .lg .middle } Remove

```sh
zfs destroy tank@snapshot1
```