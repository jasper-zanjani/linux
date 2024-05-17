# Network namespaces are mounted to /var/run/netns
ip netns

# We can create a network namespace then add two virtual Ethernet interfaces.
# These are **peers**, meaning they are linked together as if connected to the same switch.
ip netns add netns0
ip link add veth0 type veth peer name veth1 netns netns0

# We can then run a command in the **context** of a namespace. Without providing a context, 
# the default namespace is used and we can display veth0 but not veth1. If there are no other
# links in the namespace (which there shouldn't be) then the **number** of the interface's 
# peer appears in the link's name. By running a command in the context of the new namespace 
# we can display veth1. The interface number of the link it's paired with in the 
# default namespace also appears in this link's name.
ip link show                        # "veth0@if2"
ip netns exec netns0 ip link show   # "veth1@if4"

# Now we assign an address to the namespaced link and bring it up
ip netns exec netns0 ip addr add 10.0.0.1/24 dev veth1
ip netns exec netns0 ip link set dev veth1 up

# Pinging this IP from outside the namespace will not work because there is no route.
# Adding an IP in the same subnet to veth0 creates the route.
ip addr add 10.0.0.2/24 dev veth0

# The interface must be brought up, which automatically adds a route to the routing table.
ip link set dev veth0 up

