View history of dnf commands

```sh
dnf history
dnf history userinstalled # View all packages installed by user
```

[**Package groups**](https://docs.fedoraproject.org/en-US/quick-docs/getting-started-with-virtualization/) can be specified using the **group** command or by prefixing the package group name with **@** (only if the group name doesn't have a space in it).

```sh
dnf group info virtualization
dnf info @virtualization

dnf group install virtualization
dnf install @virtualization

# Include optional packages
dnf install --with-optional @virtualization
```

Remove the configuration backend supporting the use of legacy ifcfg files in NetworkManager.
```sh
dnf remove NetworkManager-initscripts-ifcfg-rh
```

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

Global dnf configuration is stored in either **/etc/yum.conf** or **/etc/dnf.conf**.

```ini
[main]
; Exclude packages from updates permanently
exclude=kernel* php*
; Suppress confirmation
assumeyes=True
```

The configuration can be dumped from the command-line (as root)
```sh
dnf config-manager --dump
```

**Repositories** are INI files placed in  **/etc/yum.repos.d/**, but they can also be displayed and manipulated from the command-line.

```sh title="Repositories"
# Display repos
dnf repolist # -v

# Display enabled repos
dnf repolist --enabled

# Display a single repo
dnf repoinfo docker-ce-stable

# Add repo
dnf config-manager --add-repo $REPO-URL

# Disable repo
dnf config-manager --set-disabled $REPO-NAME

# Enable repo (in this case an experimental ZFS repo kept disabled by default)
dnf config-manager --enable zfs-testing
```

```ini title="Example repos"
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg

[google-cloud-sdk]
name=Google Cloud SDK
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
```

Some [yum variables](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/sec-using_yum_variables) can be used in repository definitions:

- **$basearch** resolves to the base architecture of the system, equivalent to the output of `uname -m` (i.e. **x86\_64** in most cases)
- **$releasever** refers to the release version of RHEL, for example **9Client** or **8Server**

```ini hl_lines="3"
[docker-ce-stable]
name=Docker CE Stable - $basearch
baseurl=https://download.docker.com/linux/fedora/$releasever/$basearch/stable
enabled=1
gpgcheck=1
gpgkey=https://download.docker.com/linux/fedora/gp
```

Custom yum variables can be placed in **/etc/yum/vars**: the variable identifier will follow the filename.

```ini hl_lines="5 7"
[nexus-couchdb]
name = Couchdb - Nexus Repository
enabled = 1
gpgcheck = 1
baseurl = https://$nexussrc/repository/couchdb.el8/ # (1)
ui_repoid_vars = releasever basearch
gpgkey = https://$nexussrc/repository/couchdb-artifacts/repo/keys.asc https://$nexussrc/repository/couchdb-artifacts/repo/rpm-package-key.asc
priority = 1
```

1. 
``` title="/etc/yum/vars/nexussrc"
nexus01.st.pods.com
```