**NFS** or "Network File System" is a distributed filesystem based on the RPC protocol that provides transparent access to remote disks.


Shares or "exports" made available to clients are defined in **/etc/exports**.

``` title="/etc/exports on TrueNAS"
"/mnt/pool/Documents"\
	*(sec=sys,rw,no_subtree_check)

# Read-only ("rw" is removed)
"/mnt/pool/Aliana"\
    *(sec=sys,no_subtree_check)
```

Once exports are defined, the NFS server can be started
```sh
systemctl enable --now nfs-server.service
```

Exports can be displayed using **showmount -e**.

Shares can be manually mounted in /etc/fstab using the following syntax:
```
127.0.0.1:/export/web_data1 /mnt/nfs_web_data1 nfs defaults,_netdev 0 0
127.0.0.1:/export/web_data2 /mnt/nfs_web_data2 nfs defaults,_netdev 0 0
```

Better still is using [autofs](#autofs).

??? info "Resources"

    - [:material-youtube: How to Share Files Using NFS: Linux Server Training 101](https://youtu.be/c3dL0ULEH-s)

??? info "History"

    Modern NFS deployments in the wild are usually versions 3 or 4.
    NFS version 4 (released in 2003) has superior performance, requires only the additional **mountd** service and **TCP port 2049** to be open.

    NFS version 3 was released in the early 1990s resolved earlier performance bottlenecks with a coherency scheme that allowed asynchronous writes.
    File locking was implemented by means of two separate daemons, **lockd** and **statd**.
    This approach was found to be unreliable, and NFSv4 incorporated file locking into the core protocol.



#### Authentication

All versions of NFS support various security mechanisms:

- **AUTH\_NONE** no authentication
- **AUTH\_SYS** Unix-style user and group access control
- **RPCSEC\_GSS** layer which is often used in combination with Kerberos

AUTH\_SYS depends on the client reporting user UID and GID, which are compared with the server's own values in /etc/passwd.
This means that users with root access can **su** to whatever UID they wish, allowing them to access shares.
This approach depends on the client to correctly report its access and is highly insecure.

NFS servers intercept incoming requests made on behalf of UID 0 (root) and changes them to map them to that of another reason, a process called "squashing root".
A placeholder account named "nobody" with UID 65534 is defined to be the account as whom a root user masquerades on an NFS server.
Options in the exports file can control this behavior.

In TrueNAS, the [MAPROOT](https://www.truenas.com/community/threads/mapall-maproot-better-explanation-please.54877/) setting specifies a user account to which root logins should be mapped.
Similarly, the [**MAPALL**](https://www.truenas.com/community/threads/nfs-mount-configuration-for-user-perms.70236/) setting defines a user account to which any client account should be mapped.

```sh
# Normal NFS share in TrueNAS
"/mnt/pool/Media/Pictures"\
	*(sec=sys,rw,no_subtree_check)

# MAPALL set to user media with UID 3000
"/mnt/pool/Media/Videos"\
	*(sec=sys,rw,anonuid=3000,anongid=3000,all_squash,no_subtree_check)
```

AUTH\_SYS authentication provide a good use-case to use certain commands like **id**.
