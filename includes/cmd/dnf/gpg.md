GPG keys imported to verify **repos** (not packages) are stored in **/var/cache/dnf**.
Each repo is associated with a directory which contains three directories, and the one that contains cryptographic files is named **pubring**: (1).
{ .annotate }

1. 
``` hl_lines="3"
.
├── packages
├── pubring
└── repodata

4 directories, 0 files
```

One of these files, pubring.kbx, is a [**keybox file**](#keybox) and can be inspected with the **kbxutil** utility.

```sh
kbxutil /var/cache/dnf/tailscale-stable-df1c8c888de039b7/pubring # => (1)
```

1. 
```
--8<-- "includes/Output/kbxutil/kbxutil-tailscale"
```
