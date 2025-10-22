# Display branches ("*" indicates that branch is checked out)
git branch

# Display the last commit for each branch
git branch -v

# Display branches that have not been merged
git branch --no-merged

# Set upstream branch
git branch -u $REMOTE_REPO/$BRANCH
