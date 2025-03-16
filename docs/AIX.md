![](aix.svg){: align=right }

# IBM AIX

*[ASMI]: Advanced System Management Interface
*[ESA]: Electronic Service Agent
*[HMC]: Hardware Management Console
*[ISA]: instruction set architecture
*[SMIT]: Service Management Interface Tool


[AIX](https://www.ibm.com/products/aix) (Advanced Interactive eXecutive) is IBM's proprietary UNIX operating system for IBM's Power server family.
[Power](https://www.ibm.com/power) servers run on Power processors and are capable of running IBM AIX, IBM i, and Linux.

??? info "History"

    - AIX Version 1 was released in 1986 for the IBM RT PC (RISC Technology Personal Computer), a family of workstations based on RISC architecture and IBM's proprietary ROMP processor.
    AIX stood for Advanced Interactive eXecutive.
    - AIX Version 2 followed the next year.
    - AIX Version 3 was released n 1990 for the POWER-based [RS/6000](https://en.wikipedia.org/wiki/IBM_RS/6000) platform, also based on RISC architecture, and which was eventually renamed IBM Power Systems.
    - AIX Version 4 was released in 1994. Version 4.1 was used as the basis for the Apple Network Server line.
    - AIX 5 was released in 2001.
    - AIX 6 was released in 2007.
    - AIX 7 was released in 2010. Currently supported versions of AIX are 7.2 and 7.3. AIX 7.1 offers extended support.

    The [PowerPC](https://en.wikipedia.org/wiki/PowerPC) ISA is a RISC architecture introduced by an industrial alliance between Apple, IBM, and Motorola and based on the earlier [IBM POWER architecture](https://en.wikipedia.org/wiki/IBM_POWER_architecture).
    POWER is an acronym for "Performance Optimization With Enhanced RISC".
    It is well known as being the architecture behind Apple's desktop and laptop computers from 1994 until 2006.
    
    IBM POWER architecture was abandoned in the late 1990s when IBM used the PowerPC ISA for the [POWER3](https://en.wikipedia.org/wiki/POWER3) processor.

    PowerPC evolved into Power ISA v3.0 in 2006 and is now governed by the [OpenPOWER Foundation](https://en.wikipedia.org/wiki/OpenPOWER_Foundation), which in turn became part of the Linux Foundation in 2019.

??? info "Documents"

    -   Redbooks

        -   [IBM Power Systems **S922**, S914, and S924 Technical Overview and Introduction](https://www.redbooks.ibm.com/abstracts/redp5497.html)
        -   [IBM Power S1014, S1022s, **S1022** and S1024 Technical Overview and Introduction](https://www.redbooks.ibm.com/abstracts/redp5675.html)
        -   [IBM Power E1080 Technical Overview and Introduction](https://www.redbooks.ibm.com/abstracts/redp5649.html)

    -   AIX PDFs

        - [7.3](https://www.ibm.com/docs/en/aix/7.3)
        - [7.2](https://www.ibm.com/docs/en/aix/7.2)


[**Logical partitions**](https://www.ibm.com/docs/en/power8?topic=partitioning-logical-partition-overview) (LPAR) refer to VMs.

**Hardware Management Console** (HMC) is a hardware appliance used to configure and control multiple Power Systems servers.

A **managed system** is a single physical server plus the resources that are connected to it, thus apparently refering to the host of the logical parititons.

A **stanza file** is a file format typical to configs in AIX, exemplified by **/etc/filesystems**, **/etc/security/user**, etc

```sh
# Display logical partitions
lssyscfg -m sys852 -r lpar -F name:state

# Display hardware resources of a 
lshwres -r mem -m sys852 --level sys

# See how many cores are available
lshwres -r proc -m sys852 --level sys

# See I/O related information
lshwres -r io --rsubtype slot -m sys852

# Turn on a logical partition, using the normal partition profile, booting into SMS menu
chsysstate -m sys852 -r lpar -o on -f normal -b sms -n sys8521-s1-lpar2

# Take control of the newly booted logical partition
vtmenu

# Alternatively 
mkvterm
```

**Virtual I/O Server (VIOS)** is a partition on Power Systems servers that handles virtual I/O.

**Virtual target devices** (VTD) refer to emulated hardware, such as optical drives or disks.

[VIOS commands](https://www.ibm.com/docs/en/power7?topic=commands-alphabetical-list)


```sh title="VIOS"
# Display mapping of physical and virtual cards for all logical partitions
lsmap -all

# Map virtual fibre channel adapter to physical fibre channel port
vfcmap

# Display volume groups
lsvg

# Inspect a given volume group
lsvg -lv datavg

# Display logical volume
lslv s2-lpar1

# Create the virtual media repository
mkrep

# Display repositories
lsrep
```

```sh
powermt display dev=all
lsdev -C
odmget -q 'name=$DISK' CuDv
```

## Tasks

!!! info "IBM Cloud"

    --8<-- "includes/Commands/i/ibmcloud.md"

<div class="grid cards" markdown>

-   #### Inspection

    ---

    Use [oslevel](https://www.ibm.com/docs/en/aix/7.2?topic=o-oslevel-command) to check AIX version information of a running system, including base operating system, technology level, and service pack.

    ```sh title="Check AIX version"
    oslevel     # => 7.2.0.0
    oslevel -s  # => 7200-05-08-2420 (1)

    # Displays only major version
    uname -v    # => 7
    ```

    1. 
        -   **7200** base level (OS Version 7.2)
        -   **05** technology level (formerly maintenance level)
        -   **08** service pack
        -   **2420** build sequence identifier, used to determine valid technology levels and service packs that can be applied to the current level (20th week of the year 2024)

    ---

    Get help with man, just like Linux.

    ```sh
    # Create the whatis database
    catman -w
    ```

    ---

    ```sh
    # Display a brief help message for new users
    help

    # Display machine type
    uname -M

    # Provide much more detailed system information
    prtconf
    ```

    Some commands like lshwres are actually HMC utilities.

    ---

    **/etc/filesystems** contains information for automatically loaded mountpoints (similar to /etc/fstab).

    ```sh
    # Display filesystems in terms of GB
    df -g # (1)
    ```

    1.  

        ``` title="All AIX servers will contain the following filesystems"
        Filesystem    GB blocks      Free %Used    Iused %Iused Mounted on
        /dev/hd4           0.09      0.05   50%     3024    22% /
        /dev/hd2           2.38      0.29   88%    42248    37% /usr
        /dev/hd9var        0.19      0.15   19%      922     3% /var
        /dev/hd3           0.25      0.25    2%       39     1% /tmp
        /dev/hd1           0.03      0.03    2%        7     1% /home
        /dev/hd11admin     0.12      0.12    1%        5     1% /admin
        /proc                 -         -    -        -      - /proc
        /dev/hd10opt       0.81      0.06   93%    11526    42% /opt
        ```

    AIX uses LVM which is similar to its Linux cousin only in principle.
    In AIX LVM, physical volumes form volume groups, which are then divided into **Physical Partitions** (PP).
    Each PP in turn points to a **Logical Partition**.
    Logical Volumes (LV) are then mounted across logical partitions.
    This architecture is credited for AIX's flexibility in terms of managing storage.

    ```sh
    # Display physical volumes
    lspv 

    # Display volume groups
    lsvg

    # Display details of a volume group
    lsvg rootvg

    # Display mounted filesystems that belong to a specified volume group
    lsvgfs rootvg
    ```

    Use [chdev](https://www.ibm.com/docs/en/aix/7.2?topic=c-chdev-command) to convert a disk device to a physical volume by assigning it a PVID.

    ```sh
    # Assign PVID
    chdev -l hdisk0 -a pv=yes

    # Clear PVID
    chdev -l hdisk0 -a pv=clear
    ```


-   #### Service management

    ---

    The startsrc and stopsrc utiltiies are used to start and stop daemons.

    ```sh
    stopsrc -s sshd
    startsrc -s sshd
    ```

-   #### User administration

    ---

    
    [smitty](https://www.ibm.com/docs/en/aix/7.2?topic=s-smitty-command) is a TUI application that facilitates system management and is most typically used for adding or changing users.

    ```sh
    smitty user
    ```

    - [mkuser](https://www.ibm.com/docs/en/aix/7.2?topic=m-mkuser-command) creates a new user.
    Various values can be provided inline to override defaults specified in **/usr/lib/security/mkuser.default**.
    The default group is **staff**.
    
    - [lsuser](https://www.ibm.com/docs/en/aix/7.2?topic=m-lsuser-command) can be used to inspect a user's details.

    - [rmuser](https://www.ibm.com/docs/en/aix/7.2?topic=m-rmuser-command) removes a user

    ```sh
    # Change shell
    chsh
    ```
    

    ---
    

    #### ESA


    ESA is a hardware monitoring tool that is integrated with IBM Support.

    ```sh
    # Open Electronic Service Agent main panel
    smit esa_main
    ```

    [esacli](https://www.ibm.com/docs/en/aix/7.2?topic=commands-esacli) and other ESA commands are located in **/usr/esa/bin** (not in the path by default).

    ```sh
    esacli status
    ```

</div>
