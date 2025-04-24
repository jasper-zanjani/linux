Sometimes many commits are made to resolve a single issue and can be combined into a single commit for brevity. 
In the parlance of git these should be "squashed". To squash the last 4 commits, first begin the rebasing process:

```sh
# Without an argument, git will attempt 'to edit all commits made locally since the last push to the remote repository.
git rebase -i

# Specify the four most recent commits
git rebase -i HEAD~4
```

This will open a text editor that displays the last four where you will have to select what to do with each of the 4 commits. Most recent commits are at the bottom, and at least the top (oldest) commit has to remain "pick" in order to squash the others.
The repo will have to be force-pushed once these changes have been made. 

```sh
git push -f
       # --force
```

To add changes to the most recent commit, stage changes as normal (including removals), but commit using **--amend** option. 
This will present an editor, allowing you to edit the commit message, if necessary.
Alternatively, a new 

```sh
git add README.md

# Add the staged changes to the most recent commit, adjusting the commit message interactively
git commit --amend 

# Stage additional changes, accepting the previous commit message
git commit --amend --no-edit

# Modify the commit message inline
git commit --amend -m "Adding README"
```

```sh title="Split up a commit"
# Start a rebase at the parent of the commit that will be split
git rebase -i "$COMMIT"^ 

# Mark the commit to be split with `edit`. Now reset state to the previous commit
git reset HEAD^

# The files are presented unstaged, and can be added to new commits as needed. 
# Finally, finish the rebase
git rebase --continue
```
