Frontend to [Netfilter](#netfilter) in Red Hat distributions.

```sh
# Display running state
firewall-cmd --state
```

Firewalld has a runtime configuration and a saved, persistent configuration.
Only the runtime configuration will be consulted for any command, unless the persistent configuration is specified with **--permanent**.

```sh
# The runtime configuration can be saved with this command, which obviates the need to execute every change twice.
firewall-cmd --runtime-to-permanent

# Alternatively, the persistent configuration can be loaded into memory:
firewall-cmd --reload
```

```sh title="Display firewall rules"
firewall-cmd --list-all --permanent
```

Firewalld uses **zones** to define the level of trust for network connections.
A connection can only be part of one zone, but a zone can be used for many network connections.
Builtin zones have XML-format configs found in **/usr/lib/firewalld/zones**.

```sh
# Display active zones along with interfaces
firewall-cmd --get-active-zones

# Inspect zone
firewall-cmd --info-zone=public

# Create new zone
firewall-cmd --new-zone=testlab
```

Firewalld rules are generally managed through builtin **services**.
These bundle network settings together for well-known applications like SSH, etc.
Builtin services are also XML-format configs found in **/usr/lib/firewalld/services**.

```sh title="Services"
firewall-cmd --list-services

firewall-cmd --add-service=http

firewall-cmd --remove-service=http
```

Firewalld's config file is at **/etc/firewalld/firewalld.conf**
```ini title="/etc/firewalld/firewalld.conf"
AllowZoneDrifting=no

# Since RHEL 8, firewalld's backend has been changed to nftables.
FirewallBackend=nftables
```