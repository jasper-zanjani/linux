# Display information about sda and all its partiitions
wipefs /dev/sda*

# Erase all available signatures of device and partitions
sudo wipefs --all /dev/sda*