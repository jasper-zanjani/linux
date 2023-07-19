# Users

## Tasks

#### User management
:   
    ```sh title="Lock user"
    usermod -L $USER # --lock
    passwd -l $USER  # --lock
    ```

    ```sh title="Unlock user"
    usermod -U $USER # --unlock
    passwd -u $USER  # --unlock
    ```

#### Groups
:   
    ```sh title="Display groups of effective user"
    id -Gn
    getent group | grep $(whoami) -
    ```

## Commands

--8<--
includes/Commands/chage.md

includes/Commands/getent.md

includes/Commands/lastb.md

includes/Commands/sudo.md

includes/Commands/shadow-utils.md

--8<--