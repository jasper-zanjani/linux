# Remove tracked file from index and delete the file
git rm $FILE

# Remove file from the index but keep the file as-is
git rm $FILE --cached
