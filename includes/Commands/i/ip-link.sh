# Create new bridge
ip link add virbr0 type bridge

# Create new wireguard interface
ip link add wg0 type wireguard

# Bring interface up
ip link set wlp2s0 up