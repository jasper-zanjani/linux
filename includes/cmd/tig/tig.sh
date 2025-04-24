# Browse the commit history for a single file
tig $FILE

# Filter commits to a date range
tig --after="2017-01-01" --before="2018-05-16" -- $FILE

# Find who made a change to a file and why
tig blame $FILE

# Browse stash
tig stash

# Browse refs
tig refs

# Navigate the output of git grep
tig grep -i foo lib/Bar

# Pipe a list of commit IDs to tig
git rev-list --author=olaf HEAD | tig show --stdin
