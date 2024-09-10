# git

Git is a very complex utility with multiple commands and subcommands and a strong dependency on **version control system** concepts.

=== "add"

    ```sh
    # Update index to include all files in the working tree, including removals
    git add -A # --no-ignore-removal

    # Stage all modifications in work-tree, including deletions
    git add -u

    # Add file, located in **\$HOME** to the git repo at **\$PATH**
    git --git-dir=$PATH/.git --work-tree=$HOME add $FILE
    ```

=== "branch"

    ```sh
    # Display branches ("*" indicates that branch is checked out)
    git branch

    # Display the last commit for each branch
    git branch -v

    # Display branches that have not been merged
    git branch --no-merged
    ```

=== "checkout"

    ```sh
    # Discard unstaged uncommitted changes to file
    git checkout -- file

    # Switch to branch
    git checkout branch
    ```

=== "diff"

    ```sh
    # Displays changes inline in a perhaps more legible way
    git diff --word-diff
    ```

=== "log"

    ```sh
    # Show commits between January 1 and January 5, 2016
    git log --after="2016-01-01" --before="2016-01-05"

    # See commits that are on a branch but not on master
    git log $MASTER..$BRANCH
    ```

=== "ls-files"

    ```sh
    # Show tracked files
    git ls-files

    # Show tracked files, each line is terminated by a null byte
    git ls-files -z

    # Show tracked files that have been deleted
    git ls-files --deleted
    ```

=== "mv"

    ```sh
    # Move or rename a tracked file
    git mv $FILE $NEWNAME
    ```

=== "push"

    ```sh
    # Transfer data from local branch {master} to remote {origin}
    git push -u origin master
    ```

=== "remote"

    ```sh
    # Add remote repo
    git remote add $REPO $URL

    # Display URL of remote repo
    git remote get-url $REPO

    # Set url for existing repo
    git remote set-url $URL $REPO
    ```

=== "rm"

    ```sh
    # Remove tracked file from index and delete the file
    git rm $FILE

    # Remove file from the index but keep the file as-is
    git rm $FILE --cached
    ```

=== "stash"

    ```sh
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
    ```

---

