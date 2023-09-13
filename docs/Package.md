# Package management

## Commands

--8<-- "includes/Commands/add-apt-repository.md"

--8<-- "includes/Commands/apt-key.md"

--8<-- "includes/Commands/apt.md"

--8<-- "includes/Commands/dnf.md"

--8<-- "includes/Commands/flatpak.md"

#### pacman
:   
    ```sh title="pacman"
    --8<-- "includes/Commands/pacman.sh"
    ```

    Every section in **/etc/pacman.conf** defines a package repository.

    ```ini title="/etc/pacman.conf"
    --8<-- "includes/Configs/archzfs.cfg
    ```

#### pacman-key
:   
    --8<-- "includes/Commands/pacman-key.md"


--8<-- "includes/Commands/rpm.md"

--8<-- "includes/Commands/snap.md"