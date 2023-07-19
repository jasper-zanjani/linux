Oracle's **Btrfs** "B-tree file system" aimed to repeat ZFS's advances during a period when it seemed that licensing challenges would prevent ZFS from becoming available on Linux.
It was incorporated into the Linux kernel in 2009 but is still under active development.

Several key differences in capabilities between Btrfs and ZFS:

- Topologies can be changed much more easily
- Btrfs uses less RAM
- Btrfs does not have the ability to allocate specific devices as caches
- As of 2017, Btrfs implementations of parity raid are not yet ready for production use

??? info "Resources"

    Unlike ZFS which has a lot of material in written and video form for potential users to learn from, BtrFS appears not to have much available.
    BtrFS does have an [official wiki](https://btrfs.wiki.kernel.org/index.php/Glossary), but written articles on FOSS blogs focus on operation from the command-line but don't do a good job of describing the taxonomy of concepts, aside from the [glossary](https://btrfs.wiki.kernel.org/index.php/Glossary).

    Users of ZFS, in contrast, have taken the trouble to create introductory material, including Ars Technica's [ZFS 101](https://arstechnica.com/information-technology/2020/05/zfs-101-understanding-zfs-storage-and-performance/) article, and many talks by enthusiasts like [Philip Paeps](https://youtu.be/Hjpqa_kjCOI).

    This might be because btrfs's concepts seem less well thought-out, or at least more poorly described.
    For example, the term [subvolume](#subvolume) is used in btrfs but the container for subvolumes is not "volume" but rather "top-level subvolume".

    Jim Salter from Ars Technica (who wrote the ZFS 101 article above) appears to have devoted some effort to fleshing out the topic:

    - [Examining btrfs, Linux's perpetually half-finished filesystem](https://arstechnica.com/gadgets/2021/09/examining-btrfs-linuxs-perpetually-half-finished-filesystem/)



    - [Install and configure Samba server](https://vitux.com/how-to-install-and-configure-samba-on-ubuntu/)
    - [Install Samba4 on RHEL 8 for File Sharing on Windows](https://www.tecmint.com/install-samba-on-rhel-8-for-file-sharing-on-windows/)
    - [FreeNAS 11.3 - How to Set Up Windows SMB Shares](https://youtu.be/mCfX4sqDmzs)
    - [BtrFS](http://rkeene.org/projects/info/wiki/btrfs)
    - [Creating and Destroying ZFS Storage Pools](https://docs.oracle.com/cd/E19253-01/819-5461/6n7ht6quu/index.html)
    - [Managing devices in ZFS storage pools](https://docs.oracle.com/cd/E19253-01/819-5461/gayrd/index.html)
    - [Getting started with btrfs for Linux](https://opensource.com/article/20/11/btrfs-linux)
    - [Understanding Linux filesystems: ext4 and beyond](https://opensource.com/article/18/4/ext4-filesystem)

#### Pool management
:   

    ```sh title="Create a storage pool"
    mkfs.btrfs --data raid0 /dev/sd{a,b,c} # (1)
    ```

    1. Valid arguments to **-d**/**--data** include raid0, raid1, raid1c3, raid1c4, raid5, raid6, raid10, single, or dup.

    ```sh title="Add device"
    btrfs device add /dev/sde /data
    btrfs filesystem balance /data
    ```

    ```sh title="Remove device"
    btrfs device delete /dev/sdb /data
    btrfs filesystem balance /data
    ```

    ```sh title="Replace device"
    btrfs device add /dev/sdc /data
    btrfs device delete /dev/sdb /data
    btrfs filesystem balance /data
    ```


#### Filesystem management
:   
    Filesystems in btrfs are equivalent to ZFS datasets except that filesystems can be divided into "subvolumes".

    ```sh title="Display subvolumes"
    # Subvolume names begin with **@**.
    btrfs subvolume list /
    ```

    Subvolumes can be mounted to separate mountpoints, even though they specify the same filesystem, using the **subvol** directive.
    
    ```fstab
    UUID=5530f7df-65b7-4fd5-8757-0e69aad14f75 /              btrfs   subvol=/@,defaults,noatime,autodefrag,compress=zstd,discard=async,ssd 0 0
    UUID=5530f7df-65b7-4fd5-8757-0e69aad14f75 /home          btrfs   subvol=/@home,defaults,noatime,autodefrag,compress=zstd,discard=async,ssd 0 0
    ```

    ```sh title="Rename filesystem"
    btrfs filesystem label / tank
    
    # Verify
    btrfs filesystem show
    blkid
    ```

    ```sh title="Measure free space"
    btrfs filesystem df /

    # Show storage consumed, including how much is shared by all snapshots
    btrfs fi du /home -s
    ```

#### Snapshots
:   
    In btrfs, you can take snapshots of btrfs subvolumes only, and the snapshots are subvolumes themselves.
    In fact, by [definition](https://btrfs.wiki.kernel.org/index.php/SysadminGuide#Snapshots) a btrfs snapshot is simply a subvolume that shares its data and metadata with some other subvolume using btrfs's CoW capabilities.

    ```sh
    btrfs subvolume list /
    ```

    These are stored in the **.snapshots** directory at the root of the subvolume as numbered subdirectories.
    Restoring from these snapshots can be done with simple file tools like **rsync**.

    ```sh
    rsync -avz /.snapshots/141/snapshot/$PATH $PATH
    ```
    
    Snapshots are read-only by default, but can also be writable.
    Snapshots can be investigated:

    ```sh
    btrfs subvolume show /.snapshots/141/snapshot
    ```

    ```sh title="Delete snapshot"
    btrfs subvolume delete /.snapshots/141/snapshot
    ```
