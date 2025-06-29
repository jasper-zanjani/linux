On TrueNAS, the libvirtd socket is [masked](https://www.truenas.com/community/threads/21-02-alpha-1-virsh-commands-fail.91229/) by default. 
This means that **virsh** is not able to connect to the hypervisor until it is unmasked and the service restarted.

```sh
systemctl unmask libvirtd.socket
systemctl restart libvirtd.service
virsh connect qemu:///system
```
