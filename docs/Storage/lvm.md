# LVM

```sh title="lvresize"
# Add 10 gigabytes to logical volume
lvresize -L +10G /dev/vg1/Marketing

# Resize logical volume to take all space on the volume group
lvresize -l 100%VG cs/root
```

<div class="grid cards" markdown>

```sh title="lvm"
lvm version
```

```sh title="pvcreate"
pvcreate /dev/sd{a,b,c}
pvcreate /dev/loop0
```


</div>
