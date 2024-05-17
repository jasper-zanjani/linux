A variety of ZFS topologies can be [created](https://docs.oracle.com/cd/E36784_01/html/E36835/gaynr.html) on a single line by passing subcommands and arguments to [**zpool create**](https://openzfs.github.io/openzfs-docs/man/8/zpool-create.8.html).

```sh
# Three-wide mirror
zpool create tank mirror /dev/sd{a,b}

# Two two-wide mirrors
zpool create tank mirror /dev/sd{a,b} mirror /dev/sd{c,d}

# Raidz
zpool create tank raidz /dev/sd{a,b,c}

# Set a property at creation with -o
zpool create tank mirror /dev/sd{a,b} -o compression=lz4
```