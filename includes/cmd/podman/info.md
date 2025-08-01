With few exceptions, podman exposes a command-line API that closely imitates that of Docker.

Podman supports pulling from various repos using aliases that are defined in **/etc/containers/registries.conf.d**.
RHEL and derivative distributions support additional aliases, some of which reference images that require a [login](https://access.redhat.com/RegistryAuthentication#red-hat-registries-1).

For example, Red Hat offers a Python 2.7 runtime from the RHSCL ([Red Hat Software Collections](https://developers.redhat.com/products/softwarecollections/overview)) repository on registry.access.redhat.com, which does not require authentication.
However, Python 3.8 is only available from registry.redhat.io, which does.
Interestingly, other Python runtimes are available from the ubi7 and ubi8 repos from unauthenticated registries.

Container images are stored in **~/.local/share/containers/storage**.
```sh
# Alias to registry.access.redhat.com/rhscl/httpd-24-rhel7
podman pull rhscl/httpd-24-rhel7
```

The **Z** option is necessary on SELinux systems (RHEL and derivatives) when mounting drives and tells podman to label the content with a private unshared label.
On systems running SELinux, rootless containers must be explicitly allowed to access bind mounts.
Containerized processes are not allowed to access files without a SELinux label.


```sh
# Display mapped ports
podman port -a
```



## Tasks

#### Examples

```sh title="Nginx"
podman run -d -v=/home/jasper/notes/site:/usr/share/nginx/html -p=8080:80 --name=notes nginx
```

```sh title="Apache"
podman run -d -v=/home/jasper/notes/site:/usr/local/apache2/htdocs -p=8080:80 --name=notes httpd-24
```

```sh title="Azure Cosmos DB Emulator"
podman pull mcr.microsoft.com/cosmosdb/linux/azure-cosmos-emulator:vnext-preview
podman run -d -p 8081:8081 -p 1234:1234 azure-cosmos-emulator:vnext-preview
```

#### Output


`--format` takes a space-delimited list of field names (ref. `man podman-ps`) within mustache syntax

```sh
# Display only container IDs
podman ps --format "{{.ID}}"
```

#### Systemd service

--8<-- "includes/cmd/podman/systemd-service.md"

