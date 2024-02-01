ZFS is a technology that combines the functions of a 128-bit CoW filesystem, a volume manager, and software RAID.
Like RAID, ZFS attempts to achieve data reliability by abstracting volumes over physical devices. 
But ZFS improves on RAID in a variety of ways:

- ZFS achieves error handling by using checksum information to correct corrupted files.
This is unlike hardware RAID mirrors, where failures occur silently and are typically only detected upon reading a corrupt file.
- ZFS writes use CoW meaning they are atomic and aren't affected by issues like **RAID holes**, a condition in which a stripe is only partially written before the system crashes, making the array inconsistent and corrupt after a restart
- ZFS can also transparently compress and encrypt data written to datasets.

A disadvantage of ZFS is that it is too tightly bound to the operation of the kernel to operate in true userspace, and that is why each implementation is different for operating systems.
**ZFS on Linux (ZOL)** is considered the ugly stepchild of the ZFS community despite the fact that the Linux implementation has the most features and community support.

The largest structure in the ZFS taxonomy is the [**pool**](https://docs.oracle.com/cd/E36784_01/html/E36835/ftyue.html#pool) or **zpool**{: #zpool }, an independent collection of one or more logical devices which provide space for filesystems (equivalent to a logical volume in LVM).
Virtual devices or **vdevs** constitute a pool and are an abstraction of one or more storage devices (equivalent to volume groups in LVM).

Vdevs support one of five **topologies**:

- Single-device vdevs cannot survive any failure
- Mirror vdevs duplicate every block on each of their devices
- RAIDz1, RAIDz2, or RAIDz3 provide one, two, or three parity blocks for each stripe. The minimum number of disks is always one more than the number of parity devices.

Writes are distributed across available vdevs in accordance with their available free space, such that they fill more or less evenly over time.
In ZFS parlance these pieces of data are called **stripes**.

Special **support classes** of vdev such as spare, cache, log, and special represent vdevs that are dedicated to specialized tasks to enhance performance and reliabilities of the pool.

??? info "Resources"

    - [ZFS for Newbies EuroBSDcon 2019 talk by Dan Langille](https://www.youtube.com/watch?v=3oG-1U5AI9A)

## Tasks

#### Installation
:   

    --8<-- "includes/Tasks/zfs-install.md"

#### Pool management
:   

    --8<-- "includes/Tasks/zfs-pools.md"

#### Device management
:   

    --8<-- "includes/Tasks/zfs-devices.md"

#### Dataset management
:   

    --8<-- "includes/Tasks/zfs-datasets.md"

#### Volume management
:   

    --8<-- "includes/Tasks/zfs-volumes.md"

#### Snapshot management
:   

    --8<-- "includes/Tasks/zfs-snapshots.md"

#### Migration
:   

    --8<-- "includes/Tasks/zfs-migration.md"

#### IAM
:   

    --8<-- "includes/Tasks/zfs-iam.md

#### zdb
:   

    --8<-- "includes/Commands/z/zdb.md"