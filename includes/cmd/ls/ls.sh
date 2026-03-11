# Search for a pattern using globbing
ls *.m4a

# Exclude a pattern. Note that this option is ignored when using the typical positional arguments.
ls -I '*-normalized.m4a' -I '*.webp'

# Verify LUN of added volume in Azure VMs
ls -alF /dev/disk/azure/scsi1
