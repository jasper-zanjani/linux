```sh
# Install a package, providing confirmation preemptively
dnf install -y bat

# Find the package providing the given filename
dnf provides /usr/bin/bat

# View history of dnf commands
dnf history

# View all packages installed by user
dnf history userinstalled 
```

```sh title="dnf swap"
--8<-- "includes/Commands/d/dnf-swap.sh"
```

The **download** subcommand (provided by the **dnf-plugins-core** package) allows the RPMs to be downloaded without automatic installation.

```sh title="dnf download"
dnf download rsync

dnf download --source rsync
```

##### Groups

[**Package groups**](https://docs.fedoraproject.org/en-US/quick-docs/getting-started-with-virtualization/) can be specified using the **group** command.


```sh title="dnf group"
dnf group info virtualization # (1)

dnf group install virtualization

# Include optional packages
dnf group install --with-optional virtualization
```

1. Package groups can also be specified by prefixing the package group name with **@** (only if the group name doesn't have a space in it).
```sh title="Alternative"
dnf info @virtualization

dnf install @virtualization

dnf install --with-optional @virtualization
```

Remove the configuration backend supporting the use of legacy ifcfg files in NetworkManager.

```sh title="dnf remove"
dnf remove NetworkManager-initscripts-ifcfg-rh
```



## Repositories

**Repositories** are INI files placed in  **/etc/yum.repos.d/**, but they can also be displayed and manipulated from the command-line.

```sh title="Repositories"
# Display repos
dnf repolist # -v

# Display enabled repos
dnf repolist --enabled

# Display a single repo
dnf repoinfo docker-ce-stable

# Add repo
dnf config-manager --add-repo $REPOURL

# Disable repo
dnf config-manager --set-disabled $REPONAME

# Enable repo (in this case a preexisting repo kept disabled by default)
dnf config-manager --enable zfs-testing
```

#### Example repos

<div class="grid cards" markdown>

-   ##### Kubernetes

    ---

    ```ini
    --8<-- "includes/Config/dnf/kubernetes.repo"
    ```

-   ##### gcloud CLI

    ---

    ```
    --8<-- "includes/Config/dnf/google-cloud-sdk.repo"
    ```

</div>

Some [yum variables](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/sec-using_yum_variables) can be used in repository definitions:

- **$basearch** resolves to the base architecture of the system, equivalent to the output of `uname -m` (i.e. **x86\_64** in most cases)
- **$releasever** refers to the release version of RHEL, for example **9Client** or **8Server**

```ini hl_lines="3"
--8<-- "includes/Config/dnf/docker-ce-stable.repo"
```

Custom yum variables can be placed in **/etc/yum/vars**: the variable identifier will follow the filename.

```ini hl_lines="5 7"
--8<-- "includes/Configs/dnf/nexus-couchdb.repo"
```

1. 
``` title="/etc/yum/vars/nexussrc"
nexus01.st.pods.com
```

## Tasks

<div class="grid cards" markdown>

-   #### Configuration

    ---

    Global dnf configuration is stored in either **/etc/yum.conf** or **/etc/dnf.conf**.

    ```ini
    [main]
    ; Exclude packages from updates permanently
    exclude=kernel* php*

    ; Suppress confirmation
    assumeyes=True
    ```

    ```sh
    # Display configuration (run as root)
    dnf config-manager --dump
    ```

-   #### Modules

    [**Modules**](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/installing_managing_and_removing_user-space_components/introduction-to-modules_using-appstream) are special package groups representing an application, runtime, or a set of tools that are installed together. 
    These are made available on the AppStream repository on RHEL.

    Modules are made available by **stream**, or version, and by **profile**, or purpose (i.e. client, server, common, devel, etc).

    ```sh
    # Display available streams and profiles of the nodejs module
    dnf module list nodejs # (1)

    # Install Nodejs stream 16, default profile (common)
    dnf module install nodejs:16

    # Install Nodejs stream 16, development profile
    dnf module install nodejs:16/development
    ```

    1. 
    ``` title="Output on Fedora 38"
    Fedora Modular 38 - x86_64
    Name           Stream         Profiles                                 Summary                   
    nodejs         16             common [d], development, minimal         Javascript runtime        

    Fedora Modular 38 - x86_64 - Updates
    Name           Stream         Profiles                                 Summary                   
    nodejs         16             common [d], development, minimal         Javascript runtime      
    ```

-   #### Building packages

    ---

    ```sh
    # Build package dependencies
    dnf builddep package.spec
    ```

-   #### System upgrade

    ---

    Packages are downloaded into subdirectories of **/var/lib/dnf/system-upgrade**

    ```sh
    dnf system-upgrade download --releasever 38

    dnf system-upgrade reboot

    # Show logs from last upgrade attempt
    dnf system-upgrade log --number=1
    ```

    ??? info "system-upgrade plugin"

        The DNF [**system-upgrade**](https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/) plugin provides three commands:

        - system-upgrade
        - offline-upgrade
        - offline-distrosync

</div>