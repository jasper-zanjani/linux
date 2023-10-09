```sh
dnf install -y openldap-clients sssd sssd-ldap oddjob-mkhomedir

# Switch authentication provider to SSSD
authselect select sssd with-mkhomedir

# Copy the root CA signing certificate chain to OpenLDAP's certificate store
cp $CERT /etc/openldap/certs
```

```sh title="/etc/openldap/ldap.conf"
# Add URL and suffix of LDAP server to config
URI ldap://ldap.local
BASE dc=ldap,dc=local

# Provide path to root CA signing certificate
TLS_CACERT /etc/openldap/certs/$CERT
```

```sh
# Check for any typographical errors in SSSD configuration (requires sssd-tools package)
sssctl config-check

chmod 600 /etc/sssd/sssd.conf

systemctl restart sssd oddjobd
```

```sh title="/etc/hosts"
# Add configured hostname
192.168.0.130 ldap.local
```

```ini title="/etc/sssd/sssd.conf"
---8<--- "includes/Configs/sssd.conf-ldaps"
```


