# Storage


```sh title="Create virtual disks"
# Create sparse file
fallocate -l 100M /tmp/disk0    

# Create loopback device
losetup -f /tmp/disk0           
```

--8<-- "includes/Tasks/filesystems.md"

Traditionally, filesystems are mounted using **/etc/fstab**, a whitespace-delimited config file.

Typical fstab entries have six columns, delimited by whitespace:

- **fs\_spec** describes the block special device. It can appear in any number of ways depending on the nature of the device
- **fs\_file** describes the mount point
- **fs\_vfstype** describes the type of filesystem
- **fs\_mntops** describes mount options
- **fs\_freq** is used by **dump** to determine which filesystems need to be dumped
- **fs\_passno** is used by **fsck** to determine the order in which filesystem checks are done at boot time

```sh title="/etc/fstab"
# NFS
--8<-- "includes/Configs/fstab-nfs"

# SMB
--8<-- "includes/Configs/fstab-smb"

# VDO
--8<-- "includes/Configs/fstab-vdo"

# Stratis
--8<-- "includes/Configs/fstab-stratis"

# btrfs
--8<-- "includes/Configs/fstab-btrfs"
```

## ZFS

--8<-- "includes/Tasks/zfs.md"

## Btrfs

--8<-- "includes/Tasks/btrfs.md"

## NFS

--8<-- "includes/Tasks/nfs.md"

## SMB

--8<-- "includes/Tasks/smb.md"


#### HDD serial numbers
:   

    ```sh
    --8<-- "includes/Tasks/hdd-serial-numbers.sh"
    ```

#### Autofs
:   
    **Auto File System** offers an alternative way of mounting NFS shares that can save some system resources, especially when many shares are mounted.
    Autofs can mount NFS shares dynamically, only when accessed.

    ```sh
    dnf install -y autofs
    systemctl enable --now autofs.service
    ```

    Mounts are defined in configs called **maps**.
    There are three map types:

    - **master** map is **/etc/auto.master** by default. This can be defined using the **master\_map\_name** directive in the main configuration at **/etc/autofs.conf**.
    - **direct** maps point to other files for mount details. They are notable for beginning with **/-**
    - **indirect** maps also point to other files for mount details but provide an umbrella mount point which will contain all other mounts within it. Note that other mountpoints at this parent directory cannot coexist with autofs mounts.


    Here is an example indirect map that will mount to /data/sales.

    ``` title="/etc/auto.master.d/data.autofs"
    /data /etc/auto.data
    ```

    ``` title="/etc/auto.data"
    sales -rw,soft 192.168.33.101:/data/sales
    ```

    Map files also support wildcards.
    ```
    * 127.0.0.1:/home/&
    ```

#### LVM
:   

    ```sh title="LVM"
    --8<-- "includes/Tasks/lvm.sh"
    ```

#### VDO
:   
    **Virtual disk optimizer (VDO)** is a kernel module introduced in RHEL 7.5 that provides data deduplication and compression on block devices.

    The physical storage of a VDO volume is divided into a number of **slabs**, which are contiguous regions of the physical space. 
    All slabs for a given volume have the same size, which can be any power of 2 multiple of 128 MB up to 32 GB (2 GB by default).
    The maximum number of slabs is 8,192.
    The maximum physical storage of the VDO is provided to the user on creation.

    Like LVM volumes, VDO volumes appear under **/dev/mapper**

    VDO appears not to be installed by default, but it is available in the BaseOS repo.
    ```sh
    dnf install vdo
    systemctl enable --now vdo
    ```

    ```sh title="Create a VDO volume"
    --8<-- "includes/Tasks/vdo.sh"
    ```

    ```sh title="/etc/fstab"
    --8<-- "includes/Configs/fstab-vdo"
    ```

#### Stratis
:   
    Stratis is an open-source managed pooled storage solution in the vein of ZFS or btrfs.

    Stratis block devices can be disks, partitions, LUKS-encrypted volumes, LVM logical volumes, or DM multipath devices.
    Stratis pools are mounted under **/stratis** and, like other pooled storage systems, support multiple filesystems.
    Stratis file systems are thinly provisioned and formatted with **xfs**, although vanilla xfs utilities cannot be used on Stratis file systems.

    ```sh
    --8<-- "includes/Tasks/stratis-install.sh"
    ```

    ```sh title="Pool management"
    --8<-- "includes/Tasks/stratis-pool.sh"
    ```

    ```fstab title="/etc/fstab"
    --8<-- "includes/Configs/fstab-stratis"
    ```

    ```sh title="Snapshot management"
    --8<-- "includes/Tasks/stratis-snapshot.sh"
    ```


## Glossary

--8<-- "includes/storage-defs.md"

## Commands

#### blkid
:   
    --8<-- "includes/Commands/blkid.md"

#### btrfs
:   
    --8<-- "includes/Commands/btrfs.md"

#### fallocate
:   
    --8<-- "includes/Commands/fallocate.md"

#### filefrag
:   
    --8<-- "includes/Commands/filefrag.md"

#### hdparm
:   
    --8<-- "includes/Commands/hdparm.md"

#### losetup
:   
    --8<-- "includes/Commands/losetup.md"

#### lsblk
:   
    --8<-- "includes/Commands/lsblk.md"

#### sfdisk
:   
    --8<-- "includes/Commands/sfdisk.md"

#### shred
:   
    --8<-- "includes/Commands/shred.md"

#### wipefs
:   
    --8<-- "includes/Commands/wipefs.md"

#### mount
:   
    --8<-- "includes/Commands/mount.sh"

### LVM

--8<-- "includes/Commands/lvm.md"
