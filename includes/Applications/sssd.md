[**System Security Services Daemon (SSSD)**](https://github.com/SSSD/sssd) is a system service that allows access to remote directories and authentication mechanisms.
These mechanisms are called identity and authentication **providers**, for example LDAP directories, AD domains, or Kerberos realms.
Providers are configured as **domains** in the main configuration file at **/etc/sssd/sssd.conf** with other files in **/etc/sssd/conf.d**.

!!! warn "File permissions"

    Note that the SSSD configuration must be read/write by root **only** (600) or the daemon will fail to start.

A single domain can be configured as one or more of the following providers:

- **id\_provider** supplying user information 
- **auth\_provider** handling authentication requests
- **access\_provider** handling authorization requests


!!! info "History"

    SSSD replaces an [earlier package](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_authentication_and_authorization_in_rhel/assembly_migrating-authentication-from-nslcd-to-sssd_restricting-domains-for-pam-services-using-sssd) for LDAP authentication named **nss-pam-ldapd**, also referred to as the **nslcd** service.

## Tasks

#### Local files provider
:   

    SSSD provides a [local files provider](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/configuring_authentication_and_authorization_in_rhel/proc_enabling-the-local-files-provider-for-sssd_configuring-authentication-and-authorization-in-rhel), which allows SSSD caching of /etc/passwd and friends.

    ```ini title="/etc/sssd/sssd.conf"
    --8<-- "includes/Configs/sssd.conf-files"
    ```

    ```sh
    authselect enable-feature with-files-access-provider

    # Restart SSSD
    systemctl restart sssd  # (1)

    # Confirm
    sssctl domain-status files
    ```

    1. SSSD will not start if the config is world-readable.
    ```sh
    chmod 600 /etc/sssd/sssd.conf
    ```

#### LDAP provider
:   
    --8<-- "includes/Tasks/ldap-client.md"

## Commands

```sh title="sssctl"
--8<-- "includes/Commands/sssctl.sh"
```

#### sss\_override
:   
    The [**sss\_override**](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/configuring_authentication_and_authorization_in_rhel/assembly_sssd-client-side-view_configuring-authentication-and-authorization-in-rhel#doc-wrapper) utility allows local overrides for almost all user and group attributes.
