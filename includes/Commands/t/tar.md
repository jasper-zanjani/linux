```sh
# Create archive
tar -cf $ARCHIVE $PATH # --create --file
tar -cfj $ARCHIVE $PATH # --bzip
tar -cfz $ARCHIVE $PATH # --gzip

# Add file to existing archive"
tar -rf $ARCHIVE $FILE # --append

# Extract into current directory
tar -xf $ARCHIVE # --extract

# Extract only a single file
tar -xf $ARCHIVE $FILE

# Extract to a path
tar -xzf $ARCHIVE -C $PATH

# List archive contents
tar -tf $ARCHIVE # --list
```