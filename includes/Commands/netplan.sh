# Reload configuration temporarily
netplan apply 

# Temporarily load a network configuration.
# After a timeout (120 seconds by default) the configuration will return to previous
netplan try