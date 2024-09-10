```sh
lscpu | grep -E 'Arch|family|Model:' # => (1)
```

1. 
    === "Custom"
        ```
        --8<-- "includes/Output/lscpu/truenas-custom"
        ```
    === "Host Model"
        ```    
        --8<-- "includes/Output/lscpu/truenas-hostmodel"
        ```
    === "Host Passthrough"
        ```
        --8<-- "includes/Output/lscpu/truenas-passthrough"
        ```