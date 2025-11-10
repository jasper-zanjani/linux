```sh title="chown"
# Change the user and group owner of a file
chown $USER:$GROUP $file

# Recursively grant user ownership to a directory's contents
chown -R $USER $PATH

# Use a reference file to match the configuration of a particular file
chown -vR --reference=. $PATH

# Prevents changes to files in the root directory when used together with --recursive
chown -cfR --preserve-root $USER 
```
