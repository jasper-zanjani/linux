=== "port"

    ```sh
    # Display all mapped ports
    podman port -a

    # Display mapped ports on specified container
    podman port $CONT_ID
    ```

=== "run"

    ```sh
    --8<-- "includes/cmd/podman/podman-run.sh"
    ```

=== "ps"

    `--format` takes a space-delimited list of field names (ref. `man podman-ps`) within mustache syntax

    ```sh
    # Display only container IDs
    podman ps --format "{{.ID}}"
    ```

=== "pull"

    ```sh
    podman pull nginx

    # Alias to registry.access.redhat.com/rhscl/httpd-24-rhel7
    podman pull rhscl/httpd-24-rhel7
    ```
