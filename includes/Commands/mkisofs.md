```sh
# Create an ISO from a directory:
mkisofs -o filename.iso path/to/source_directory

# From the PODS kickstart playbook
mkisofs 
    -o {{ isopath }}/isos/{{ host }}.iso 
    -b isolinux/isolinux.bin 
    -J # Generate Joliet directory records in addition to ISO-9660 filenames., needed 
    -R # Generate SUSP and RR records using the Rock Ridge protocol 
    -l # Allow full 31 character filenames (ISO-9660 normally allows 8.3 format)
    -c isolinux/boot.cat 
    -no-emul-boot # Do not perform disk emulation but load and execute boot image directly
    -boot-load-size 4 # Specify number of virtual 512-byte sectors to load in no-emulation mode
    -boot-info-table # Specify that a 56-byte table with information of the CD-ROM layout will be patched in at offset 8 in the boot file.
    -eltorito-alt-boot # Start with a new set of El Torito boot parametrs
    -e images/efiboot.img 
    -graft-points 
    -V {{ label | quote }} . # Specify volume ID to be written into the master block.
```