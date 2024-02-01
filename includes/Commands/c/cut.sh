# Take the first field of a whitespace-delimited file
cut -d\  -f 1
cut -d ' ' -f 1

# Use tr to squeeze multiple spaces
tr -s ' ' | cut -d ' ' -f 1