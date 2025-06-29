# Alacritty

!!! info "Representative config"

    <div class="grid cards" markdown>

    ```toml title="TOML"
    --8<-- "includes/Configs/alacritty/alacritty.toml"
    ```


    ```yaml title="YAML"
    --8<-- "includes/Configs/alacritty/alacritty.yml"
    ```

    </div>

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
