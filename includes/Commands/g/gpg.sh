# Decrypt file
gpg file.txt

# Export GPG public key
gpg --export --output ~/jdoe.pub

# Import another person's public key
gpg --import jdoe.pub

# List available GPG keys
gpg --list-key

# Encrypt a file
gpg --encrypt -r jdoe@dplaptop.lab.itpro.tv $FILE

# Sign $FILE without encrypting it (produces file.asc)
gpg --clearsign $FILE

# Import another person's public key
gpg --import ~/jdoe.pub

# Send keys to $SERVER
gpg --send-keys keyIDs --keyserver $SERVER

# Verify veracity of a .sig signature file for a download
gpg --keyserver-options auto-key-retrieve --verify archlinux-version-x86_64.iso.sig

# Verify Alpine Extended live image's signature
gpg --auto-key-retrieve --keyserver hkps://keyserver.ubuntu.com --verify alpine-extended-*.asc
