When simply moving a disk's physical location (from one bay to another), it must also be taken offline, but no other configuration is necessary before bringing it back online.

```sh
# Take disk offline
zpool offline tank sdb

# Move disk physically

# Bring disk back online
zpool online tank sdb
```