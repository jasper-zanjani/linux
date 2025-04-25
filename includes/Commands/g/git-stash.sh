# Stash all changes to work-tree with no name
git stash

# Stash staged changes, giving it a description using -m
git stash -S -m "for Filters"
# --staged --message

# View stashes in stash stack
git stash list

# Apply changes in most recent stash (stash 0)
git stash apply

# Apply changes in specified stash
git stash apply 1

# Delete specified stash
git stash drop stash@$STASH

# Apply stash 0 and delete it
git stash pop

# Delete all stashes
git stash clear
