vdo create --name=web_storage --device=/dev/xvdb --vdoLogicalSize=10G
vdostats --human-readable
mkfs.xfs -K /dev/mapper/web_storage
udevadm settle