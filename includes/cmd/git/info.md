Git (1) is the preeminent **version control system**.
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

### Tasks

#### Undoing changes

```sh
# Undo unstaged changes since last commit
git reset --hard

# Reset master to state before last commit
git reset --hard HEAD~

# Remove committed changes
git revert $COMMIT
```

#### Set aliases

--8<-- "includes/cmd/git/tasks/aliases.md"

#### Convert existing codebase into repo

--8<-- "includes/cmd/git/tasks/init.md"

#### Split changes into multiple commits

--8<-- "includes/cmd/git/tasks/split.md"

#### Rewrite history

--8<-- "includes/cmd/git/tasks/rebase.md"

#### Squash commits

--8<-- "includes/cmd/git/tasks/squash.md"

#### Create upstream repo

--8<-- "includes/cmd/git/tasks/upstream.md"

#### Credential management

--8<-- "includes/cmd/git/tasks/creds.md"

#### Renaming

```sh title="Rename branch"
git branch --move master main
```

```sh title="Rename remote repo"
git remote rename origin local
```
