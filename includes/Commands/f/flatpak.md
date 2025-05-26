!!! info "Command reference"

    === "list"

        ```sh
        --8<-- "includes/Commands/f/flatpak-list.sh"
        ```

    === "override"

        ```sh
        --8<-- "includes/Commands/f/flatpak-override.sh"
        ```

    === ":simple-task: Tasks"
        
        --8<-- "includes/Commands/f/flatpak-tasks.md"

**Flatpak** is one of several recent containerized application distribution solutions for Linux.

Flatpak runtimes are compiled reproducibly using [BuildStream](https://www.buildstream.build/) and they are installed in **/var/lib/flatpak/runtime**.
Like Steam, flatpak uses [BubbleWrap](https://github.com/containers/bubblewrap) to implement sandboxing.


#### Packaging

!!! info "GNOME Builder"

    GNOME Builder creates a JSON file for use with flatpak.
