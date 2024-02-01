# Create qcow2 disk image"
qemu-img create -f qcow2 disk0.qcow2 '5G'

# Convert an image to another format
qemu-img convert -f vmdk -O qcow2 $INFILE $OUTFILE