The most basic useful command may be [**git clone**](https://git-scm.com/docs/git-clone) which simply downloads a repository.
```sh
git clone https://gitlab.gnome.org/GNOME/gtk.git

# The depth of the tree can be specified, and various configuration parameters can be passed with -c
git clone https://gitlab.gnome.org/GNOME/gtk.git --depth 1 -c http.sslVerify=false
```

A git repository is a directory containing files, changes to which are tracked in discrete units called **commits**.
In the jargon of git, the contents of the directory are referred to as the **current working tree**.
Changes made to the repository have to be incorporated into the **commit history** in a multi-step process, starting by **staging** changes, or adding them to the **index** which will be incorporated into the following commit.

```sh
# Apply a single, specific commit from another branch
git cherry-pick commit
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

## Tasks

#### Configuration
:   

    ??? info "Configs"

        | Type       | Location       |
        | ---------- | -------------- |
        | System     | /etc/gitconfig |
        | Global     | ~/.gitconfig   |
        | Repository | .git/config    |

    **git config** provides a frontend to the INI formatted config files typically found within **.git/config** in each repo or, when using **-g**/**--global**, **\$HOME/.gitconfig**.

    ```sh title="git config"
    # List all configuration (includes directive in global .gitconfig)
    git config --list

    # Store authentication details in the credential store (2)
    git config --global credential.helper store

    # Set up alias "br" for branch (1)
    git config --system alias.br branch

    # Define a directory as safe (3)
    git config --global --add safe.directory $PATH
    ```

    1. 
    ```ini title="/etc/gitconfig"
    [alias]
        br = branch
    ```
    2. 
    ```ini title=".gitconfig"
    [credential]
        helper = cache
    ```
    3. 
    ```ini title=".gitconfig"
    [safe]
        directory = $PATH
    ```



    ```sh
    # Git will automatically append CRLF endings on Windows. 
    # This setting can be displayed with the following command:
    git config core.autocrlf

    # Disable appending CRLF endings
    git config core.autocrlf false
    ```

    ```ini title="Conditional configuration"
    [includeIf "gitdir:~/projects/work/"]
        path = ~/projects/work/.gitconfig
    
    [includeIf "gitdir:~/projects/oss/"]
        path = ~/projects/oss/.gitconfig
    ```

#### Aliases
:   

    ```sh
    git config --global alias.staash stash --all

    # Run a script
    git config --global alias.bb !better-branch.sh
    ```

#### Existing codebase
:   
    An existing directory can be turned into a repo.

    ```sh
    git init

    # Define an upstream repo
    git remote add origin $REPO

    # Before a first commit, the global email and user name must be set.
    git config --global user.name $NAME
    git config --global user.email $EMAIL

    # Add and commit as normal
    git add .
    git commit -m $MESSAGE

    # The first push must have the upstream repo set
    git push --set-upstream origin master
    ```

#### Splitting changes into multiple commits
:   
    If there are many unstaged changes, they can be staged [piecemeal](https://nuclearsquid.com/writings/git-add/) using **-p**/**--patch**.
    This will display colorized diffs of individual changes, named "hunks" in each file.
    The user must interactively provide commands in the terminal:

    - **y** add the current hunk
    - **n** skip the hunk
    - **d** skip the hunk and all other remaining hunks
    - **s** split the hunk into smaller hunks, but only if there are unchanged lines between the changes displayed in the current hunk
    - **e** manually edit the hunk
    - **q** abort (note that this will abort all changes made in the operation, including prior hunk selections)

    ```sh
    git add -p README.md
    ```

#### Rewriting history
:   
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

    Now the default text editor will open (1) showing the selected commits (most recent first), each preceded by the **pick** command.
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


#### Squashing
:   
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

#### Create upstream repo
:   
    Any local directory can be treated as an upstream as long as it is a bare git repository (conventionally with name ending in .git but this doesn't appear to be necessary).
    Any such local repo can be cloned by using the **--local** option or using the **file://** protocol.

    ```sh
    git clone --local /path/to/upstream.git

    git clone file:///path/to/upstream.git
    ```

#### tig
:   
    Provides a curses-based browser that allows you to navigate the commits in the current branch. 
    It is essentially a wrapper around **git log**, and therefore accepts the same arguments that can be passed to it.
    Tig's config is at **$HOME/.tigrc**.

    ```sh
    # Browse the commit history for a single file
    tig $FILE

    # Filter commits to a date range
    tig --after="2017-01-01" --before="2018-05-16" -- $FILE

    # Find who made a change to a file and why
    tig blame $FILE

    # Browse stash
    tig stash

    # Browse refs
    tig refs

    # Navigate the output of git grep
    tig grep -i foo lib/Bar

    # Pipe a list of commit IDs to tig
    git rev-list --author=olaf HEAD | tig show --stdin
    ```

#### Credentials
:   
    Once an access token has been generated in a git provider like GitHub, it must be entered as the password.

    If the [**credential store**](https://git-scm.com/docs/git-credential-store) has been enabled, credentials can be stored on-disk.

    ```ini
    [credential]
      helper = store
    ```

    These credentials are stored in plaintext at **~/.git-credentials**.
    If the token expires and must be changed, this file must be deleted before git will prompt for the new password again.

### Applications

A variety of open-source applications are available that seek to ease use of git.

<div class="grid cards" markdown>

-   #### [lazygit](https://github.com/jesseduffield/lazygit)

    ---

    [**Lazygit**](https://github.com/jesseduffield/lazygit) is a modern and colorful TUI application that allows a repository to be managed from the terminal.
    Individual files are staged with with ++space++ and commits are created with ++c++

    - [Josean Martinez - Lazygit](https://www.youtube.com/watch?v=Ihg37znaiBo)

</div>