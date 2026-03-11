# Verify LUN of added volume
ll /dev/disk/azure/scsi1

# Create physical volume
pvcreate $PV

# Add physical volume to volume group
vgextend $VG $PV

# Resize logical volume to take all free space on volume group
lvextend -l +100%FREE $VG/$LV
