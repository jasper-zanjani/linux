# Install GRUB as bootloader
grub-install --target=i386-pc /dev/sda

# Install boot images within a directory other than /boot
grub-install --boot-directory
