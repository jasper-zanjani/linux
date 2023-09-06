Control NetworkManager and report network status

```sh
# Display overall status of NetworkManager and connections 
nmcli general status # (1)

# Display hostname
nmcli general hostname

# Set hostname
nmcli general hostname $HOSTNAME


# Display status for all devices
nmcli device status # (2)

# Display detailed information on network device, including MAC address, gateway, routes, and other information.
nmcli device show wlp3s0 # (4)


# Configure settings for network interface {ens01} via interactive shell
nmcli connection edit ens01

# Display status and UUID of all connections managed by NetworkManager
nmcli connection show

# Only active connections
nmcli connection show --active # (3)


# Migrate a connection profile from ifcfg to NetworkManager keyfile
nmcli connection migrate eth0
```

1. 
``` title="Output of nmcli general status"
STATE      CONNECTIVITY  WIFI-HW  WIFI     WWAN-HW  WWAN
connected  full          enabled  enabled  missing  enabled
```
2. 
```
DEVICE          TYPE      STATE                   CONNECTION
wlp3s0          wifi      connected               TP-Link_8FF4_5G
lo              loopback  connected (externally)  lo
p2p-dev-wlp3s0  wifi-p2p  disconnected            --
enp2s0f0        ethernet  unavailable             --
```
3. 
``` title="Output of nmcli connection show --active"
NAME             UUID                                  TYPE      DEVICE
TP-Link_8FF4_5G  6b27052f-17a6-43eb-ba63-07117697b596  wifi      wlp3s0
lo               af513b54-7f1d-4db5-86b9-88eda11b43a9  loopback  lo
```
4. 
``` title="Output of nmcli device show wlp3s0"
GENERAL.DEVICE:                         wlp3s0
GENERAL.TYPE:                           wifi
GENERAL.HWADDR:                         A4:B1:C1:0C:7E:A2
GENERAL.MTU:                            1500
GENERAL.STATE:                          100 (connected)
GENERAL.CONNECTION:                     TP-Link_8FF4_5G
GENERAL.CON-PATH:                       /org/freedesktop/NetworkManager/ActiveConnection/2
IP4.ADDRESS[1]:                         192.168.0.3/24
IP4.GATEWAY:                            192.168.0.1
IP4.ROUTE[1]:                           dst = 0.0.0.0/0, nh = 192.168.0.1, mt = 600
IP4.ROUTE[2]:                           dst = 192.168.0.0/24, nh = 0.0.0.0, mt = 600
IP4.DNS[1]:                             192.168.0.1
IP6.ADDRESS[1]:                         fe80::fd17:f2ed:b7c8:b1c3/64
IP6.GATEWAY:                            --
IP6.ROUTE[1]:                           dst = fe80::/64, nh = ::, mt = 1024
```