# Enter the fdisk shell, selecting a specified device
fdisk /dev/sda

g   # Create a new GPT partition table

# Create a new 200 MiB boot partition
n   # New partition
    # Enter to accept default first sector
+200M # Define 200 MiB size
t   # Change partition type
142 # BC13C2FF-59E6-4262-A352-B275FD6F7172

# Create a root partition occupying the rest of the disk
n


t
23  # Linux root for x86_64 4F68BCE3-E8CD-4DB1-96E7-FBCAF984B709



o   # Create a new MBR partition table

# Create a 200 MiB boot partition
n   # New partition
p   # Primary partition
    # Enter to accept default first sector
+200M # Define 200 MiB size
t   # Change partition type
    # Enter to accept default selection (the partition just created)
0b  # Provide hex code for "W95 FAT32"

a   # Make partition 1 bootable

n   # Create a new partition to take up the rest of the drive.
    # The default partition type is 83 Linux (EXT4).
