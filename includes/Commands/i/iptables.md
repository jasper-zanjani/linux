**iptables**, like [firewalld](#firewalld), is a frontend for the kernel-level **Netfilter**{: #netfilter } service, a software firewall and packet filtering framework introduced with Linux 2.4.0 (2001). 

Rules are saved in a **rulesfile** which once may have been found at **/etc/sysconfig/iptables** but which does not exist on recent Fedora installations.

```sh
--8<-- "includes/Commands/i/iptables.sh"
```

