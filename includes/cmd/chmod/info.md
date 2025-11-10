```sh
# Assign a permissions octet to a file to make it world-unreadable
chmod 600 /etc/sssd/sssd.conf

# In the case of a symlink, chmod will operate against the 
# symlink's target unless dereferencing is prevented
chmod -h $FILE # --no-dereference
```

When the **set-group-ID** bit for a directory is set, all files *created* therein are assigned to the directory's group and not to the file owner's default group.

This is intended to facilitate file sharing.
In this scenario, users are assigned to a group, and the group is assigned to shared directories with the SGID bit set.

```sh
# Add/remove SGID
chmod g+s $FILE
chmod g-s $FILE
```

The **set-user-ID** bit allows a file to be *executed* with the privileges of the file's owner.

```sh
# Add/remove SUID
chmod u+s $FILE
chmod u-s $FILE
```

When the **sticky bit** is set on a directory, only root, the directory owner and the owner of a file can remove files in that directory.

```sh
# Add/remove sticky bit
chmod +t $FILE
chmod -t $FILE
```
