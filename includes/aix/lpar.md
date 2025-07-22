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

