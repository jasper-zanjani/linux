=== ":material-star: Common"

    ```sh
    sudo dnf upgrade -y

    # Upgrading version
    --8<-- "includes/cmd/dnf/dnf-system-upgrade.sh"
    --8<-- "includes/cmd/dnf/dnf-offline.sh"
    ```

=== "c"

    ```sh title="dnf clean"
    --8<-- "includes/cmd/dnf/dnf-clean.sh"
    ```

    ```sh title="dnf config-manager"
    --8<-- "includes/cmd/dnf/dnf-config-manager.sh"
    ```

    --8<-- "includes/cmd/dnf/dnf-copr.md"

=== "d"
    
    --8<-- "includes/cmd/dnf/dnf-download.md"

=== "g"

    --8<-- "includes/cmd/dnf/dnf-group.md"

=== "h"

    ```sh title="dnf history"
    --8<-- "includes/cmd/dnf/dnf-history.sh"
    ```

=== "i"

    ```sh title="dnf install"
    --8<-- "includes/cmd/dnf/dnf-install.sh"
    ```

=== "m"

    --8<-- "includes/cmd/dnf/dnf-module.md"

=== "o"

    ```sh title="dnf offline"
    --8<-- "includes/cmd/dnf/dnf-offline.sh"
    ```

=== "p"

    ```sh title="dnf provides"
    --8<-- "includes/cmd/dnf/dnf-provides.sh"
    ```

=== "r"

    ```sh title="dnf remove"
    --8<-- "includes/cmd/dnf/dnf-remove.sh"
    ```

    ```sh title="dnf repolist"
    --8<-- "includes/cmd/dnf/dnf-repolist.sh"
    ```

    ```sh title="dnf repoquery"
    # List files associated with a package
    dnf repolist -l $PACKAGE
    ```

=== "s"

    ```sh title="dnf swap"
    --8<-- "includes/cmd/dnf/dnf-swap.sh"
    ```

    --8<-- "includes/cmd/dnf/dnf-system-upgrade.md"

=== ":material-tools: Configuration"

    --8<-- "includes/cmd/dnf/config.md"

=== ":material-plus: rpm"

    ```sh
    --8<-- "includes/Commands/r/rpm.sh"
    ```

