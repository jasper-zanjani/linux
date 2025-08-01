=== ":material-fedora: Fedora"

    On RHEL, **podman** can be installed as a package or as part of a module

    ```sh
    dnf module install container-tools
    ```


=== ":material-arch: Arch"

    On Arch, **/etc/subuid** and **/etc/subgid** have to be [set](https://wiki.archlinux.org/title/Podman#Set_subuid_and_subgid).
    These are colon-delimited files that define the ranges for namespaced UIDs and GIDs to be used by each user. 
    Conventionally, these ranges begin at 100,000 (for the first, primary user) and contain 65,536 possible values.

    ```
    terry:100000:65536
    alice:165536:65536
    ```

    Then podman has to be migrated

    ```sh
    podman system migrate
    ```

