# Without an argument, git will attempt 'to edit all commits made locally since the last push to the remote repository.
git rebase -i

# Specify the four most recent commits
git rebase -i HEAD~4

# Start a rebase at the parent of the commit that will be split by appending '^' to the commit ID
git rebase -i "$COMMIT"^ 

# Continue rebase once changes have been made, returning to HEAD of branch
git rebase --continue
