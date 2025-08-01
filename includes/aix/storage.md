AIX uses LVM which is similar to its Linux cousin only in principle.
In AIX LVM, physical volumes form volume groups, which are then divided into **Physical Partitions** (PP).
Each PP in turn points to a **Logical Partition**.
Logical Volumes (LV) are then mounted across logical partitions.
This architecture is credited for AIX's flexibility in terms of managing storage.

```sh title="Storage information"
# Display filesystems in terms of GB
df -g # (1)

# List physical volumes with UUID numbers
lspv -u 

# Display volume groups
lsvg

# Display logical volumes
lslv

# List filesystems
lsfs 

# Display details of a volume group
lsvg rootvg

# Display mounted filesystems that belong to a specified volume group
lsvgfs rootvg
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


**/etc/filesystems** contains information for automatically loaded mountpoints (similar to /etc/fstab).

Use [chdev](https://www.ibm.com/docs/en/aix/7.2?topic=c-chdev-command) to convert a disk device to a physical volume by assigning it a PVID.

```sh
# Assign PVID
chdev -l hdisk0 -a pv=yes

# Clear PVID
chdev -l hdisk0 -a pv=clear
```

