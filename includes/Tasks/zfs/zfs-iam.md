```sh
# Allow an unprivileged user to create snapshots of his home directory only
zfs allow -u lucas snapshot,rollback zroot/usr/home/lucas
```