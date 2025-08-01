```sh title="Networking"
# Display status of network interfaces and assigned IP addresses
ifconfig -a

# Routing table
netstat -nr

# Display attributes of interface and routing table entries
INTERFACE=inet0
lsattr -El $INTERFACE
```
