# Display branches ("*" indicates that branch is checked out)
git branch

# Create a new branch
git branch $BRANCH_NAME

# Display the last commit for each branch
git branch -v

# Display branches that have not been merged
git branch --no-merged

# Set upstream branch
git branch -u $REMOTE_REPO/$BRANCH

# Rename master branch to main
git branch --move master main
