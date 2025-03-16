# Multipath

*[FCoE]: Fiber Channel over Ethernet
*[HBA]: Host Bus Adapter
*[LUN]: SCSI Logical Unit Number
*[SAN]: storage area network
*[WWN]: World Wide Name
*[WWID]: World Wide Identifier

??? info "Fibre Channel"

    [**Fibre Channel**](https://en.wikipedia.org/wiki/Fibre_Channel) (FC) is a high-speed data transfer protocol providing lossless delivery of raw block data.

    FC is made of dedicated equipment, including adapters, cables, and switches, which make up the FC **fabric**.
    It uses [**multimode fiber**](https://en.wikipedia.org/wiki/Multi-mode_optical_fiber), specifically categories OM2, OM3, and OM4 to achieve bandwidths of 8,16, 32, or 64 Gbps
    It was originally developed to carry exclusively SCSI messaging, but now it can use SCSI and NVMe commands to access storage.

    Similar to iSCSI, the client is referred to as the Initiator and the storage system is the Target.
    FC switches have domain IDs that are used to identify them in the fabric and which are automatically assigned by the **principal switch**, which is automatically elected.

    **Fibre Channel over Ethernet** (FCoE) refers to equipment that transmits SAN traffic over the same equipment used for LAN traffic.
    This works by encapsulating FC packets within Ethernet packets, and requires the use of a **converged network adapter**.

    RHEL8 provides native FC [drivers](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/managing_storage_devices/using-fibre-channel-devices_managing-storage-devices):

    - lpfc
    - qla2xxx
    - zfcp

A [**SAN**](https://en.wikipedia.org/wiki/Storage_area_network) is a dedicated network for network storage.

SAN network devices move data between the **initiator**, or the HBA port of a server, and a **target**, the port of a storage device.
SANs have their own networking devices such as SAN switches.
Servers that allow access to the SAN and its storage devices form the _host layer_ of the SAN and have HBAs.


Various protocols exist to form SAN networks, such as [FCoE](https://en.wikipedia.org/wiki/Fibre_Channel_over_Ethernet) and [iSCSI](https://en.wikipedia.org/wiki/ISCSI).

WWN or WWID is a unique identifier used in storage technologies including Fibre Channel, SCSI, SATA, and SAS

The architecture of a SAN network includes HBAs on the server and storage controllers on the storage hardware.

## Tasks

<div class="grid cards" markdown>

-   #### Installation

    === ":material-fedora: Fedora"

        ```sh
        dnf install -y device-mapper-multipath
        ```

    #### Setup

    ```sh
    # Display host bus adapters
    lspci | grep -i hba

    # Display... something
    ls /sys/class/fc_host/host*/port_name
    ```



</div> 

#### multipath.conf

Default configuration values for multipath can be overriden by editing **/etc/multipath.conf**.
Configuration entries take the following form:

```conf
<section> {
       <attribute> <value>
       ...
       <subsection> {
              <attribute> <value>
              ...
       }
}
```

```sh
# Create config file, if it doesn't already exist
mpathconf --enable
```

Add new alias

```conf
multipaths {
    multipath {
        wwid ...
        alias ORAu01
        path_grouping_policy failover
    }
}
```

The multipath topology can be displayed with the following command.

```sh
multipath -ll # (1)
```

1. 

    ``` title="Output"
    mpatha (3600d0230000000000e13954ed5f89300) dm-4 WINSYS,SF2372
    size=233G features='1 queue_if_no_path' hwhandler='0' wp=rw
    `-+- policy='service-time 0' prio=1 status=active
      `- 6:0:0:0 sdf 8:80 active ready running
    ```

    -   Multipath device information:

        - `mpatha (3600d0230000000000e13954ed5f89300)`: alias (wwid if it’s different from the alias)
        - `dm-4`: dm device name
        - `WINSYS,SF2372`: vendor, product
        - `size=233G`: size
        - `features='1 queue_if_no_path'`: features
        - `hwhandler='0'`: hardware handler
        - `wp=rw`: write permissions 

    - Path group information:

        - `policy='service-time 0'`: scheduling policy
        - `prio=1`: path group priority
        - `status=active`: path group status 

    - Path information:

        - `6:0:0:0`: host:channel:id:lun
        - `sdf`: devnode
        - `8:80`: major:minor numbers
        - `active`: dm status
        - `ready`: path status
        - `running`: online status 


All attributes not declared in multipath.conf are taken from the multipath-tools internal database and its internal blacklist.

Display [**internal attributes**](https://ubuntu.com/server/docs/setting-up-device-mapper-multipathing)

```sh
multipath -t
```
