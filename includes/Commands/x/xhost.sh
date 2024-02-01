# Enable access control to X server
xhost -

# Disable access control to X server, allowing clients from any host to connect (not unsafe if you use a firewall that allows only SSH)
xhost +

# Add a host to list of authorized clients for X server
xhost +$HOST

# Remove host from list of authorized clients for X server
xhost -$HOST

# Add user to ACL
xhost si:localuser:$USER