# Save snapshot
stratis fs snapshot pool files files-snapshot

# Restore from snapshot
stratis fs rename files files-orig
stratis fs rename files-snapshot files
umount /mnt/files; mount /mnt/files