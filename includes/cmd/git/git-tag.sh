# Display existing tags
git tag

# Create a tag
git tag -a $TAG -m $TAG_MESSAGE

# Display tag
git show

# Delete tag
git tag -d $TAG

# Tags must be pushed to the repo separate from the commit tree
git push $REMOTE --tags

# Tags can also be pushed individually
git push $REMOTE $TAG
