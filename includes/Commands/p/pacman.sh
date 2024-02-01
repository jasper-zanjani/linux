# Display detailed information on a package
pacman -Qi $PACKAGE 
#      --query --info

# Install package
pacman -S $PACKAGE 
#      --sync

# Remove $PACKAGE
pacman -R $PACKAGE 
#      --remove

# Downgrade a package (here, the Linux kernel)
pacman -U https://archive.archlinux.org/packages/l/linux/linux-6.4.12.arch1-1-x86_64.pkg.tar.zst