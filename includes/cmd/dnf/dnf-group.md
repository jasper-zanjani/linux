```sh
# Specify package groups with the group command
dnf group info virtualization # (1)

dnf group install virtualization

# Include optional packages
dnf group install --with-optional virtualization
```

1. Package groups can also be specified by prefixing the package group name with **@** (only if the group name doesn't have a space in it).

```sh title="Alternative"
dnf info @virtualization

dnf install @virtualization

dnf install --with-optional @virtualization
```

