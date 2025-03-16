# SMB

The SMB implementation on Linux is called **Samba**.

```sh
# Configure Samba 
mkdir /samba                   # Create a directory for the share
chmod -R 0777 /samba
chown -R nobody:nobody /samba  # Remove ownership, not necessary

# Open firewall rule (not strictly necessary)
firewall-cmd --permanent --add-service=samba
firewall-cmd --reload

# Verify
firewall-cmd --list-services 
```

Configure the main Samba config file at **/etc/samba/smb.conf**. The name in brackets becomes the name of the share.
```ini
[samba]
    comment = Samba on Ubuntu
    path = /samba
    read only = no
    browsable = yes
```

Verify configuration

```sh
testparm
```

```sh title="SELinux"
# Set SELinux context of share directory
semanage fcontext -a -t samba_share_t '/samba(/.*)?'
restorecon -vvFR /samba

# Allow SELinux to work with Samba
setsebool -P samba_export_all_ro on
```

```sh
# Set up a Samba account
smbpasswd -a $USER

# Restart Samba service
systemctl restart smbd

# Browse all available shares
smbclient -L $HOST

# Access SMB share, displaying the Samba CLI "smb: \>"
smbclient //$HOST/$USER -U $USER
```



Permanently mounting a Samba share in /etc/fstab

```
//nas/Videos /home/jasper/Videos cifs guest,uid=1000,iocharset=utf8 0 0
```

Then mount the fstab file

```sh
mount -a
```

!!! info "TrueNAS"

    On TrueNAS, the option to "Export Read Only" should be turned off to allow writes.
    
