Podman uses mappings in **/etc/subuid** and **/etc/subgid** to simulate a root environment inside the container in rootless mode.
In this configuration, the current host user is mapped to UID 0 within the container and any other UIDs are mapped from a range defined in **/etc/subuid**.
This will cause bind mounts to display a non-existent UID on the host corresponding to the internal UID created by Podman.

Using `--userns` will set the user namespace mode for the container, allowing the host UID to be mapped to various values within the container.

-   `auto`
-   `host`
-   `keep-id`
-   `nomap`

!!! bug

    This doesn't actually work!

    ```sh
    # --userns=host maps host user to container's root user
    podman run -d -v $MOUNT:/persist:Z -p 8484:8484 --userns=host --name grist grist
    ```
