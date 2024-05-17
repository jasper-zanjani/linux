```sh title="lscpu"
lscpu | grep -E 'Arch|family|Model:' # (1)
```

1. 
``` title="Output on TrueNAS"
# CPU Mode: Custom
--8<-- "includes/Output/lscpu/truenas-custom"

# CPU Mode: Host Model
--8<-- "includes/Output/lscpu/truenas-hostmodel"

# CPU Mode: Host Passthrough
--8<-- "includes/Output/lscpu/truenas-passthrough"
```