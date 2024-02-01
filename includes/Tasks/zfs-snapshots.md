[**Snapshots**](https://docs.oracle.com/cd/E19253-01/819-5461/gbciq/index.html) are read-only copies of file systems or volumes.
They are managed using subcommands under [**zfs snapshot**](https://openzfs.github.io/openzfs-docs/man/8/zfs-snapshot.8.html) and appear as directories at the root of the file system of every dataset under **.zfs/snapshot**.

```sh title="Snapshot management"
--8<-- "includes/Commands/z/zfs-snapshot.sh"
```