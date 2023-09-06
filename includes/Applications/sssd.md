[**System Security Services Daemon (SSSD)**](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/configuring_authentication_and_authorization_in_rhel/understanding-sssd-and-its-benefits_configuring-authentication-and-authorization-in-rhel)
is a system service that allows access to remote directories and authentication mechanisms.
These mechanisms are called identity and authentication **providers**, for example LDAP directories, AD domains, or Kerberos realms.
Providers are configured as **domains** in the main configuration file at **/etc/sssd/sssd.conf**.

!!! warn "File permissions"

    Note that the SSSD configuration must be read/write by root **only** (600) or the daemon will fail to start.

A single domain can be configured as one or more of the following providers:

- **id\_provider** supplying user information 
- **auth\_provider** handling authentication requests
- **access\_provider** handling authorization requests

```ini title="Example domain"
[domain/corp.pods.lcl]
id_provider = ad
access_provider = simple
```

```ini title="SSSD configuration for LDAP authentication"
--8<-- "includes/Configs/sssd.conf-ldap"
```



!!! info "History"

    SSSD replaces an [earlier package](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_authentication_and_authorization_in_rhel/assembly_migrating-authentication-from-nslcd-to-sssd_restricting-domains-for-pam-services-using-sssd) for LDAP authentication named **nss-pam-ldapd**, also referred to as the **nslcd** service.

