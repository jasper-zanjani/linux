# NFS

**NFS** or "Network File System" is a distributed filesystem based on the RPC protocol that provides transparent access to remote disks.


??? info "Versions"

    Modern NFS deployments in the wild are usually versions 3 or 4.
    NFS version 4 (released in 2003) has superior performance, requires only the additional **mountd** service and TCP port 2049 to be open.

    NFS version 3 was released in the early 1990s and resolved earlier performance bottlenecks with a coherency scheme that allowed asynchronous writes.
    File locking was implemented by means of two separate daemons, **lockd** and **statd**.
    This approach was found to be unreliable, and NFSv4 incorporated file locking into the core protocol.

#### /etc/exports

On the server side, shares or "exports" made available to clients are defined in **/etc/exports**, a space-delimited file which delineates file systems to be shared, an access control list, and a parenthesized comma-delimited set of options.
These files follow shell syntax, with comments introduced by **#** and line breaks by **\\**.

Exports files found in the wild conventionally separate the export path and the access control list with a line break and indentation.

All versions of NFS support various authentication methods, set by providing one of several possible security flavors to the **sec=** option:

- **AUTH\_SYS** Unix-style user and group access control (**sec=sys**)
- **RPCSEC\_GSS** is used in combination with Kerberos (**sec=krb5**, **krb5i**, or **krb5p**)
- **AUTH\_NONE** no authentication

AUTH\_SYS depends on the client reporting user UID and GID, which are compared with the server's own values in /etc/passwd.
This means that users with root access can **su** to whatever UID they wish, allowing them to access shares.
This approach depends on the client to correctly report its access and is highly insecure.

AUTH\_SYS authentication provides a good use-case to use certain commands like **id**.

#### Squashing

NFS servers intercept incoming requests made on behalf of UID 0 (root) and map them to that of another user, a process called "squashing root". (1)
A placeholder account named "nobody" with UID 65534 is defined to be the account as whom a root user masquerades on an NFS server.
Options in the exports file can control this behavior.
{ .annotate }

1. In TrueNAS:<ul markdown><li>[**MAPALL**](https://www.truenas.com/community/threads/nfs-mount-configuration-for-user-perms.70236/) defines a user account to which any client account should be mapped. It is equivalent to setting **all\_squash**, **anonuid=**, and **anongid=** in the exports file.</li><li>[**MAPROOT**](https://www.truenas.com/community/threads/mapall-maproot-better-explanation-please.54877/) (equivalent to setting **squash\_root**) specifies a user account to which root logins should be mapped.</li></ul>

Note that even if a user's ID has been squashed to an anonymous user from the server's perspective, if a file or folder is not world-writeable the client will not allow writing because the reported UID doesn't match the user's.


## Tasks

<div class="grid cards" markdown>

-   #### Start NFS server

    ```sh
    # Start NFS server
    systemctl enable --now nfs-server.service

    # Confirm
    showmount -e
    ```

    ---

    #### Mount shares


    Shares can be manually mounted to the **fstab** file, but [**autofs**](#autofs) is preferred:

    ```sh title="/etc/fstab"
    127.0.0.1:/export/web_data      /mnt/nfs_web_data   nfs     defaults,_netdev 0 0
    ```

-   #### Define shares

    ---

    Representative export, showing basic syntax

    ```sh title="/etc/exports"
    "/share/path" *()
    ```

    Read-only export

    ```sh title="/etc/exports"
    "/mnt/pool/Aliana"\
        *(sec=sys,no_subtree_check)
    ```

    Export directory with anonymous access, squashing all access to user 3000

    ```sh title="/etc/exports"
    "/mnt/pool/Media/Videos"\
        *(sec=sys,rw,anonuid=3000,anongid=3000,all_squash,no_subtree_check)
    ```


</div>
