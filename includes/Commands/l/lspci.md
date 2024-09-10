```sh
# Display drivers and modules handling each device
lspci -k

# Look for graphics cards
lspci -k | grep -A2 -E "(VGA|3D)"
```