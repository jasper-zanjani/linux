Build a [Fedora ISO image](https://fedoraproject.org/wiki/How_to_create_a_Fedora_install_ISO_for_testing)

An ISO image can be decompressed using 7z
```sh
# Note there can be no space after -o
7z x $ISO -o$PATH
```

``` title="Directory structure of a Fedora ISO"
.
├── boot
├── [BOOT]
├── EFI
├── Fedora-Legal-README.txt
├── images
├── LICENSE
├── media.repo
├── Packages
└── repodata

7 directories, 3 files

```

```sh
# This apparently removes all text from the file after the indicated line.
awk '/### BEGIN \/etc\/grub.d\/10_linux ###/{stop=1} stop==0{print}' < ks/EFI/BOOT/grub.cfg > grub.cfg
```


```sh
# Make Kickstart ISO
mkisofs -o $ISO -b $BIN -J -R -l -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -eltorito-alt-boot -e images/efiboot.img -no-emul-boot -graft-points -V {{ label | quote }} .

# Prepare ISO for boot
isohybrid --uefi $ISO
```