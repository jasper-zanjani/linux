# Overview

--8<-- "includes/Admonitions/LVM-Btrfs.md"


## MBR vs. GPT

Master Boot Record (MBR) partitioning has been used since 1983 when it was released with IBM PC-DOS 2.0.
GUID Partition Table (GPT) partitioning system was released by Intel in association with the Extensible Firmware Interface (EFI).
GPT sports many advantages over MBR:

- Disks and partitions larger than 2TiB supported, at greater numbers

## Tasks

<div class="grid cards" markdown>

-   #### Virtual disks

    ---

    ```sh title="Create virtual disks"
    # Create sparse file
    fallocate -l 100M /tmp/disk0    

    # Create loopback device
    losetup -f /tmp/disk0           
    ```

-   #### Formatting filesystems

    ---

    --8<-- "includes/Tasks/filesystems.md"

-   #### HDD serial numbers

    ---

    ```sh
    --8<-- "includes/Tasks/hdd-serial-numbers.sh"
    ```

-   #### LVM

    ---

    ```sh title="LVM"
    --8<-- "includes/Tasks/lvm.sh"
    ```

</div>

#### Arch installation
:   

    ```sh
    --8<-- "includes/Tasks/arch.sh"
    ```

## Commands

<div class="grid cards" markdown>

-   #### fallocate

    ---

    ```sh
    --8<-- "includes/Commands/f/fallocate.sh"
    ```

-   #### hdparm

    ---

    ```sh
    --8<-- "includes/Commands/h/hdparm.sh"
    ```

-   #### losetup

    ---

    ```sh
    --8<-- "includes/Commands/l/losetup.sh"
    ```

    #### lsblk

    ---

    ```sh
    --8<-- "includes/Commands/l/lsblk.sh"
    ```

    #### mount

    ---

    ```sh
    --8<-- "includes/Commands/m/mount.sh"
    ```

    #### shred

    ---

    ```sh
    --8<-- "includes/Commands/s/shred.sh"
    ```


-   #### sfdisk

    ---

    --8<-- "includes/Commands/s/sfdisk.md"


</div>

#### fdisk

```sh
--8<-- "includes/Commands/f/fdisk.sh"
```

## Configs

#### /etc/fstab
:   

    --8<-- "includes/Configs/fstab.md"
