# Alpine

**Alpine** Linux is notable for not using systemd, but rather openrc as an init system.

There are three different **disk modes**:

- **Diskless**: the entire OS is copied into, and run strictly from, RAM. This mode is used in the live environment, but it can also be specified for the installation.
- **Data** disk mode also runs from RAM, lending it the same performance benefits as diskless, but swap storage and /var are mounted from persistent storage.
- **System (sys)** disk mode is a traditional hard-disk install.



## Install Fedora on with ZFS on root

```sh
# Interactively setup network
setup-interfaces -r

# Interactively setup SSH
setup-sshd

# Configure NTP client
setup-ntp busybox

# Setup DNS
echo "nameserver 192.168.0.1" > /etc/resolv.conf

# Setup apk-repo
setup-apkrepos

# This is apparently necessary for the hard drive stuff to follow
apk update 
apk add eudev
setup-devd udev

# Set variables for use in the script below
DISK='/dev/disk/by-id/ata-QEMU_HARDDISK_QM00007'
MNT=$(mktemp -d)
SWAPSIZE=4
RESERVE=1

# Install ZFS
apk add zfs

# Install partition tools
apk add parted e2fsprogs cryptsetup util-linux

# Partition disks
partition_disk () {
    local disk="${1}"
    blkdiscard -f "${disk}" || true

    parted --script --align=optimal  "${disk}" -- \
    mklabel gpt \
    mkpart EFI 2MiB 1GiB \
    mkpart bpool 1GiB 5GiB \
    mkpart rpool 5GiB -$((SWAPSIZE + RESERVE))GiB \
    mkpart swap  -$((SWAPSIZE + RESERVE))GiB -"${RESERVE}"GiB \
    mkpart BIOS 1MiB 2MiB \
    set 1 esp on \
    set 5 bios_grub on \
    set 5 legacy_boot on

    partprobe "${disk}"
}

for i in ${DISK}; do
   partition_disk "${i}"
done


# Setup encrypted swap
for i in ${DISK}; do
   cryptsetup open --type plain --key-file /dev/random "${i}"-part4 "${i##*/}"-part4
   mkswap /dev/mapper/"${i##*/}"-part4
   swapon /dev/mapper/"${i##*/}"-part4
done

# Load ZFS kernel module
modprobe zfs

# Create boot pool
# shellcheck disable=SC2046
zpool create -d \
    -o feature@async_destroy=enabled \
    -o feature@bookmarks=enabled \
    -o feature@embedded_data=enabled \
    -o feature@empty_bpobj=enabled \
    -o feature@enabled_txg=enabled \
    -o feature@extensible_dataset=enabled \
    -o feature@filesystem_limits=enabled \
    -o feature@hole_birth=enabled \
    -o feature@large_blocks=enabled \
    -o feature@lz4_compress=enabled \
    -o feature@spacemap_histogram=enabled \
    -o ashift=12 \
    -o autotrim=on \
    -O acltype=posixacl \
    -O canmount=off \
    -O compression=lz4 \
    -O devices=off \
    -O normalization=formD \
    -O relatime=on \
    -O xattr=sa \
    -O mountpoint=/boot \
    -R "${MNT}" \
    bpool \
    $(for i in ${DISK}; do
       printf '%s ' "${i}-part2";
      done)

# A separate boot pool is created with features limited to only those supported by GRUB.
# shellcheck disable=SC2046
zpool create \
    -o ashift=12 \
    -o autotrim=on \
    -R "${MNT}" \
    -O acltype=posixacl \
    -O canmount=off \
    -O compression=zstd \
    -O dnodesize=auto \
    -O normalization=formD \
    -O relatime=on \
    -O xattr=sa \
    -O mountpoint=/ \
    rpool \
   $(for i in ${DISK}; do
      printf '%s ' "${i}-part3";
     done)

# Create root system container
zfs create -o canmount=off -o mountpoint=none \
    rpool/fedora
zfs create -o canmount=off -o mountpoint=none \
    # These options allow encryption, requiring at least 8 characters
    -o encryption=on -o keylocation=prompt -o keyformat=passphrase \
    rpool/fedora

# Create system datasets
zfs create -o canmount=noauto -o mountpoint=/  rpool/fedora/root
zfs mount rpool/fedora/root
zfs create -o mountpoint=legacy rpool/fedora/home
mkdir "${MNT}"/home
mount -t zfs rpool/fedora/home "${MNT}"/home
zfs create -o mountpoint=legacy  rpool/fedora/var
zfs create -o mountpoint=legacy rpool/fedora/var/lib
zfs create -o mountpoint=legacy rpool/fedora/var/log
zfs create -o mountpoint=none bpool/fedora
zfs create -o mountpoint=legacy bpool/fedora/root
mkdir "${MNT}"/boot
mount -t zfs bpool/fedora/root "${MNT}"/boot
mkdir -p "${MNT}"/var/log
mkdir -p "${MNT}"/var/lib
mount -t zfs rpool/fedora/var/lib "${MNT}"/var/lib
mount -t zfs rpool/fedora/var/log "${MNT}"/var/log

# Format and mount ESP
for i in ${DISK}; do
 mkfs.vfat -n EFI "${i}"-part1
 mkdir -p "${MNT}"/boot/efis/"${i##*/}"-part1
 mount -t vfat -o iocharset=iso8859-1 "${i}"-part1 "${MNT}"/boot/efis/"${i##*/}"-part1
done

mkdir -p "${MNT}"/boot/efi
mount -t vfat -o iocharset=iso8859-1 "$(echo "${DISK}" | sed "s|^ *||"  | cut -f1 -d' '|| true)"-part1 "${MNT}"/boot/efi
```


