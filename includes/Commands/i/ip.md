<div class="grid cards" markdown>

-   #### ip address

    ---

    ```sh title="Add address"
    ip address add 192.168.2.2 dev eth0
    ```

    #### ip monitor

    ---

    ```sh
    # Listen for netlink messages
    ip monitor 
    ```

-   #### ip link

    ---

    Network devices and virtual interfaces

    ```sh title="Create new bridge"
    # Create bridge interface
    ip link add virbr0 type bridge

    # Create new wireguard interface
    ip link add wg0 type wireguard

    # Bring interface up
    ip link set wlp2s0 up
    ```

-   #### ip route

    ---
    
    Routing table

    ```sh
    --8<-- "includes/Commands/i/ip-route.sh"
    ```

-   #### ip neighbor

    ---

    ```sh title="Display ARP cache"
    ip neighbor show
    ```

    ```sh title="Delete ARP entry"
    ip neighbor delete $IP_ADDR dev eth0 
    ```

</div>

#### ip netns

??? info "Resources"

    The RHEL8: Managing Networking course on Pluralsight by Andrew Mallett introduced the topic of network namespaces with a very cool scenario. 
    Although the scenario has absolutely no practical benefit, as far as I can tell, it still offered a chance to play around with the various commands in a synthetic way.

Network namespaces are mounted to **/var/run/netns**.

We can create a network namespace then add two virtual Ethernet interfaces.
These are **peers**, meaning they are linked together as if connected to the same switch.

```sh
ip netns add netns0
ip link add veth0 type veth peer name veth1 netns netns0
```

We can then run a command in the **context** of a namespace. 
Without providing a context, the default namespace is used and we can display veth0 but not veth1. 
If there are no other links in the namespace (which there shouldn't be) then the **number** of the interface's peer appears in the link's name. 
By running a command in the context of the new namespace we can display veth1. 
The interface number of the link it's paired with in the default namespace also appears in this link's name.

```sh
ip link show
ip netns exec netns0 ip link show
```

Now we assign an address to the namespaced link and bring it up.

```sh
ip netns exec netns0 ip addr add 10.0.0.1/24 dev veth1
ip netns exec netns0 ip link set dev veth1 up
```

Pinging this IP from outside the namespace will not work because there is no route.
Adding an IP in the same subnet to veth0 creates the route.

```sh
ip addr add 10.0.0.2/24 dev veth0
```
The interface must be brought up, which automatically adds a route to the routing table.

```sh
ip link set dev veth0 up
```
