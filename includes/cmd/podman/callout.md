**Installation**

--8<-- "includes/cmd/podman/tasks/install.md"

**Directories**

-   Repo aliases: **/etc/containers/registries.conf.d** 
    (RHEL and derivative distributions support additional aliases, some of which reference images that require a [login](https://access.redhat.com/RegistryAuthentication#red-hat-registries-1).
    For example, Red Hat offers a Python 2.7 runtime from the RHSCL ([Red Hat Software Collections](https://developers.redhat.com/products/softwarecollections/overview)) repository on registry.access.redhat.com, which does not require authentication.
    However, Python 3.8 is only available from registry.redhat.io, which does.
    Interestingly, other Python runtimes are available from the ubi7 and ubi8 repos from unauthenticated registries.)
-   Container images: **\$HOME/.local/share/containers/storage**


