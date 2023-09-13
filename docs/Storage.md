# Storage

--8<-- "includes/Admonitions/LVM-Btrfs.md"

```sh title="Create virtual disks"
# Create sparse file
fallocate -l 100M /tmp/disk0    

# Create loopback device
losetup -f /tmp/disk0           
```

--8<-- "includes/Tasks/filesystems.md"


## NFS

--8<-- "includes/Tasks/nfs.md"

## ZFS

--8<-- "includes/Tasks/zfs.md"

## LVM

--8<-- "includes/Commands/lvm.md"


## Btrfs

--8<-- "includes/Tasks/btrfs.md"

## SMB

--8<-- "includes/Tasks/smb.md"


#### HDD serial numbers
:   

    ```sh
    --8<-- "includes/Tasks/hdd-serial-numbers.sh"
    ```

#### Autofs
:   
    --8<-- "includes/Applications/autofs.md"

#### LVM
:   

    ```sh title="LVM"
    --8<-- "includes/Tasks/lvm.sh"
    ```

#### VDO
:   
    --8<-- "includes/Applications/vdo.md"

#### Stratis
:   
    --8<-- "includes/Applications/stratis.md"


## Commands

#### fallocate
:   

    ```sh
    --8<-- "includes/Commands/fallocate.sh"
    ```

#### fdisk
:   

    ```sh
    --8<-- "includes/Commands/fdisk.sh"
    ```

#### hdparm
:   

    ```sh
    --8<-- "includes/Commands/hdparm.sh"
    ```

#### losetup
:   

    ```sh
    --8<-- "includes/Commands/losetup.sh"
    ```

#### lsblk
:   

    ```sh
    --8<-- "includes/Commands/lsblk.sh"
    ```

#### sfdisk
:   
    --8<-- "includes/Commands/sfdisk.md"

#### shred
:   

    ```sh
    --8<-- "includes/Commands/shred.sh"
    ```

#### mount
:   

    ```sh
    --8<-- "includes/Commands/mount.sh"
    ```


## Configs

#### /etc/fstab
:   
    --8<-- "includes/Configs/fstab.md"
