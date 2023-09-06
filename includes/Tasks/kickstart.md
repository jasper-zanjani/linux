**Kickstart** is an advanced way to automate the installation of RHEL and clones.
It depends on a plaintext kickstart file with a unique syntax that specifies all necessary installation and configuration options for the installation.

## Tasks

#### Authoring
:   
    Various methods exist for authoring kickstart files:

    - It may be easiest to develop a kickstart file from a successful graphical installation from the kickstart file automatically saved at **/root/anaconda-ks.cfg**.
    - A [Kickstart Generator web application](https://access.redhat.com/labs/kickstartconfig/) is available to generate a kickstart file from various configuration settings.
    - A [Kickstart converter web application](https://access.redhat.com/labs/kickstartconvert/) also exists to convert kickstart files used with RHEL 7 or 8 to newer versions.
    - A kickstarter file can be [validated](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/performing_an_advanced_rhel_9_installation/maintaining-kickstart-files_installing-rhel-as-an-experienced-user#verifying-a-kickstart-file_maintaining-kickstart-files) withe the **ksvalidator** command (available after installing **pykickstart**).


    ??? info "RHEL8 installation kickstart"

        ```sh
        --8<-- "includes/Configs/anaconda-ks.cfg"
        ```


#### Usage
:   
    The kickstart file is provided to a system booting from installation on boot with the [**inst.ks=**](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/performing_an_advanced_rhel_9_installation/starting-kickstart-installations_installing-rhel-as-an-experienced-user#starting-a-kickstart-installation-manually_starting-kickstart-installations) kernel parameter (note this has to be placed on the same line as the vmlinuz).
    Note the line specifying static IP settings to establish basic connectivity using the [**ip=** kernel command-line parameter](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/sec-configuring_ip_networking_from_the_kernel_command_line).

    ```sh hl_lines="3"
    linuxefi /images/pxeboot/vmlinuz inst.stage2=hd:LABEL=Fedora-S-dvd-x86_64-38 quiet\
        ip=192.168.0.200::192.168.0.1:255.255.255.0::ens3:off\
        inst.ks=http://192.168.0.3/kickstart.cfg
    ```

## Commands

### Configuration

#### auth
:   
    [**auth**](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/performing_an_advanced_rhel_9_installation/kickstart-commands-and-options-reference_installing-rhel-as-an-experienced-user#auth-or-authconfig-deprecated_kickstart-commands-for-system-configuration) or **authconfig** commands set up authentication options, but have been deprecated since RHEL8.

    ```sh
    auth --enableshadow --passalgo=sha512
    ```

#### network
:   
    [**network**](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/performing_an_advanced_rhel_9_installation/kickstart-commands-and-options-reference_installing-rhel-as-an-experienced-user#network_kickstart-commands-for-network-configuration) allows network configuration.
    Note that the nameserver option may be desirable for some distributions like Fedora whose minimal installation neither configures the DNS server nor provides basic troubleshooting tools like nslookup or nmtui.

    ```sh
    network --device=ens3 --hostname=kickstart --bootproto=static --ip=192.168.0.200 --netmask=255.255.255.0 --gateway=192.168.0.1 --nameserver=192.168.0.1
    
    # From PODS configuration
    network  --bootproto=static --device={{ distributions[target_os]['device'] }} --gateway={{ target_gateway }} --ip={{ lookup('dig',host) }} --nameserver={{ dns_servers }} --netmask={{ default_netmask }} --onboot=on --ipv6=auto --activate 
    network --hostname={{ host }}

    ```

#### %packages
:   
    [**%packages**](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/performing_an_advanced_rhel_9_installation/kickstart-script-file-format-reference_installing-rhel-as-an-experienced-user#package-selection-section_package-selection-in-kickstart) can specify a list of package and group names for installation. The list is terminated by **%end**

    Note that packages must exist within the ISO, so minimal or server installation ISOs may not have all packages, and will demand interactive authorization to proceed.

    ```sh
    %packages
    @^minimal-environment
    kexec-tools
    %end
    ```


#### %post
:   

    ```sh
    # This example, from the RHEL8 Kickstart template, installs RPM packages and changes various configuration files with sed
    %post
    rpm -ivh http://{{ kickstart_hosts[hostvars[host]['datacenter']] }}:8080/rpms/podscatrust-1.2.5-43940.x86_64.rpm
    rpm -ivh http://{{ kickstart_hosts[hostvars[host]['datacenter']] }}:8080/rpms/PODSDevOpsCI-1.0.0-1.x86_64.rpm
    cp /etc/chrony.conf /etc/chrony.conf.orig
    sed -i -e '/server 0/ i server {{ ntp_list | first }} iburst' -e '/server [0-3]/s/^/#/g' /etc/chrony.conf
    cp /etc/ssh/sshd_config /etc/ssh/sshd_config.orig
    sed -i -e 's,#\(Port 22\),\1,g' -e 's,#\(PermitRootLogin yes\),\1,g' -e 's/PermitRootLogin yes/PermitRootLogin no/g' -e 's,#\(MaxAuthTries 6\),\1,g' -e 's/MaxAuthTries 6/MaxAuthTries 3/g' /etc/ssh/sshd_config
    %end
    ```


#### pwpolicy
:   
    [**pwpolicy**](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/performing_an_advanced_rhel_9_installation/kickstart-commands-and-options-reference_installing-rhel-as-an-experienced-user#pwpolicy_commands-used-in-anaconda), which is deprecated, allows password policy to be set.
    Note that it is required to be used in an [**%anaconda**](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/performing_an_advanced_rhel_9_installation/kickstart-commands-and-options-reference_installing-rhel-as-an-experienced-user#commands-used-in-anaconda_kickstart-commands-and-options-reference) block.

    ```sh
    # Loosely enforce a minimum length of 6 characters, disallowing changes for passwords set in the Kickstart file
    # The --minquality option refers to password quality as verified by the libpwquality package
    %anaconda
    pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
    pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
    pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
    %end
    ```


#### [services](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/performing_an_advanced_rhel_9_installation/kickstart-commands-and-options-reference_installing-rhel-as-an-experienced-user#services_kickstart-commands-for-system-configuration)
:   

    ```sh
    services --enabled=serial-getty@ttyS0
    ```

#### [timezone](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/performing_an_advanced_rhel_9_installation/kickstart-commands-and-options-reference_installing-rhel-as-an-experienced-user#timezone-required_kickstart-commands-for-system-configuration)
:   

    ```sh title="timezone"
    # Eastern time zone
    timezone America/New_York --isUtc

    # PODS
    timezone UTC --isUtc
    ```

#### [user](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/performing_an_advanced_rhel_9_installation/kickstart-commands-and-options-reference_installing-rhel-as-an-experienced-user#user_kickstart-commands-for-system-configuration)
:   

    ```sh title="user"
    # Plaintext password
    user --groups=wheel --name=jasper --password=Password123 --plaintext

    # Encrypted password
    user --groups=wheel --name=jasper --password=$6$3wgcV.qumT2uSBt0$ex5.eaaHaWJazm5hBx68GAP21DnL.7tjLLljz0lf7abk37UdoobCRipiJ1lwJWkscWBUZV6rDIVRsRCxkbh1Z. --iscrypted # (1)
    ```

    1. An encrypted password like this can be generated in Python, according to the Kickstart documentation, although the **crypt** module itself which is used in this example is deprecated.
    ```py
    --8<-- "includes/Tasks/encrypt-password.py
    ```

### Storage

[Disk partitioning](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/performing_an_advanced_rhel_9_installation/kickstart-commands-and-options-reference_installing-rhel-as-an-experienced-user#kickstart-commands-for-handling-storage_kickstart-commands-and-options-reference) forms an important part of the Kickstart commands:

```sh title="PODS disk partitioning"
ignoredisk --only-use=sda
# System bootloader configuration
bootloader --append="crashkernel=auto" --location=mbr --boot-drive=sda
# Partition clearing information
clearpart --all --initlabel --drives=sda
# Disk partitioning information
part /boot --fstype="xfs" --ondisk=sda --size=2048
part pv.59 --fstype="lvmpv" --ondisk=sda --size=79871 --grow
volgroup rhel_{{ host.split('.')[0] }} --pesize=4096 pv.59
logvol /  --fstype="xfs" --grow --size=4096 --name=root --vgname=rhel_{{ host.split('.')[0] }}
logvol swap  --fstype="swap" --size=32764 --name=swap --vgname=rhel_{{ host.split('.')[0] }}
```

#### [bootloader](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/performing_an_advanced_rhel_9_installation/kickstart-commands-and-options-reference_installing-rhel-as-an-experienced-user#bootloader-required_kickstart-commands-for-handling-storage)
:   

    ```sh title="bootloader"
    # Add a command-line parameter, specifying Master Boot Record and a device
    bootloader --append="crashkernel=auto" --location=mbr --boot-drive=sda
    ```

#### [clearpart](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/performing_an_advanced_rhel_9_installation/kickstart-commands-and-options-reference_installing-rhel-as-an-experienced-user#clearpart_kickstart-commands-for-handling-storage)
:   

    ```sh title="clearpart"
    # Clear all partitions, creating a default disk label 
    clearpart --all --initlabel --drives=sda
    ```

#### [ignoredisk](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/performing_an_advanced_rhel_9_installation/kickstart-commands-and-options-reference_installing-rhel-as-an-experienced-user#ignoredisk_kickstart-commands-for-handling-storage)
:   

    ```sh title="ignoredisk"
    # Specify a list of disks to use.
    ignoredisk --only-use=vda

    # PODS
    ignoredisk --only-use=sda
    ```

#### [logvol](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/performing_an_advanced_rhel_9_installation/kickstart-commands-and-options-reference_installing-rhel-as-an-experienced-user#logvol_kickstart-commands-for-handling-storage)
:   

    ```sh title="logvol"
    # Create two logical volumes
    # Note the volume group name contains a Jinja2 template that will be interpolated with the hostname
    logvol /  --fstype="xfs" --grow --size=4096 --name=root --vgname=rhel_{{ host.split('.')[0] }}
    logvol swap  --fstype="swap" --size=32764 --name=swap --vgname=rhel_{{ host.split('.')[0] }}
    ```

#### [part](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/performing_an_advanced_rhel_9_installation/kickstart-commands-and-options-reference_installing-rhel-as-an-experienced-user#part-or-partition_kickstart-commands-for-handling-storage)
:   
    **part** or **partition** are required commands that create partitions.

    ```sh
    # Create boot and LVM partitions
    part /boot --fstype="xfs" --ondisk=sda --size=2048
    part pv.59 --fstype="lvmpv" --ondisk=sda --size=79871 --grow
    ```

#### [volgroup](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/performing_an_advanced_rhel_9_installation/kickstart-commands-and-options-reference_installing-rhel-as-an-experienced-user#volgroup_kickstart-commands-for-handling-storage)
:   

    ```sh
    # Create a named volume group from a previously created LVM physical volume (partition created above)
    # Note that this example uses a Jinja2 template that will be interpolated with the hostname.
    volgroup rhel_{{ host.split('.')[0] }} --pesize=4096 pv.59
    ```
