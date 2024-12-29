# IBM AIX

- IBM AIX is a UNIX operating system for IBM's **Power Systems** architecture.

POWER9 Family includes various servers designed for various workoloads.

[**Logical partitions**](https://www.ibm.com/docs/en/power8?topic=partitioning-logical-partition-overview) (LPAR) refer to VMs.

**Hardware Management Console** (HMC) is a hardware appliance used to configure and control one or more managed systems.

A **managed system** is a single physical server plus the resources that are connected to it, thus apparently refering to the host of the logical parititons.

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

```  


```sh
powermt display dev=all
lsdev -C
odmget -q 'name=$DISK' CuDv
```

