**Auto File System** offers an alternative way of mounting NFS shares that can save some system resources, especially when many shares are mounted.
Autofs can mount NFS shares dynamically, only when accessed.

```sh
dnf install -y autofs
systemctl enable --now autofs.service
```

Mounts are defined in configs called **maps**.
There are three map types:

- **master** map is **/etc/auto.master** by default. This can be defined using the **master\_map\_name** directive in the main configuration at **/etc/autofs.conf**.
- **direct** maps point to other files for mount details. They are notable for beginning with **/-**
- **indirect** maps also point to other files for mount details but provide an umbrella mount point which will contain all other mounts within it. Note that other mountpoints at this parent directory cannot coexist with autofs mounts.


Here is an example indirect map that will mount to /data/sales.

``` title="/etc/auto.master.d/data.autofs"
/data /etc/auto.data
```

``` title="/etc/auto.data"
sales -rw,soft 192.168.33.101:/data/sales
```

Map files also support wildcards.
```
* 127.0.0.1:/home/&
```