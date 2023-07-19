stratis pool create pool /dev/sd{a,b,c}

# An error about the devices being "owned" can be resolved by wiping it.
wipefs -a /dev/sda

# Display block devices managed by Stratis, equivalent to
#   pvs
stratis blockdev

# Create filesystem
stratis fs create pool files

# Confirm
stratis fs

# Expand pool, equivalent to 
#   zpool add pool /dev/sdd
stratis pool add-data pool /dev/sdd