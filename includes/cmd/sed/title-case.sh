# Convert a string to title case
sed -E 's/(^|[^a-zA-L0-9])([a-z])/\1\U\2/g' $STRING
