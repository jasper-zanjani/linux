pvcreate /dev/vd{b,c,d}
vgcreate group /dev/vd{b,c,d}

# Use all free space
lvcreate -l 100%FREE -n volume group # --extents, --name