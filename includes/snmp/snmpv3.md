SNMPv3 introduced three main innovations:

- **User-based security model (USM)** introduced cryptographic security functions to every message.
- **View-based access control model (VACM)** offered granular control over access to specific MIB subtrees and permissions. Earlier versions of SNMP offered either full read-only or full read-write access to the entire MIB tree, referred to as "traditional access control".
- **Engine IDs** protected against message replay attacks and spoofing.

#### VACM

SNMPv3 users can be granted access using traditional access control or VACM configuration.
Helper utilities such as `net-snmp-create-v3-user` on RHEL exist to create users and add information to configs like **/var/lib/net-snmp/snmpd.conf**.
Four configuration directives are associated with VACM.

- `com2sec` maps a community string to a **security name**
- `group` declares a group from a community string. Several group directives can specify the same group name, allowing a single access setting to apply to multiple community strings.
- `view` defines a subset of the overall MIB. Multiple directives with the same view name can build a more complex collection of OIDs.
- `access` maps a group to a view.

```
--8<-- "includes/snmp/kubota.conf"
```

#### Engine ID

 SNMPv3 requires an SNMP agent to define a unique **engine ID** (`engineID`) in order to respond to SNMPv3 requests.
This is conventionally defined automatically using two non-predictable values: a random number and the current time in seconds.
The engine ID can also be built from a given string or the machine's IP or MAC address.

