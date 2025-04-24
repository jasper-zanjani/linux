[**Modules**](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/installing_managing_and_removing_user-space_components/introduction-to-modules_using-appstream) are special package groups representing an application, runtime, or a set of tools that are installed together. 
These are made available on the AppStream repository on RHEL.

Modules are made available by **stream**, or version, and by **profile**, or purpose (i.e. client, server, common, devel, etc).

```sh
# Display available streams and profiles of the nodejs module
dnf module list nodejs # (1)

# Install Nodejs stream 16, default profile (common)
dnf module install nodejs:16

# Install Nodejs stream 16, development profile
dnf module install nodejs:16/development
```

1. 
``` title="Output on Fedora 38"
Fedora Modular 38 - x86_64
Name           Stream         Profiles                                 Summary                   
nodejs         16             common [d], development, minimal         Javascript runtime        

Fedora Modular 38 - x86_64 - Updates
Name           Stream         Profiles                                 Summary                   
nodejs         16             common [d], development, minimal         Javascript runtime      
```

