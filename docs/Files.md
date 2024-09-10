# Files

<div class="grid cards" markdown>

-   #### File permissions

    ---

    --8<-- "includes/Commands/c/chown.md"

    --8<-- "includes/Commands/c/chgrp.md"

    --8<-- "includes/Commands/c/chmod.md"


-   #### File attributes

    ---

    A family of commands exists to change **file attributes** on Linux file systems.

    --8<-- "includes/Commands/c/chattr.md"

    When the **set-group-ID** bit for a directory is set, all files *created* therein are assigned to the directory's group and not to the file owner's default group.
    
    This is intended to facilitate file sharing.
    In this scenario, users are assigned to a group, and the group is assigned to shared directories with the SGID bit set.

    The **set-user-ID** bit allows a file to be *executed* with the privileges of the file's owner.

    When the **sticky bit** is set on a directory, only root, the directory owner and the owner of a file can remove files in that directory.

-   #### FACL

    ---

    **Filesystem access control lists (FACL)** allow you to grant permissions to more than one group, i.e. in cases where more than one department of a corporation needs access to the same files.  
    They are made up of _access control entries_ (ACE). 
    FACL permissions will be indicated in a `ls -l` command by the presence of a "+" appended to the file permissions. 
    **Acl** is a dependency of `systemd`.

    To enable it, add ",acl" to options in `fstab` file, then mount/unmount disk. If enabling FACL on root partition, system has to be rebooted.

    --8<-- "includes/Commands/s/setfacl.md"


-   #### FHS

    ---

    The [**Filesystem Hierarchy Standard**](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard) describes the conventions used for the layout of Unix-like systems.

    - **/bin**: binaries that need to be available in single-user mode
    - **/etc**: host-specific system-wide configuration files
    - **/usr/bin**: non-essential command binaries for all users
    - **/usr/share**: architecture-independent data

</div>

## Commands

<div class="grid cards" markdown>


-   #### du

    ---

    --8<-- "includes/Commands/d/du.md"

-   #### find

    ---

    --8<-- "includes/Commands/f/find.md"

-   #### locate

    ---

    --8<-- "includes/Commands/l/locate.md"

-   #### mkdir

    ---

    --8<-- "includes/Commands/m/mkdir.md"

-   #### mv

    ---

    ```sh
    --8<-- "includes/Commands/m/mv.sh"
    ```

-   #### rename

    ---

    --8<-- "includes/Commands/r/rename.md"

-   #### rsync

    ---

    --8<-- "includes/Commands/r/rsync.md"

-   #### tar

    --8<-- "includes/Commands/t/tar.md"

</div>
