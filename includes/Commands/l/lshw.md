```sh title="lshw"
# Extract detailed information on the hardware configuration of the machine.

# Display a table of hardware information
sudo lshw -short # (1)

# Display information on various device types
sudo lshw -short -class processor # (2)
sudo lshw -short -class display # (3)
```

1. 
``` title="Output"
--8<-- "includes/Output/lshw/lshw-short"
```
2. 
``` title="Output"
--8<-- "includes/Output/lshw/lshw-short-processor"
```
3. 
``` title="Output"
--8<-- "includes/Output/lshw/lshw-short-display"
```