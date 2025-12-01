**/etc/subuid** and **/etc/subgid** have to be [set](https://github.com/containers/podman/blob/main/docs/tutorials/rootless_tutorial.md#etcsubuid-and-etcsubgid-configuration).
These are colon-delimited files that define the ranges for namespaced UIDs and GIDs to be used by each user. 
Conventionally, these ranges begin at 100,000 (for the first, primary user) and contain 65,536 possible values.

```
terry:100000:65536
alice:165536:65536
```

Then podman has to be migrated

```sh
podman system migrate
```
