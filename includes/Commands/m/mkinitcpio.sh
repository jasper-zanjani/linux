# Process all presets contained in /etc/mkinitcpio.d
mkinitcpio -P 
         # --allpresets 

# Regenerate the preset provided by a particular package
mkinitcpio -p linux