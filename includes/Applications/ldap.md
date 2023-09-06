*[SASL]: Simple Authentication and Security Layer

**Lightweight Directory Access Protocol (LDAP)** is often associated with Microsoft Active Directory.
In fact, although AD builds on LDAP it actually uses Kerberos more often than LDAP to authenticate user access.

Secure versions of LDAP that encrypt the authentication process include:

- **LDAPS** LDAP over SSL, available over port 636
- **STARTTLS** LDAP over TLS, available over port 389

[Most legacy applications](https://jumpcloud.com/blog/ldap-vs-ldaps) that use insecure binds to Active Directory will use port 2889, and insecure bind OpenLDAP will use port 389.

#### SASL

[**Simple Authentication and Security Layer (SASL)**](https://en.wikipedia.org/wiki/Simple_Authentication_and_Security_Layer) is a protocol that provides and extensible and pluggable authentication framework for non-web related protocols, such as email protocols (SMTP, IMAP, and POP) as well as XMPP and LDAP.

SASL **mechanisms** are pluggable authentication methods developed independently of server protocols.
One such mechanism is **Generic Security Service Application Program Interface (GSSAPI)** which defines a network protocol for authenticating a client to a server using Kerberos version 5.
IANA hosts a list of [available SASL mechanisms](https://www.iana.org/assignments/sasl-mechanisms/sasl-mechanisms.xml).

The man page for **sssd-ad** also indicate that SSL/TLS options are not to be used and will be superseded by Kerberos.


Turnkey Linux offers an [OpenLDAP](https://www.turnkeylinux.org/openldap) image that will create a virtualized LDAP server running on Debian 11 (as of 2023).
This server hosts the phpLDAPadmin web application for management in addition to command-line tools.

```sh
ldapadd -x -W -D 'admin@ldap.local' -f 
slapcat
```

#### Commands

--8<-- "includes/Commands/ldap.md"