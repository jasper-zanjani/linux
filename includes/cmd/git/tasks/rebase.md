Aside from editing the most recent commit, changing a prior commit is a complicated process centering around the use of [**git rebase**](https://git-scm.com/docs/git-rebase).

The process starts by determining how far back in the commit history to rewind, and this limit can be specified in two ways (note that git will not allow this to be done if there are any unstaged changes, which must be stashed or committed):

1. Using **HEAD~n** syntax, which will backtrack **n** commits from the current HEAD position.
2. Using a **commit SHA hash** which will specify a specific commit. Note that in most cases, a caret **^** is appended to specify the commit's parent, because the specified commit won't appear in the next step

```sh
# Rebase a specified number of commits backward from the current HEAD
git rebase -i HEAD~4
         # --interactive

# Specify a specific commit's parent
git rebase -i $COMMIT^
```

Now the default text editor (specified by \$VISUAL or \$GIT_EDITOR) will open (1) showing the selected commits (most recent first), each preceded by the **pick** command.
Underneath this list is a comment block showing various commands that can replace pick, depending on the change needed to be done. 
{ .annotate }

1. 
``` title="Example output of git rebase"
--8<-- "includes/Output/git-rebase/00"
```

In most cases **edit** will be appropriate, which will rewind the the working directory to the state of that commit.
At this moment it is as if time has been rewound, with the selected commit being the most recent.
Changes can be staged and committed as desired.

Once the edits have been completed, time can be run forward again using **git rebase --continue**.

**Rebasing** is involved in many of the more complicated tasks associated with changing commits prior to the most recent one.

```sh
# Rebase changes committed to branch onto MASTER
git checkout $BRANCH
git rebase $MASTER
```

This will rewind $BRANCH to the commit shared by the two branches, then applying all changes made subsequently to $MASTER. 

```sh
git checkout $MASTER
git merge $BRANCH
```
Now the history will appear as though all changes were made in series, when they were actually made in parallel on separate branches.
Move the last commit to a new branch

```sh
git branch test         # create a new branch with current HEAD
git reset --hard HEAD~  # reset master to before last commit 
git checkout test       # continue on new branch
```



