# Randomly sort
sort -R

# Sort by space-delimited columns. 
ps aux | sort -nk 4

# Sort a file in place
sort -o $FILE $FILE
