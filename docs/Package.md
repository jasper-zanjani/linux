# Package management


## Commands

=== ":material-redhat: RHEL"

    #### dnf

    --8<-- "includes/Commands/d/dnf.md"

=== ":material-arch: Arch"

    #### pacman

    --8<-- "includes/Commands/p/pacman.md"

    --8<-- "includes/Commands/p/pacman-key.md"

=== ":material-ubuntu: Ubuntu"

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

    - [**docker-compose**](https://github.com/docker/compose/releases)

    These are checked from the command-line by downloading both the binary as well as the checksum as follows:

    ```sh
    # docker-compose
    sha256sum -c docker-compose-linux-x86_64.sha256 # => docker-compose-linux-x86_64: OK
    ```

-   #### Build packages

    ---

    === ":material-redhat: RHEL"

        --8<-- "includes/Tasks/build-rpm.md"

    === ":material-arch: Arch"

        --8<-- "includes/Tasks/build-arch.md"

</div>