*[KVM]: Kernel-based Virtual Machine

# Virtualization

The typical virtualization stack on Linux is referred to as **QEMU**/**KVM**; both of these are separate technologies.

- **KVM**{: #kvm } is a FreeBSD and Linux kernel module that allows the kernel to function as a hypervisor, first merged into kernel [2.6.20](https://kernelnewbies.org/Linux_2_6_20#Virtualization_support_through_KVM).
- **QEMU** is an open-source emulator that interoperates with KVM to run VMs at near-native speed when the guest architecture is the same as that of the host.

**libvirt** is an open-source API, daemon, and management tool for managing virtualization.
It is a C toolkit to interact with the virtualization capabilities of the Linux KVM module, but it can also be used with KVM along with other virtualization technologies like QEMU.


## Tasks

```sh title="Check CPU for virtualization support"
# AMD CPUs will have "svm" in the flags section, whereas Intel CPUs will have "vmx"
grep -E 'svm|vmx' /proc/cpuinfo
```

#### Virtual machine
:   
    The easiest way to create a **domain**{: #domain } (libvirt's term for a guest VM) is with the [**Boxes**](#boxes) GNOME Desktop Environment application or virt-manager.

    ```sh
    virt-install --cdrom="debian-9.0.0-amd64-netinst.iso" --vcpus=1 --memory=1024 --disk-size=5 --os-variant=debian8 --name=linuxconfig-vm
    ```

    ```sh title="Serial console on the domain"
    systemctl enable --now serial-getty@ttyS0.service
    ```

    ```sh title="Accessing serial console from the host"
    virsh console $DOMAIN
    ```

    Note that the console will remain at 24 lines by 80 columns no matter if the terminal window is resized.



#### Virtual disk
:   
    ??? info "CoW filesystems"

        If the disk image is created on a filesystem that does not support **O\_DIRECT** (ref. `man 5 open`), i.e. COW filesystem like btrfs and ZFS, the cache must be disabled. 
        This appears to be impossible on btrfs, so disk images must be created on partitions with non-CoW alternatives, like ext4 and xfs.

    A virtual disk can be created in various ways and in various formats (the sparse
    [QCOW2](https://fileinfo.com/extension/qcow2) disk image format, associated with QEMU, is preferred).

    One way is to create the image using a utility like **qemu-img**.

    ```sh
    # Create qcow2 disk image
    qemu-img create -f qcow2 disk0.qcow2 '5G'
    ```

    Alternatively, and more circuitously, a volume can be created within a [**storage pool**](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_and_managing_virtualization/managing-storage-for-virtual-machines_configuring-and-managing-virtualization#understanding-storage-pools_understanding-virtual-machine-storage): a file, directory, or storage device managed by libvirt to provide storage for [domains](#domain).
.

    ```sh title="Creating a storage pool and virtual disk"
    virsh pool-define-as --name Disks --type dir --target /disk/Disks

    # Active pool
    virsh pool-start Disks

    # Activate pool on boot
    virsh pool-autostart Disks

    # Create a virtual disk within the pool
    virsh vol-create-as Disks disk0.qcow2 10G --format qcow2
    ```

    Regardless of the method, the disk image is then attached to the domain, whether or not it is running.

    ```sh title="Attach disk persistently to running domain"
    virsh attach-disk rhel --source disk.qcow2 --target vdb --cache none --driver qemu --subdriver qcow2
        --persistent
    ```

    Note that changes must be made persistent explicitly if the domain is running, and if it is not running then a separate option must be used to make the change in the VM's configuration.

    ```sh title="Attach disk to domain that is shut down"
    virsh attach-disk rhel --source disk.qcow2 --target vdb --cache none --driver qemu --subdriver qcow2 
        --config
    ```

    This can be reversed with the following command.
    ```sh
    virsh detach-disk rhel /tmp/Disks/disk0.qcow2
    virhs detach-disk rhel vdb # Specifying target instead
    ```

    A pool is deleted by first making sure its contents are deleted (but not the containing folder, in the case of a directory-based storage pool)

    ```sh title="Delete pool"
    # Destroy the contents
    virsh pool-destroy Disks  

    # Delete directory
    virsh pool-delete Disks   

    # Delete resource
    virsh pool-undefine Disks 
    ```


#### Snapshots
:   
    Snapshots of VMs can be taken from within Boxes or via the command-line:
    ```sh
    virsh snapshot-create-as rhel --name "Disks added"
    ```

    These produce XML records that can then be viewed: note that the field that Boxes uses to identify each snapshot is actually "description".
    ```sh
    virsh snapshot-dumpxml rhel "Disks added"
    ```

    Snapshots can be renamed by changing the value of the **name** element in a text editor.
    ```sh
    virsh snapshot-edit rhel --snapshotname "Disks added" --rename
    ```

    Revert to a snapshot
    ```sh
    virsh snapshot-revert rhel --snapshotname 
    ```

#### Virtual networking
:   

    The default virtual networking configuration is a NAT network called [**usermode networking**](https://help.ubuntu.com/community/KVM/Networking#usermodenetworking).
    By default, the domain is given an address in the 192.168.122.0/24 range with the host available at 192.168.122.1.
    Outboun

    Network bridging must be manually set up to allow VMs to be granted access to other guests and other hosts on the LAN.

    ```sh
    # Display all defined networks
    virsh net-list --all    

    # Display details of specified network
    virsh net-info default``
    ```
    Using [**Boxes**](#boxes), a new interface will be created (apparently named **tap0**, etc) and slaved to a bridge, or a bridge will be created if none exist.


#### Custom resolution
:   
    Specify a [custom resolution](https://stafwag.github.io/blog/blog/2018/04/22/high-screen-resolution-on-a-kvm-virtual-machine-with-qxl/ 'stafwag.github.io: "High screen resolution on a KVM virtual machine with QXL") in a VM using KVM

    ```sh
    cvt 2560 1440
    xrandr --newmode "2560x1440_60.00" 312.25 2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync
    xrandr --addmode Virtual-1 2560x1440_60.00
    xrandr --output Virtual-1 --mode 2560x1440_60.0
    ```
    
    On a Hyper-V VM, this method will not work, but a simple change to a line in **/etc/default/grub** will do the trick after running [update-grub](#update-grub) and restarting

    ```ini
    GRUB_CMDLINE_LINUX_DEFAULT="quiet splash video=hyperv_fb:1920x1080"
    ```

## Commands

#### qemu-img
:   
    ```sh
    --8<-- "includes/Commands/qemu-img.sh"
    ```

#### virt-install
:   
    --8<-- "includes/Commands/virt-install.md"

#### virsh
:   
    --8<-- "includes/Commands/virsh.md"
