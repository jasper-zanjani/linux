```sh title="pacman"
--8<-- "includes/Commands/p/pacman.sh"
```

??? info "pacman query"

    ```sh
    --8<-- "includes/Commands/p/pacman-query.sh"
    ```

??? info "pacman remove"

    ```sh
    --8<-- "includes/Commands/p/pacman-remove.sh"
    ```

??? info "pacman sync"

    ```sh
    --8<-- "includes/Commands/p/pacman-sync.sh"
    ```

Every section in **/etc/pacman.conf** defines a package repository.

```ini title="/etc/pacman.conf"
--8<-- "includes/Configs/archzfs.cfg"
```