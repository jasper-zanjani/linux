# Partition the disk


# Format EFI partition
mkfs.vfat -n efi /dev/sda1

# Format boot partition
mkfs.fat -F 32 -n boot /dev/sda2

# Format root partition
mkfs.ext4 -L root /dev/sda4

# Format swap partition and begin swapping on it
mkswap /dev/sda3
swapon /dev/sda3

# Output will confirm that filesystems have been created on the partitions
lsblk -f /dev/sda

mount --mkdir /dev/sda1 /mnt/efi
mount --mkdir /dev/sda4 /mnt
mount --mkdir /dev/sda2 /mnt/boot

pacstrap -K /mnt base base-devel linux linux-firmware vim grub efibootmgr

# Generate fstab file
genfstab -U /mnt >> /mnt/etc/fstab

# Change root into system
arch-chroot /mnt

# Timezone
ln -sf /usr/share/zoneinfo/US/Eastern /etc/localtime

# Localization
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

# Typical tweaks
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=us" > /etc/vconsole.conf
echo "arch" > /etc/hostname

# Set root password
passwd

# Install Network Manager, although the service itself is not running yet.

# Install GRUB
# UEFI
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB

# BIOS
# Note that the target is the drive itself: /dev/sda1 would not work.
grub-install --target=i386-pc /dev/sda
