!!! info "Command reference"

    --8<-- "includes/cmd/dnf/reference.md"

DNF (1) is the package manager for Red Hat-based distributions.
{: .annotate }

1.  

    --8<-- "includes/cmd/dnf/callout.md"

**Repositories** are INI files placed in  **/etc/yum.repos.d/**, but they can also be displayed and manipulated from the command-line.

!!! info "Example repos"

    <div class="grid cards" markdown>

    ```ini
    --8<-- "includes/Configs/dnf/kubernetes.repo"
    ```

    ```ini
    --8<-- "includes/Configs/dnf/google-cloud-sdk.repo"
    ```

    </div>

    Some [yum variables](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/sec-using_yum_variables) can be used in repository definitions:

    - **$basearch** resolves to the base architecture of the system, equivalent to the output of `uname -m` (i.e. **x86\_64** in most cases)
    - **$releasever** refers to the release version of RHEL, for example **9Client** or **8Server**

    Custom yum variables can be placed in **/etc/yum/vars**: the variable identifier will follow the filename.

    <div class="grid cards" markdown>

    ```ini hl_lines="3"
    --8<-- "includes/Configs/dnf/docker-ce-stable.repo"
    ```


    ```ini hl_lines="5 7"
    --8<-- "includes/Configs/dnf/nexus-couchdb.repo"
    ```

    </div>


--8<-- "includes/cmd/dnf/gpg.md"

```sh title="Building packages"
# Build package dependencies
dnf builddep package.spec
```
```sh title="Resolve cache problems"
# If an error is displayed reading "Failed to synchronize cache for repo"
sudo dnf clean all
sudo rm -r /var/cache/dnf
```

