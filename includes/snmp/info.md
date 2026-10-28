SNMP (Simple Network Management Protocol) is a standard way to monitor and manage network devices.
The most common SNMP implementation on Linux is Net-SNMP and its daemon snmpd.

There are three parts to the SNMP architecture:

- Manager
- Agent
- MIB/OID database: the hierarchy of managed objects that the manager can query

The Net-SNMP agent's configuration file is usually at **/etc/snmp/snmpd.conf**.

An SNMP _community string_ is a password.
They are only available with SNMPv1 and SNMPv2c protocols; SNMPv3 requires password authentication as well as an encryption key.

There are three types of community string: read-only (`rocommunity`), read-write (`rwcommunity`), and trap.

```conf
rocommunity public
```

Test whether the `public` network actually works from another host

```sh
snmpwalk -v2c -c public $SERVER_IP 1.3.6.1.2.1.1
snmpget -v2c -c public $SERVER_IP sysName.0
```

SNMPv3 users can be granted access using traditional access control or VACM configuration.

If any data is received other than "Timeout: No Response", then the community string is valid.

```conf
#       sec.name      source  community
com2sec notConfigUser default public
```

The `com2sec` security name is distinct from the community string that is mapped to it.

The **MIB tree** (Management Information Base) is a universal, hierarchical, dictionary-like database structured used to manage network device data.

The MIB tree has an unlabeled root with three subtrees, one of which is the Enterprise subtree (.1)
