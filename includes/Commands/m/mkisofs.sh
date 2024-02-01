# Create an ISO from a directory
mkisofs -o $ISO $PATH

# Set disc label
mkisofs -o $ISO $PATH -V $LABEL

# Specify an El Torito boot image
mkisofs -o $ISO $PATH -b $BOOTIMAGE

# From Ansible playbook

# -b, -eltorito-boot    
#   Specify path and filename of the boot image to be used when making an El Torito bootable CD.

# -J
#   Enable Miscrosoft Windows UCS-2 filenames via Joliet extension.

# -eltorito-alt-boot
#   Start with a new set of El Torito boot parameters, allowing more than one El Torito boot entry on a single image.

mkisofs -o {{ isopath }}/isos/{{ host }}.iso -b isolinux/isolinux.bin -J -R -l -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -eltorito-alt-boot -e images/efiboot.img -no-emul-boot -graft-points -V {{ label | quote }} .