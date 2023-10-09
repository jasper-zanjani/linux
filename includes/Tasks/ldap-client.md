=== ":material-redhat: RHEL"

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
    ```

=== ":material-ubuntu: Ubuntu"

    ```sh
    # Upon installation, a TUI interface is displayed demanding the URI of the LDAP server 
    # in the format ldap://ldap.local, as well as distinguished name of the search base.
    apt install -y ldap-auth-client sssd libpam-sss libnss-sss libnss-ldap
    ```

    ```sh title="/etc/pam.d/common-account"
    # Allowing a login to create a new home directory
    session required pam_mkhomedir.so skel=/etc/skel umask=077
    ```

    Alternative, this command appears to enable the PAM module without this particular change being made to that file.

    ```sh
    pam-auth-update --enable mkhomedir
    ```


```sh
# Check for any typographical errors in SSSD configuration (requires sssd-tools package)
sssctl config-check

chmod 600 /etc/sssd/sssd.conf

systemctl restart sssd oddjobd
```

```ini title="/etc/sssd/sssd.conf"
---8<--- "includes/Configs/sssd.conf-ldap"
```

1. With both **nss** and **pam**
```
Online status: Online

Active servers:
LDAP: ldap.local

Discovered LDAP servers:
- ldap.local
```
Without **nss**, the output of **sssctl domain-status ldap** shows that no active servers are connected.
``` title="Without nss"
Online status: Online

Active servers:
LDAP: not connected

Discovered LDAP servers:
- ldap.local
```
Removing **pam** breaks user authentication, and SSH logins are no longer possible even when attempting to disable **UsePAM** in sshd\_config.
Even logging in via serial console becomes impossible.
