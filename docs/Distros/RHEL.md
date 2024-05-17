# RHEL

??? info "RHEL clones and derivatives"

    **CentOS** is a community distribution of Linux that was created by Gregory Kurtzer in 2004 and acquired by [Red Hat](#rhel) in 2014. 
    
    It has traditionally been [considered](https://itsfoss.com/centos-stream-fiasco/) downstream to [RHEL](#rhel), incorporating changes to RHEL after a delay of several months. 
    In fact, it is a rebuild of the publicly available **source RPMs (SRPMs)** of RHEL packages, which historically allowed CentOS maintainers to simply package and ship them [rebranded](https://fosspost.org/centos-project-suicide/).

    For years, CentOS was the [distribution of choice](https://www.zdnet.com/article/red-hat-resets-centos-linux-and-users-are-angry/#ftag=RSSbaffb68) for experienced Linux administrators who did not feel the need to pay for Red Hat's support.
    In December 2020, Red Hat [announced](https://itsfoss.com/centos-stream-fiasco/) that CentOS 8 support will end at the end of 2021 (rather than 2029), while CentOS 7 will continue to be supported until 2024. 
    This represented a shift in focus from CentOS Linux to [**CentOS Stream**](#centos-stream) and a change from a **fixed-release** (or "stable point release") to a **rolling-release** distribution model.

    **CentOS Stream** was [announced](https://itsfoss.com/centos-stream-fiasco/) in September 2019 as a distribution of CentOS maintained on a model described as "continuously delivered", organized into Streams. 
    CentOS Stream [originated](https://linuxunplugged.com/383) in an effort to get more community participation in development of RHEL, rather than merely passive consumption.

    **Fedora** is a community distribution supported by Red Hat launched as "Fedora Core" in 2003. 
    It has traditionally been [considered](https://itsfoss.com/centos-stream-fiasco/) upstream to RHEL, serving as a testing ground for new features and improvements.
    
    **Fedora CoreOS** is a Fedora edition [built](https://fedoramagazine.org/introducing-fedora-coreos/ 'Fedora Magazine: "Introducing Fedora CoreOS"') specifically for running containerized workloads securely and at scale. 
    Because containers can be deployed across many nodes for redundancy, the system can be updated and rebooted automatically without affecting uptime.
    CoreOS systems are meant to be **immutable infrastructure**, meaning they are only configured through the provisioning process and not modified in-place. 
    All systems start with a generic OS image, but on first boot it uses a system called **Ignition** to read an **Ignition config** (which is converted from a **Fedora CoreOS Config** file) from the cloud or a remote URL, by which it provisions itself, creating disk partitions, file systems, users, etc.

??? info "EX200 lab"

    ---8<-- "includes/ex200.md"


## Support

Red Hat [Support Cases](https://access.redhat.com/support/cases/) can be opened online.

## Subscriptions

Subscriptions are managed through the Red Hat [entitlement service](https://access.redhat.com/solutions/3653861), integrated with the Customer Portal.

[**Simple Content Access (SCA)**](https://access.redhat.com/articles/simple-content-access) is a capability in Red Hat's subscription tools which simplifies entitlement management by removing the need to attach subscriptions per system.

Entitlement certificates are stored as X.509 PEM certificate files in **/etc/pki/entitlement** for SCA-enabled accounts.

```sh title="Inspect entitlement certificate"
openssl x509 -text -in /etc/pki/entitlement/9012345678901234567.pem
```

#### subscription-manager
:   

    ```sh
    --8<-- "includes/Commands/s/subscription-manager.sh"
    ```

    Subscription manager is used to enable and disable RHEL repositories.

    ```sh
    # Enable Red Hat Developer Tools repos
    subscription-manager repos --enable rhel-7-server-devtools-rpms
    subscription-manager repos --enable rhel-server-rhscl-7-rpms

    # Disable them again
    subscription-manager repos --disable rhel-7-server-devtools-rpms --disable rhel-server-rhscl-7-rpms
    ```

## In-place upgrades

Red Hat recommends the use of the **leapp** utility to upgrade to a higher major version [in-place](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html-single/upgrading_from_rhel_7_to_rhel_8/index#performing-the-upgrade-from-rhel-7-to-rhel-8_upgrading-from-rhel-7-to-rhel-8).


```sh title="RHEL 7 to RHEL 8"
# Update packages and reboot
yum update -y
shutdown -r 0

# On a fresh install this repo is not enabled
subscription-manager repos --enable rhel-7-server-extras-rpms

# Install leapp upgrade package (this package apparently doesn't show up in a search)
yum install -y leapp-upgrade

# Run preupgrade checks
sudo leapp preupgrade # (1)

# Remove the kernel modules which have bene removed in RHEL 8
rmmod pata_acpi floppy

# Permit root SSH acces (run as root or use tee)
echo PermitRootLogin yes >> /etc/ssh/sshd_config

# Confirm removal of the PAM PKCS#11 module in leapp's answerfile
sudo leapp answer --section remove_pam_pkcs11_module_check.confirm=True

# Confirm all issues are resolved
sudo leapp preupgrade # (2)

# Run upgrade
sudo leapp upgrade
```

1. 
``` title="Output"
--8<-- "includes/Output/leapp/preupgrade0"
```
2. 
``` title="Output"
--8<-- "includes/Output/leapp/preupgrade1"
```

```sh title="CentOS 7 to Rocky"
# Install the elevation-release package
sudo yum install -y http://repo.almalinux.org/elevate/elevate-release-latest-el$(rpm --eval %rhel).noarch.rpm

# Install Leapp migration data packages for Rocky Linux and the upgrade utility
sudo yum install -y leapp-upgrade leapp-data-rocky

# Run preupgrade checks
sudo leapp preupgrade

# Remove the pata_acpi kernel module
sudo rmmod pata_acpi

# Permit root SSH acces (run as root or use tee)
echo PermitRootLogin yes >> /etc/ssh/sshd_config

# Confirm removal of the PAM PKCS#11 module in leapp's answerfile
sudo leapp answer --section remove_pam_pkcs11_module_check.confirm=True

# Confirm all issues are resolved
sudo leapp preupgrade

# Run upgrade
sudo leapp upgrade

# Reboot the machine
reboot
```

On boot, select the option to upgrade initramfs.
After several more additional reboots, the GRUB entries will reappear.


??? info "CPU support"

    Red Hat did not support [processors older than Haswell](https://access.redhat.com/solutions/3665141) on RHEL 8, according to a solution published at the end of 2022.

    For virtual machines and depending on the **CPU Mode**, leapp may complain that the CPU model is not supported for an upgrade to RHEL 8 while running the preupgrade report.

    Leapp checks CPU information against a table of deceprecated hardware found at [/etc/leapp/files/device_driver_deprecation_data.json](https://access.redhat.com/solutions/6984143).
    
    Virtual CPU info can be retrieved using the following command.
    CPU information is checked against the value of the above table's **device\_id** key, which contains a colon-delimited string.

    ```sh
    # These values correspond to a device_id of "x86_64:intel:6:6"
    lscpu | grep -E 'Arch|family|Model:' # (1)
    ```

    1. 
    ``` title="Output on TrueNAS"
    # CPU Mode: Custom
    --8<-- "includes/Output/lscpu/truenas-custom"

    # CPU Mode: Host Model
    --8<-- "includes/Output/lscpu/truenas-hostmodel"

    # CPU Mode: Host Passthrough
    --8<-- "includes/Output/lscpu/truenas-passthrough"
    ```

    The table appears to be installed with the package and can be manually edited.


## Applications

#### TuneD
:   
    --8<-- "includes/Tasks/tuned.md"

#### Cockpit
:   
    --8<-- "includes/Tasks/rhel-cockpit.md"

## Storage

#### Autofs
:   
    --8<-- "includes/Tasks/autofs.md"

#### Stratis
:   
    --8<-- "includes/Tasks/stratis.md"

#### VDO
:   
    --8<-- "includes/Tasks/vdo.md"

## Commands

#### dnf
:   

    --8<-- "includes/Commands/d/dnf.md"

#### firewall-cmd
:   

    --8<-- "includes/Commands/f/firewall-cmd.md"

#### httpd
:   

    --8<-- "includes/Commands/h/httpd.md"

#### podman
:   

    --8<-- "includes/Commands/p/podman.md"

#### rpm
:   

    ```sh
    --8<-- "includes/Commands/r/rpm.sh"
    ```

    --8<-- "includes/Commands/r/rpmkeys.md"

#### Stratis
:   
    --8<-- "includes/Commands/s/stratis.md"


#### VDO
:   

    --8<-- "includes/Commands/v/vdo.md"

