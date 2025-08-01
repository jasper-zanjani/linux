<div class="grid cards" markdown>

-   #### Inspect installed packages

    ---

    --8<-- "includes/Commands/f/fzf-packages.md"

-   #### Browse text files

    ---

    --8<-- "includes/Commands/f/fzf-text.md"

</div>

Keybindings are provided by bash scripts in **/usr/share/fzf** which can be sourced by bash, zsh, or fish (but not on Ubuntu!).
These files provide several new [keybindings](https://thevaluable.dev/fzf-shell-integration/):

- ++ctrl+r++ fuzzy find shell command history
- ++alt+c++ fuzzy find all subdirectories of the working directory, running cd with the selection
- ++ctrl+t++ fuzzy find all files and subdirectories of the working directory, outputting the selection to STDOUT

??? info "Resources"

    - A Practical Guide to fzf
        1. [Building a file explorer](https://thevaluable.dev/practical-guide-fzf-example/)
        2. [Shell integration](https://thevaluable.dev/fzf-shell-integration/)
        3. [Vim integration](https://thevaluable.dev/fzf-vim-integration/)
        4. [Building a git explorer](https://thevaluable.dev/fzf-git-integration/)
