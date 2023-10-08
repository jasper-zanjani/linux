# Files



## Glossary

#### squashfs
:   
    [Squashfs](https://www.kernel.org/doc/html/latest/filesystems/squashfs.html) is a compressed read-only filesystem for Linux using zlib compression for files, inodes, and directories.

#### SGID
:   
    When the **set-group-ID** bit for a directory is set, all files *created* therein are assigned to the directory's group and not to the file owner's default group.
    
    This is intended to facilitate file sharing.
    In this scenario, users are assigned to a group, and the group is assigned to shared directories with the SGID bit set.


#### Sticky bit
:   
    When the sticky bit is set on a directory, only root, the directory owner and the owner of a file can remove files in that directory.

#### SUID
:   
    The **set-user-ID** bit allows a file to be *executed* with the privileges of the file's owner.



## Commands

#### chage
:   
    --8<-- "includes/Commands/chage.md"

#### chgrp
:   
    --8<-- "includes/Commands/chgrp.md"

#### chmod
:   
    --8<-- "includes/Commands/chmod.md"

#### chown
:   
    --8<-- "includes/Commands/chown.md"

#### cp
:   
    --8<-- "includes/Commands/cp.md"

#### du
:   
    --8<-- "includes/Commands/du.md"

#### find
:   
    --8<-- "includes/Commands/find.md"

#### locate
:   
    ```sh title="Install"
    apt install -y plocate
    ```

#### mv
:   
    --8<-- "includes/Commands/mv.md"

#### rename
:   
    --8<-- "includes/Commands/rename.md"

#### rsync
:   
    --8<-- "includes/Commands/rsync.md"

### facl



#### getfacl
:   
    --8<-- "includes/Commands/getfacl.md"

#### setfacl
:   
    --8<-- "includes/Commands/setfacl.md"

### attr

A family of commands exists to change **file attributes** on Linux file systems.


#### lsattr
:   
    --8<-- "includes/Commands/lsattr.md"

#### chattr
:   
    --8<-- "includes/Commands/chattr.md"
