# Check for striping
lvs -o+lv_layout,stripes

# Extend striped volume
lvextend -i $STRIPES -I $STRIPESIZE $VG/$LV
