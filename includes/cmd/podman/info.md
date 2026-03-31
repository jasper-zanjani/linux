!!! tip "podman"

    --8<-- "includes/cmd/podman/qrg.md"

With few exceptions, **podman** (1) exposes a command-line API that closely imitates that of Docker.
{: .annotate }

1.  

    --8<-- "includes/cmd/podman/callout.md"


The **Z** option is necessary on SELinux systems (RHEL and derivatives) when mounting volumes and tells podman to label the content with a private unshared label.
On systems running SELinux, rootless containers must be explicitly allowed to access bind mounts.
Containerized processes are not allowed to access files without a SELinux label.

## Tasks

#### Installation

--8<-- "includes/cmd/podman/tasks/install.md"

#### Systemd service

--8<-- "includes/cmd/podman/tasks/systemd-service.md"

#### Namespaces

--8<-- "includes/cmd/podman/tasks/namespaces.md"

