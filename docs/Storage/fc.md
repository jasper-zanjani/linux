# Multipath

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

WWIDs for LUNs can be obtained by executing:

```sh
multipath -ll
```

All attributes not declared in multipath.conf are taken from the multipath-tools internal database and its internal blacklist.

Display [**internal attributes**](https://ubuntu.com/server/docs/setting-up-device-mapper-multipathing)

```sh
multipath -t
```