```sh title="ip"
# Add address
ip address add 192.168.2.2 dev eth0

# Listen for netlink messages
ip monitor 

# Display ARP cache
ip neighbor show

# Delete ARP entry
ip neighbor delete $IP_ADDR dev eth0 
```

??? info "ip link"

    ```sh
    --8<-- "includes/Commands/ip-link.sh
    ```

??? info "ip route"

    ```sh
    # Manipulate routing table
    --8<-- "includes/Commands/ip-route.sh"
    ```

??? info "ip netns"

    ```sh
    --8<-- "includes/Commands/ip-netns.sh"
    ```
