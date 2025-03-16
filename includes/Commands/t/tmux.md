**tmux** loads the system config at /etc/tmux.conf, then looks for a user config at $HOME/.tmux.conf or $XDG_CONFIG_HOME/tmux/tmux.conf


<div class="grid cards" markdown>

-   **Key bindings**

    ---

    tmux is controlled from an attached command by key combinations preceded by a "prefix" (++ctrl+b++ by default).

    Each window can be split into rectangular panes, each of which is a separate ptty.


    -   **Panes**
        
        - **`<prefix>`** + **`"`** horizontal split
        - **`<prefix>`** + **`%`** vertical split
        - **`<prefix>`** + **`x`** close pane
        - **`<prefix>`** + **`z`** zoom in on a pane to have it take up the entire window

    -   **Windows**

        - **`<prefix>`** + **`c`** new window
        - **`<prefix>`** + **`&`** close window
        - **`<prefix>`** + **`n`** next window
        - **`<prefix>`** + **`p`** previous window


    Key bindings can be changed with the **bind-key** and **unbind-key** commands.

    ```sh title="tmux.conf"
    # Set new prefix
    unbind F9
    set -g prefix F9
    bind F9 send-prefix
    ```

-   **Sessions**

    ---

    A **session** is a single collection of pseudo terminals and have one or more windows linked to it.

    -   **Sessions**

        - **`<prefix>`** + **`s`** new session
        - **`<prefix>`** + **`d`** detach session
        - **`<prefix>`** + **`D`** list detachable sessions
        - **`<prefix>`** + **`(`** attach to previous session
        - **`<prefix>`** + **`)`** attach to next session
        - **`<prefix>`** + **`$`** rename session


    ```sh
    # Start a new named session
    tmux new -s $SESSION_NAME 
       # new-session

    # List sessions
    tmux ls
       # list-sessions

    # Attach named session
    tmux attach -t $SESSION_NAME
    ```


</div>

```sh title="tmux.conf"
# Source TPM package
set -g @plugin 'tmux-plugins/tpm'

# Run TPM package
run '$HOME/.config/tmux/plugins/tpm/tpm'

# Enable mouse
set mouse "yes"
```

```sh
# Reload configuration from within a tmux session
tmux source ~/.config/tmux/tmux.conf
```

