??? info "Command reference"

    --8<-- "includes/cmd/git/reference.md"

Git (1) is a very complex utility with multiple commands and subcommands and a strong dependency on **version control system** concepts.
{: .annotate }

1.  

    --8<-- "includes/cmd/git/callout.md"

A git **repository** is a directory containing files, changes to which are tracked in discrete units called **commits**.
In the jargon of git, the contents of the directory are referred to as the **current working tree**.
Changes made to the repository have to be incorporated into the **commit history** in a multi-step process, starting by **staging** changes, or adding them to the **index** which will be incorporated into the following commit.

```sh
# Apply a single, specific commit from another branch
git cherry-pick $COMMIT
```

Combine branches by replaying the changes made on one branch to another
```sh
git rebase
```


```sh
# Undo unstaged changes since last commit
git reset --hard

# Reset master to state before last commit
git reset --hard HEAD~

# Remove committed changes
git revert $COMMIT
```

