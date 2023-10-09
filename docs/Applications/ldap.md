# LDAP

**Lightweight Directory Access Protocol (LDAP)** is a directory service protocol often associated with Microsoft Active Directory.
In fact, although AD builds on LDAP it actually uses Kerberos more often than LDAP to authenticate user access.
LDAP's data model is similar to that of the X.500 OSI directory service.

A **directory** is similar to a database but typically contains more descriptive, [attribute-based](https://learn.microsoft.com/en-us/previous-versions/windows/desktop/ldap/what-is-a-directory-service) data because it is read more often than written.
An LDAP directory is a collection of **entries**, which consist of one or more **attributes**.
The terms *object*, *container*, and *node* refer to various types of entry.
Attributes, in turn, are composed of key-value pairs separated by **=** and delimited by comma.

- **CN** common name
- **DC** domain component
- **OU** organizational unit
- **SN** surname

**Distinguished names** is not considered part of the entry itself, although it too is composed of attributes.


```ldif
# Example directory root
dc=mycorp,dc=com

# Default administrator distinguished name
cn=Administrator,ou=Users,dc=mycorp,dc=com
```

**LDAP Data Interchange Format (LDIF)** defines the format of text files that contain LDAP-compatible information.

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

## Commands

--8<-- "includes/Commands/ldap.md"

#### Client setup
:   

    --8<-- "includes/Tasks/ldap-client.md"

#### Server setup
:   
    --8<-- "includes/Tasks/ldap-server.md"

#### LDAP with TLS authentication
:   

    The **ldap\_id\_use\_start\_tls** setting enforces [TLS authentication](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/configuring_authentication_and_authorization_in_rhel/configuring-sssd-to-use-ldap-and-require-tls-authentication_configuring-authentication-and-authorization-in-rhel) and is false by default, which poses a security risk.
    However, setting it to true will only affect LDAP providers (**`id_provider = ldap`**).
    Active Directory providers are not affected as they use encrypted connections protected by [SASL](https://en.wikipedia.org/wiki/Simple_Authentication_and_Security_Layer) and [GSSAPI](https://en.wikipedia.org/wiki/Generic_Security_Services_Application_Program_Interface).

    This finding is confirmed in a [Red Hat Knowledge Base resolution](https://access.redhat.com/solutions/6565241).
    