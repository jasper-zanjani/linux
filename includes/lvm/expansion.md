Disk expansion in LVM can be done by expanding the virtual hard disk itself or by adding a new virtual hard disk to the array.

<div class="grid cards" markdown>

-   **Resized physical disk**

    ---

    First [expand the virtual hard disk](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/expand-disks?tabs=ubuntu).


    ```sh
    # Expand the LVM physical volume
    pvresize /dev/sdh

    # Confirm
    vgs $VG

    # Expand LVM logical volume
    lvextend -l +100%FREE $VG/$LV
    ```

-   **Add new VHD**

    ---

    
    ```sh
    --8<-- "includes/lvm/expansion.sh"
    ```

</div>


Logical volumes can also be striped.

```sh
--8<-- "includes/lvm/expansion-striped.sh"
```

Finally, the filesystem must be extended.

```sh
# Confirm filesystem type
df -Th /dev/mapper/$VG-$LV

# XFS
xfs_growfs /dev/mapper/$VG-$LV

# EXT4
resize2fs /dev/mapper/$VG-$LV
```

