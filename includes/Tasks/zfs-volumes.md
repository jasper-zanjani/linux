A ZFS [**volume**](https://docs.oracle.com/cd/E19253-01/819-5461/gaypf/index.html) (or "zvol") is a [dataset](#dataset) that [represents](https://docs.oracle.com/cd/E18752_01/html/819-5461/gaypf.html) a block device.
They are created with the **-V** option and are represented as devices under **/dev/zvol**.

```sh
zfs create -V 5gb tank/vol

# Create a parent datasets, if they doesn't exist, with -p
zfs create -V '5gb' tank/vols/vol -p
```

A volume can be shared as an iSCSI target by setting the **shareiscsi** property on the volume.
