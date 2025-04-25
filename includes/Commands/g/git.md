=== "add"

    ```sh
    --8<-- "includes/Commands/g/git-add.sh"
    ```

=== "branch"

    ```sh
    --8<-- "includes/Commands/g/git-branch.sh"
    ```

=== "checkout"

    ```sh
    --8<-- "includes/Commands/g/git-checkout.sh"
    ```

=== "clone"

    ```sh
    --8<-- "includes/Commands/g/git-clone.sh"
    ```

=== "config"

    **git config** provides a frontend to the INI formatted config files which can be specified with options:

    -   **--system** /etc/gitconfig
    -   **--global** $HOME/.gitconfig
    -   **--local**  $REPO/.git/config

    ```sh title="git config"
    --8<-- "includes/Commands/g/git-config.sh"
    ```

=== "diff"

    ```sh
    --8<-- "includes/Commands/g/git-diff.sh"
    ```

=== "log"

    ```sh
    --8<-- "includes/Commands/g/git-log.sh"
    ```

=== "ls-files"

    ```sh
    --8<-- "includes/Commands/g/git-ls-files.sh"
    ```

=== "mv"

    ```sh
    --8<-- "includes/Commands/g/git-mv.sh"
    ```

=== "pull"

    ```sh
    --8<-- "includes/Commands/g/git-pull.sh"
    ```

=== "push"

    ```sh
    --8<-- "includes/Commands/g/git-push.sh"
    ```

=== "remote"

    ```sh
    --8<-- "includes/Commands/g/git-remote.sh"
    ```

=== "rm"

    ```sh
    --8<-- "includes/Commands/g/git-rm.sh"
    ```

=== "stash"

    ```sh
    --8<-- "includes/Commands/g/git-stash.sh"
    ```

=== ":material-wrench: Config"

    Configuration data can be stored in a variety of locations:

    -   **/etc/gitconfig**
    -   **$HOME/.gitconfig**
    -   **$REPO/.git/config**
    
    ```ini title="Conditional configuration"
    [includeIf "gitdir:~/projects/work/"]
        path = ~/projects/work/.gitconfig
    
    [includeIf "gitdir:~/projects/oss/"]
        path = ~/projects/oss/.gitconfig
    ```