Download and extract minimal Fedora root filesystem.
```sh
apk add curl
curl --fail-early --fail -L \
https://dl.fedoraproject.org/pub/fedora/linux/releases/38/Container/x86_64/images/Fedora-Container-Base-38-1.6.x86_64.tar.xz \
-o rootfs.tar.gz
curl --fail-early --fail -L \
https://dl.fedoraproject.org/pub/fedora/linux/releases/38/Container/x86_64/images/Fedora-Container-38-1.6-x86_64-CHECKSUM \
-o checksum

# BusyBox sha256sum treats all lines in the checksum file
# as checksums and requires two spaces "  "
# between filename and checksum

grep 'Container-Base' checksum \
| grep '^SHA256' \
| sed -E 's|.*= ([a-z0-9]*)$|\1  rootfs.tar.gz|' > ./sha256checksum

sha256sum -c ./sha256checksum

rootfs_tar=$(tar t -af rootfs.tar.gz | grep layer.tar)
rootfs_tar_dir=$(dirname "${rootfs_tar}")
tar x -af rootfs.tar.gz "${rootfs_tar}"
ln -s "${MNT}" "${MNT}"/"${rootfs_tar_dir}"
tar x  -C "${MNT}" -af "${rootfs_tar}"
unlink "${MNT}"/"${rootfs_tar_dir}"
```

Enable community repo
```sh
sed -i '/edge/d' /etc/apk/repositories
sed -i -E 's/#(.*)community/\1community/' /etc/apk/repositories
```

Generate fstab
```sh
apk add arch-install-scripts
genfstab -t PARTUUID "${MNT}" \
| grep -v swap \
| sed "s|vfat.*rw|vfat rw,x-systemd.idle-timeout=1min,x-systemd.automount,noauto,nofail|" \
> "${MNT}"/etc/fstab
```

Chroot
```sh
cp /etc/resolv.conf "${MNT}"/etc/resolv.conf
for i in /dev /proc /sys; do mkdir -p "${MNT}"/"${i}"; mount --rbind "${i}" "${MNT}"/"${i}"; done
chroot "${MNT}" /usr/bin/env DISK="${DISK}" bash
```

Unset all shell aliases
```sh
unalias -a
```

Installation 
```sh
# Base packages
dnf -y install @core grub2-efi-x64 grub2-pc grub2-pc-modules grub2-efi-x64-modules shim-x64 efibootmgr kernel kernel-devel

# ZFS packages
dnf -y install https://zfsonlinux.org/fedora/zfs-release-2-3"$(rpm --eval "%{dist}"||true)".noarch.rpm

dnf -y install zfs zfs-dracut

# Check logs to make sure ZFS modules are successfully built
# This directly appears not to be available
tail -n10 /var/lib/dkms/zfs/**/build/make.log

# Add ZFS modules to dracut
echo 'add_dracutmodules+=" zfs "' >> /etc/dracut.conf.d/zfs.conf
echo 'force_drivers+=" zfs "' >> /etc/dracut.conf.d/zfs.conf

# Add drivers to dracut
if grep mpt3sas /proc/modules; then
  echo 'force_drivers+=" mpt3sas "'  >> /etc/dracut.conf.d/zfs.conf
fi
if grep virtio_blk /proc/modules; then
  echo 'filesystems+=" virtio_blk "' >> /etc/dracut.conf.d/fs.conf
fi

# Build initrd
find -D exec /lib/modules -maxdepth 1 \
-mindepth 1 -type d \
-exec sh -vxc \
'if test -e "$1"/modules.dep;
    then kernel=$(basename "$1");
    dracut --verbose --force --kver "${kernel}";
fi' sh {} \;

# For SELinux, relabel filesystem on reboot
fixfiles -F onboot

# Enable time sync
systemctl enable systemd-timesyncd

# Generate host ID
# This executable doesn't exist on the installation, and searching DNF doesn't come up with anything
zgenhostid -f -o /etc/hostid

# Install locale package
dnf install -y glibc-minimal-langpack glibc-langpack-en

# Set locale, keymap, timezone, hostname
rm -f /etc/localtime
rm -f /etc/hostname
systemd-firstboot \
--force \
--locale=en_US.UTF-8 \
--timezone=Etc/UTC \
--hostname=testhost \
--keymap=us || true

# Set root password
printf 'root:yourpassword' | chpasswd
```

Apply GRUB workaround
```sh
echo 'export ZPOOL_VDEV_NAME_PATH=YES' >> /etc/profile.d/zpool_vdev_name_path.sh
# shellcheck disable=SC1091
. /etc/profile.d/zpool_vdev_name_path.sh

# GRUB fails to detect rpool name, hard code as "rpool"
sed -i "s|rpool=.*|rpool=rpool|"  /etc/grub.d/10_linux
```

Disable Boot Loader Specification module for GRUB, which does not support ZFS.
This will require you to regenerate GRUB menu and mirror it after every kernel update.
```sh
echo 'GRUB_ENABLE_BLSCFG=false' >> /etc/default/grub
```

Install GRUB
```sh
mkdir -p /boot/efi/fedora/grub-bootdir/i386-pc/
for i in ${DISK}; do
 grub2-install --target=i386-pc --boot-directory \
     /boot/efi/fedora/grub-bootdir/i386-pc/  "${i}"
done
dnf reinstall -y grub2-efi-x64 shim-x64
cp -r /usr/lib/grub/x86_64-efi/ /boot/efi/EFI/fedora/
```