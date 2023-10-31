# Add static route (this is sometimes done automatically by the system after adding an address)
ip route add 192.168.2.0/24 dev eth0

# Add default route
ip route add default via 192.168.2.1 dev eth0

# Change the default gateway to 192.168.1.1 on eth0
ip route change default via 192.168.1.1 dev eth0