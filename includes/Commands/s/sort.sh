# Randomly sort
sort -R

# Sort by space-delimited columns. 
# Processes consuming the most memory will be at the bottom 
ps aux | sort -nk 4

# Processes consuming the most CPU will be at the bottom
ps aux | sort -nk 3