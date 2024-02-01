# Manage kernel VDO devices and related configuration information.
vdo create --name=storage --device=/dev/xvdb --vdoLogicalSize=10G

# Display configuration and statistics of VDO volumes
vdostats --human-readable