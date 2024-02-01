# Create snapshot of a pool recursively
zfs snapshot -r tank@now

# Display snapshots
zfs list -t snapshot

# Snapshot management
zfs snapshot tank@snapshot1
zfs rollback tank@snapshot1
zfs destroy tank@snapshot1