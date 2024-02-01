Script-based partition table editor, similar to [**fdisk**](#fdisk) and [**gdisk**](#gdisk), which can be run interactively. 

```sh
# Display size of a partition or disk (in sectors only)
sfdisk -s /dev/sda1

# Apply consistency checks to partition or disk
sfdisk -V $PARTITION
sfdisk --verify $DEVICE

# Create a partition
sfdisk $DEVICE
```