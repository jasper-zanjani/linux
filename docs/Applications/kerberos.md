# Kerberos

The [**krb5**](https://wiki.archlinux.org/title/Kerberos) package is the MIT implementation of the Kerberos protocol, more commonly associated with Microsoft Active Directory. 

A krb5 server actually contains two separate daemons: the **key distribution center (KDC)** and the **kadmin server**.

A KDC consists of a database of **principals**, an authentication server, and a ticket granting server.
Principals, in turn, represent users, servers, or services managed through Kerberos.

??? info "Commands

    ```sh title="kadmin"
    # kadmin.local is run on the kadmin server itself and supports an identical syntax to that of kadmin
    
    --8<-- "includes/Commands/kadmin.local.sh"
    ```


    ```sh title="kinit"
    # Authenticate user and store the resulting TGT.
    kinit user@kerberos.local

    # If /etc/krb5.conf defines libdefaults.default_realm, the domain can be dropped
    kinit user

    # If the principal name is the same as that of the current user, then not even the username needs to be provided.
    kinit
    ```

    ```sh title="klist"
    # Display credentials or TGTs obtained from the KDC using kinit
    klist

    # Display principles added to the keytab of a KDC
    klist -ke /etc/krb5.keytab
    ```

## Tasks

#### Setup Kerberos server
:   

    Setup of a KDC differs slightly between [RHEL](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system-level_authentication_guide/configuring_a_kerberos_5_server#configuring-master-kdc) and [Ubuntu](https://ubuntu.com/server/docs/service-kerberos):

    === ":material-redhat: RHEL"

        ```sh title="
        # Install Kerberos
        dnf install krb5-server krb5-libs krb5-workstation
        ```

        Make changes to the main Kerberos configuration file at [**/etc/krb5.conf**](#krb5conf).

        ```ini title="/etc/krb5.conf" hl_lines="7 15-20 22-24"
        --8<-- "includes/Configs/krb5.conf"
        ```

        ```sh
        # Create the database
        kdb5_util create -s

        # Start Kerberos
        systemctl start krb5kdc.service kadmin.service
        ```

    === ":material-ubuntu: Ubuntu" 

        ```sh
        # Install Kerberos"
        # Interactive TUI screens will appear to allow input of default kerberos realm, KDC, and admin server.
        # This information is incorporated into /etc/krb5.conf
        apt install krb5-kdc krb5-admin-server krb5-config

        # Create the Kerberos database at /var/lib/krb5kdc/principal, prompting for a password
        krb5_newrealm
        ```

        The output directs the user to add an administrative principal to **/etc/krb5kdc/kadm5.acl**.
        Note that this file does not exist on RHEL9, but there is the default available at
        **/var/kerberos/krb5kdc/kadm5.acl**.

    ```sh
    # Use the kadmin.local shell to add a user
    kadmin.local -q 'addprinc user'
    ```

    Test the connection on the server itself by [authenticating](#authenticate-from-the-command-line) as a user.

#### Authenticate from the command-line
:   

    ```sh
    # Install utilities
    dnf install -y krb5-workstation

    # Authenticate against Kerberos server
    kinit user@kerberos.local

    # If /etc/krb5.conf defines libdefaults.default_realm, the domain can be dropped
    kinit user

    # Confirm
    klist
    ```

#### SSH authentication against Kerberos
:   

    In order to use Kerberos credentials with SSH, the SSH server needs to be added to the realm as a host and must allow GSS-API authentication.

    ```sh title="Add SSH server as Kerberos host"
    # Add server principle with random key
    kadmin.local -q 'addprinc -randkey host/ubuntu1804'
    
    # Add to keytab file
    kadmin.local -q 'ktadd host/ubuntu1804.kerberos.local' 
    ```

    ```sh title="/etc/ssh/sshd_config"
    GSSAPIAuthentication yes
    GSSAPICleanupCredentials yes
    ```

    The client must be able to successfully [authenticate](#authenticate-from-the-command-line) and also have GSS-API authentication enabled.

    ```sh title="~/.ssh/config"
    GSSAPIAuthentication yes

    # This appears not to be strictly necessary
    GSSAPIDelegateCredentials yes
    # (1)
    ```

    1. Optionally, disable other forms of authentication for testing:
    ```sh
    PasswordAuthentication no
    PubkeyAuthentication no
    ```

    The connection can be tested by connecting to the server from itself.
    But the hostname used must match that of the **Service Principal Name (SPN)** of the host, i.e. localhost must not be used.
    This may be due to the fact that localhost actually resolves to 127.0.0.1, whereas presumably the hostname is defined as the actual IP address.

    ```sh title="Connecting to the server from the server itself"
    ssh ubuntu1804

    # Won't work
    ssh localhost
    ```

    When connecting from other hosts, it appears that the hostname used for the connection must be fully-qualified.
    It may be the case that GSS-API is only used when the SSH client does checks for a valid realm within the hostname.

    ```sh
    ssh ubuntu2204.kerberos.local

    # Won't work
    ssh ubuntu2204
    ```

## Configs

#### krb5.conf
:   
    **/etc/krb5.conf** is the main config file for the KDC which determines the domain name of the KDC.

    ```ini
    --8<-- "includes/Configs/krb5.conf"
    ```

#### kadm5.acl
:   
    **/var/kerberos/krb5kdc/kadm5.acl** on RHEL is used by kadmind to determine which principals have access to the Kerberos database.

    On Ubuntu this config is generated at **/etc/krb5kdc/kadm5.acl**

    By default it indicates that any username appended by "/admin" is an administrator.

    ```
    --8<-- "includes/Configs/kadm5.acl"
    ```

#### Keytab files
:   
    On Ubuntu 18.04 the (binary) keytab file is generated at **/etc/krb5.keytab**.

    Added principals can be displayed using:

    ```sh
    klist -ke /etc/krb5.keytab
    ```

