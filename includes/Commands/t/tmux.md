!!! info "Reference"

    === ":material-tools: config"

        **tmux** loads the system config at /etc/tmux.conf, then looks for a user config at $HOME/.tmux.conf or $XDG_CONFIG_HOME/tmux/tmux.conf

        ```sh title="tmux.conf"
        # Source TPM package
        set -g @plugin 'tmux-plugins/tpm'

        # Run TPM package
        run '$HOME/.config/tmux/plugins/tpm/tpm'

        # Enable mouse
        set mouse "yes"
        ```

        Key bindings can be changed with the **bind-key** and **unbind-key** commands.

        ```sh title="tmux.conf"
        # Set new prefix
        unbind F9
        set -g prefix F9
        bind F9 send-prefix
        ```

        ```sh
        # Reload configuration from within a tmux session
        tmux source ~/.config/tmux/tmux.conf
        ```


    === ":material-keyboard: keyboard bindings"

        tmux is controlled from an attached command by key combinations preceded by the **prefix** (++ctrl++++b++ by default or more commonly ++ctrl++++space++).


        <div class="grid cards" markdown>

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
            - **`<prefix>`** + **`,`** rename window

        -   "Sessions"

            - **`<prefix>`** + **`s`** new session
            - **`<prefix>`** + **`d`** detach session
            - **`<prefix>`** + **`D`** list detachable sessions
            - **`<prefix>`** + **`(`** attach to previous session
            - **`<prefix>`** + **`)`** attach to next session
            - **`<prefix>`** + **`$`** rename session

        </div>

        There are many [considerations](https://github.com/tmux/tmux/wiki/Modifier-Keys) for tmux keybindings.

        -   Ctrl can only be used with the 32 ASCII control characters: a through z plus `[`, `\`, `]`, `^`, and `-`.
            In fact other keys are interpreted as these: ++esc++ is equivalent to `C-@`, ++tab++ is `C-i`, and ++enter++ is `C-m`, etc.
            
Each window can be split into rectangular panes, each of which is a separate ptty.
A session is a single collection of pseudo terminals and have one or more windows linked to it.


```sh title="Sessions"
# Start a new named session
tmux new -s $SESSION_NAME 
   # new-session

# List sessions
tmux ls
   # list-sessions

# Attach named session
tmux attach -t $SESSION_NAME
```



