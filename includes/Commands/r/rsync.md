```sh
# Copy file locally 
rsync -zvr $FILE $PATH

# Copy file to $PATH on remote $HOST
rsync $FILE $HOST:$PATH

# Copy file from $HOST to local $PATH
rsync $HOST:$FILE $PATH

# Copy directory recursively
rsync -zvr $DIR $PATH
rsync -avz $DIR $PATH

# Copy to remote systems over SSH
rsync -zvre ssh $DIR $HOST:$REMOTEPATH
rsync -avze ssh $DIR $HOST:$REMOTEPATH

# Synchronize only specific file type
rsync -zvre ssh --include '*.php' --exclude '*' $PATH
```