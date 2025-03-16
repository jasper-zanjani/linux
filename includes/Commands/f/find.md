Search for files in a directory hierarchy

```sh
# Find largest files
find . -type f -exec du {} \; | sort -rn | head

# Find all files owned by user
find . -user $USER
```

**-exec** allows a command to be executed over every found file, which has to be terminated with an escaped semicolon, i.e. **`\;`**.

```sh
# Remove whitespace from filenames
find . -type f -name "* *" -exec bash -c 'mv "$0" "${0// /_}"' {} \;
```

There are 3 timestamps associated with files in Linux: **atime** (access time), **mtime** (modify time), and **ctime** (change time).
Numerical arguments can be specified with a plus or minus to indicate greater or less than the given number of days.

```sh title="Find recently modified files"
# Find only files that were modified more than 120 days ago
find . -type f -mtime +120 -ls

# Modified less than 15 days ago 
find . -type f -mtime -15 -ls

# Modified exactly 10 days ago 
find . -type f -mtime 10 -ls 

# Find files modified over the past day
find . -type f -newermt "1 day ago" -ls
find . -type f -newermt "-24 hours" -ls
find . -type f -newermt "yesterday" -ls

# Find files created today
find . -type f -ctime -1 -ls 
```
