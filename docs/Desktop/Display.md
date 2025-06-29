# Display

#### Direct Rendering Manager

--8<-- "includes/kernel/drm.md"

<div class="grid cards" markdown>


-   #### Display server

    ---

    --8<-- "includes/wayland/info.md"

-   #### fbdev

    ---

    --8<-- "includes/kernel/fbdev.md"

-   #### GPU

    ---

    AMD GPUs are integrated into the Linux kernel, so unlike Nvidia there is no additional repo or software to be installed.
    The [**AMDGPU**](https://wiki.archlinux.org/title/AMDGPU) open-source graphics driver for AMD Radeon graphics cards is a kernel module can be checked to see if it's loaded.

    ```sh
    # Check for graphics cards
    lspci -k | grep -A2 -E "
    # Check for AMDGPU kernel module
    lsmod | grep amdgpu
    ```

    The [amdgpu\_top](https://github.com/Umio-Yasuno/amdgpu_top) TUI monitoring application is available for download.

</div>

## Tasks

<div class="grid cards" markdown>

-   #### Identify session type

    ---

    ```sh
    # Determine if you're currently running in Wayland
    echo $WAYLAND_DISPLAY # => wayland-0

    # Display running sessions
    loginctl

    # See what display server protocol is running on given session
    loginctl show-session $SESSION_ID -p Type # => Type=x11
    ```

</div>
