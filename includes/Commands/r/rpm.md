```sh
--8<-- "includes/Commands/r/rpm.sh"
```

The options **-q**/**--query** and **-p**/**--package** are used to inspect downloaded packages.

```sh title="rpm -qp"
# -l/--list files to be installed
rpm -qpl rsync-3.2.7-1.fc37.x86_64.rpm # (1)

# -R/--requires display requirements
rpm -qpR rsync-3.2.7-1.fc37.x86_64.rpm # (2)
```

1. 
``` title="Output"
--8<-- "includes/Output/rpm/rpm-qpl"
```
2. 
``` title="Output"
--8<-- "includes/Output/rpm/rpm-qpR"
```

RPM packages can be extracted by by first converting to cpio.
Note that rpm2cpio works using STDIN and STDOUT.

```sh
rpm2cpio package.rpm | cpio -ivd
```