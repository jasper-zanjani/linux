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

    The **Z** option is necessary on SELinux systems (RHEL and derivatives) when mounting volumes and tells podman to label the content with a private unshared label.
    On systems running SELinux, rootless containers must be explicitly allowed to access bind mounts.
    Containerized processes are not allowed to access files without a SELinux label.

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

    # Azure Data Explorer Kusto emulator
    podman pull mcr.microsoft.com/azure/dataexplorer/kustainer-linux:latest
    ```

=== ":material-star: run"

    ```sh
    --8<-- "includes/cmd/podman/podman-run.sh"
    ```
