```sh
apt install -y ldap-auth-client sssd libpam-sss libnss-sss libnss-ldap
```

```ini title="/etc/sssd/sssd.conf"
---8<--- "inclues/Configs/sssd.conf-ldap"
```

```sh
chmod 600 /etc/sssd/sssd.conf
```

```sh title="/etc/pam.d/common-account"
# Allowing a login to create a new home directory
session required pam_mkhomedir.so skel=/etc/skel umask=077
```

```sh title="/etc/hosts"
192.168.0.130 ldap.local
```