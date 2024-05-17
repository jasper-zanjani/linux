# Alacritty

!!! info "Representative config"

    === "TOML"

        ```toml
        --8<-- "includes/Configs/alacritty/alacritty.toml"
        ```

    === "YAML"

        ```yaml
        --8<-- "includes/Configs/alacritty/alacritty.yml"
        ```

<div class="grid cards" markdown>

-   #### TERM environment variable

    ---

    Setting TERM is necessary because by default alacritty will set this to "alacritty" which causes errors, especially while using pagers like less over SSH.

    === "TOML"

        ```toml
        [env]
        TERM = "xterm-256color"
        ```

    === "YAML"

        ```yaml
        env:
          TERM: xterm-256color
        ```


</div>