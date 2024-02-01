# Enter the parted shell, selecting a specified device
parted /dev/sda 

# "Disk label" is the term for a partition table in parted documentation
mktable gpt # "msdos" for MBR 

# 200 MiB boot partition
mkpart boot 0 200 fat32

# Create a swap partition (conventionally 150% of RAM)
mkpart swap 200 12G linux-swap

# Create an EXT4 root partition occupying the rest of the disk
mkpart root 200 -1s ext4

mkpart primary linux-swap 211 15G # MBR

mkpart 