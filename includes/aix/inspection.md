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
