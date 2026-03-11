```sh
--8<-- "includes/lvm/expansion.sh"
```

Logical volumes can also be striped. (1)
{: .annotate }

1.  

    ```sh
    --8<-- "includes/lvm/expansion-striped.sh"
    ```

Extend filesystem

```sh
# Confirm filesystem type
df -Th /dev/mapper/$VG-$LV

# XFS
xfs_growfs /dev/mapper/$VG-$LV

# EXT4
resize2fs /dev/mapper/$VG-$LV
```

