# Package management

#### dnf

--8<-- "includes/cmd/dnf/info.md"


#### pacman

--8<-- "includes/Commands/p/pacman.md"

--8<-- "includes/Commands/p/pacman-key.md"


#### apt

--8<-- "includes/Commands/a/apt.md"

--8<-- "includes/Commands/a/add-apt-repository.md"

--8<-- "includes/Commands/a/apt-key.md"


#### flatpak
:   
    --8<-- "includes/Commands/f/flatpak.md"



#### snap
:   
    --8<-- "includes/Commands/s/snap.md"

## Tasks

<div class="grid cards" markdown>

-   #### Verify package

    ---

    Many packages are provided for download alongside SHA256 checksums, for example:

    -   [docker-compose](https://github.com/docker/compose/releases)
    -   [act](https://github.com/nektos/act)

    These are checked from the command-line by downloading both the binary as well as the checksum as follows (note that it is the **checksum file** that is checked, not the original file):

    ```sh
    sha256sum -c docker-compose-linux-x86_64.sha256 # (1) 
    ```

    1.  

        ``` title="Output"
        docker-compose-linux-x86_64: OK
        ```

    If checksums for multiple releases are provided in the same file (i.e. [act's releases](https://github.com/nektos/act/releases) which provide a checksums.txt) then the `--ignore-missing` option can be added to suppress errors for files that are not present.

    ```sh
    sha256sum -c --ignore-missing checksums.txt
    ```

-   #### Build packages

    ---

    === ":material-redhat: RHEL"

        --8<-- "includes/Tasks/build-rpm.md"

    === ":material-arch: Arch"

        --8<-- "includes/Tasks/build-arch.md"

</div>
