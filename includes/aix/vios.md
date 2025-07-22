[VIOS commands](https://www.ibm.com/docs/en/power7?topic=commands-alphabetical-list)


```sh title="VIOS"
# Display mapping of physical and virtual cards for all logical partitions
lsmap -all

# Map virtual fibre channel adapter to physical fibre channel port
vfcmap

# Display volume groups
lsvg

# Inspect a given volume group
lsvg -lv datavg

# Display logical volume
lslv s2-lpar1

# Create the virtual media repository
mkrep

# Display repositories
lsrep
```

```sh
powermt display dev=all
lsdev -C
odmget -q 'name=$DISK' CuDv
```
