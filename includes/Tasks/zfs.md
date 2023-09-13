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

#### Installation
:   
    On [Arch](https://openzfs.github.io/openzfs-docs/Getting%20Started/Arch%20Linux/index.html), the **zfs-linux** package must be installed from the [**archzfs**](https://github.com/archzfs/archzfs) repo.

    ```ini title="/etc/pacman.conf"
    --8<-- "includes/Configs/archzfs.cfg
    ```

    ```sh
    # Install ZFS
    pacman -S zfs-linux
    ```

    On [Fedora](https://openzfs.github.io/openzfs-docs/Getting%20Started/Fedora/index.html), the **zfs** package must be installed from the ZFS repo.

    ```sh
    dnf install -y https://zfsonlinux.org/fedora/zfs-release-2-3$(rpm --eval "%{dist}").noarch.rpm

    # Install kernel headers
    dnf install -y kernel-devel

    # Install ZFS
    dnf install -y zfs
    ```


#### [Pool](#zpool) creation
:   
    A variety of ZFS topologies can be [created](https://docs.oracle.com/cd/E36784_01/html/E36835/gaynr.html) on a single line by passing subcommands and arguments to [**zpool create**](https://openzfs.github.io/openzfs-docs/man/8/zpool-create.8.html).
   
    ```sh
    # Three-wide mirror
    zpool create tank mirror /dev/sd{a,b} # (1)

    # Two two-wide mirrors
    zpool create tank mirror /dev/sd{a,b} mirror /dev/sd{c,d}

    # Raidz
    zpool create tank raidz /dev/sd{a,b,c}
    
    # Setting a property at creation with -o
    zpool create tank mirror /dev/sd{a,b} -o compression=lz4
    ```

    1. Zpools, or pools for short, are conventionally named "tank" in documentation.

    Additional **vdevs**{: #vdev } ("virtual device") can be added to existing pools using **zpool add** using identical syntax.

    ```sh
    zpool add tank mirror /dev/sd{e,f}
    ```



    Pools are most commonly displayed using [**zpool status**](https://openzfs.github.io/openzfs-docs/man/8/zpool-status.8.html).
    Depending on the installation, by default disks are identified by UUID or block device name.

    ```sh
    zpool status tank -g # GUIDs
    zpool status tank -L # Block device names
    zpool list -v

    # Destroy pool
    zpool destroy tank
    ```


#### Removing devices
:   
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


#### Disk replacement
:   

    ```sh title="Replace disk"
    # Clear errors first
    zpool clear tank

    # Take disk offline
    zpool offline tank sdb

    # Replace disk physically
    
    # Begin the resilvering process
    zpool replace tank sdb sdc

    # Monitor resilvering process
    watch zpool status tank
    ```

    If a disk has gone bad, it must first be taken offline using [**zpool offline**](https://openzfs.github.io/openzfs-docs/man/8/zpool-offline.8.html) before physically replacing it.
    Failing to do this will produce errors.

    Sometimes the UUID must be provided to take a disk offline.
    This can be retrieved using [**blkid**](#blkid).

    ```sh
    blkid /dev/sdb2
    zpool offline $UUID
    ```

    Then [**zpool replace**](https://openzfs.github.io/openzfs-docs/man/8/zpool-replace.8.html) initiates the process of rebuilding redundant groups, or **resilvering**.

    [Replacing](https://docs.oracle.com/cd/E19253-01/819-5461/gazgd/index.html) a used disk with one that is unused (without physical replacement) similarly uses [**zpool replace**](https://openzfs.github.io/openzfs-docs/man/8/zpool-replace.8.html).

    Ongoing resilvers can be cancelled using [**zpool detach**](https://openzfs.github.io/openzfs-docs/man/8/zpool-detach.8.html):

    ```sh
    zpool detach tank sdc
    ```

    When simply moving a disk's physical location (from one bay to another), it must also be taken offline.

    ```sh
    zpool offline tank sdb
    # Move disk physically
    zpool online tank sdb
    ```

    [Exporting a pool](https://docs.oracle.com/cd/E19253-01/819-5461/gazqr/index.html) using [**zpool export**](https://openzfs.github.io/openzfs-docs/man/8/zpool-export.8.html) takes it offline, allowing all disks to be removed.

    [Importing a pool](https://docs.oracle.com/cd/E19253-01/819-5461/gazuf/index.html) is also straightforward.
    Unless there is a name conflict, the name of the pool is all that is needed.
    The UUID of the pool can be retrieved by inspecting member disks using lsblk.

    ```sh
    zpool export tank
    zpool import tank
    ```

    Note that for TrueNAS, a pool should be imported through the GUI, otherwise attempting to create network shares will produce [errors](https://www.truenas.com/community/threads/einval-sharingsmb_create-path_local-the-path-must-reside-within-a-pool-mount-point.107389/).


#### Dataset management
:   
    A **dataset**{: #dataset } in ZFS is equivalent to the [btrfs](#btrfs) [**subvolume**](#subvolume), defined as an independently mountable POSIX filetree.
    Commands under [**zfs**](https://openzfs.github.io/openzfs-docs/man/8/zfs.8.html) exist for [displaying](https://openzfs.github.io/openzfs-docs/man/8/zfs-list.8.html), [creating](https://openzfs.github.io/openzfs-docs/man/8/zfs-create.8.html), [renaming](https://openzfs.github.io/openzfs-docs/man/8/zfs-rename.8.html), and [destroying](https://openzfs.github.io/openzfs-docs/man/8/zfs-destroy.8.html) datasets:

    ```sh title="Create dataset"
    zfs create tank/dataset
    
    # Datasets are not displayed recursively without -r
    zfs list -r tank

    zfs rename tank pool
    
    zfs remove pool/dataset
    ```

    Dataset properties can be changed with [**zfs set**](https://openzfs.github.io/openzfs-docs/man/8/zfs-set.8.html):

    ```sh title="Configure dataset"
    zfs set mountpoint=/mnt/tank tank
    zfs set compression=on tank/dataset
    zfs set sync=disabled tank/dataset
    zfs set acme:disksource=vendorname  
    ```

#### Volume management
:   
    A ZFS [**volume**](https://docs.oracle.com/cd/E19253-01/819-5461/gaypf/index.html) (or "zvol") is a [dataset](#dataset) that [represents](https://docs.oracle.com/cd/E18752_01/html/819-5461/gaypf.html) a block device.
    They are created with the **-V** option and are represented as devices under **/dev/zvol**.

    ```sh
    zfs create -V 5gb tank/vol

    # Create a parent datasets, if they doesn't exist, with -p
    zfs create -V '5gb' tank/vols/vol -p
    ```

    A volume can be shared as an iSCSI target by setting the **shareiscsi** property on the volume.


#### Snapshot management
:   
    [**Snapshots**](https://docs.oracle.com/cd/E19253-01/819-5461/gbciq/index.html) are read-only copies of file systems or volumes.
    They are managed using subcommands under [**zfs snapshot**](https://openzfs.github.io/openzfs-docs/man/8/zfs-snapshot.8.html) and appear as directories at the root of the file system of every dataset under **.zfs/snapshot**.

    ```sh title="Snapshot management"
    --8<-- "includes/Commands/zfs-snapshot.sh"
    ```


#### Migration
:   
    [Migrating pools](https://serverfault.com/questions/88638/moving-a-zfs-filesystem-from-one-pool-to-another) is done using snapshots as well, with the commands [**zfs send**](https://openzfs.github.io/openzfs-docs/man/8/zfs-send.8.html) and [**zfs receive**](https://openzfs.github.io/openzfs-docs/man/8/zfs-receive.8.html).
    First a [snapshot](#snapshot-management) is taken, then:

    ```sh
    # Use pv to monitor progress
    zfs send -R source-tank@moving | pv | zfs receive -Fd receive-tank/ # (1)
    ```

    1. Without **-d**, the recursive copy will be performed into the same destination [without recreating the dataset](https://ptribble.blogspot.com/2012/09/recursive-zfs-send-and-receive.html).

#### IAM
:   
    [Allow an unprivileged user to create snapshots of his home directory only](https://www.youtube.com/watch?v=qXOZmDoy2Co&list=WL&index=11&t=775s)

    ```sh
    zfs allow -u lucas snapshot,rollback zroot/usr/home/lucas
    ```

#### zdb
:   
    **zdb** can be used to display consistency and debugging information on pools.

    ??? info "TrueNAS"

        Note that on TrueNAS the cache path is different from that expected by zdb and the cache must be [explicitly specified](https://serverfault.com/questions/899814/zdb-doesn-t-recognize-my-pool) on every invocation.

        ```sh
        zdb -U /data/zfs/zpool.cache $POOL
        ```