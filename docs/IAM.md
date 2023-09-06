# IAM

## SSSD

--8<-- "includes/Applications/sssd.md"

## LDAP

--8<-- "includes/Applications/ldap.md"

## PAM

--8<-- "includes/Applications/pam.md"



## Tasks

#### User management
:   

    ```sh title="Lock user"
    usermod -L $USER # --lock
    passwd -l $USER  # --lock
    ```

    ```sh title="Unlock user"
    usermod -U $USER # --unlock
    passwd -u $USER  # --unlock
    ```

#### Groups
:   

    ```sh title="Display groups of effective user"
    id -Gn
    getent group | grep $(whoami) -
    ```


#### Install SSSD tools
:   
    SSSD utilities like **sssctl** and **authselect** can be installed from the **sssd-tools package**.

    ```sh
    dnf install -y sssd-tools
    ```

#### LDAP with TLS authentication
:   

    The **ldap\_id\_use\_start\_tls** setting enforces [TLS authentication](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/configuring_authentication_and_authorization_in_rhel/configuring-sssd-to-use-ldap-and-require-tls-authentication_configuring-authentication-and-authorization-in-rhel) and is false by default, which poses a security risk.
    However, setting it to true will only affect LDAP providers (**`id_provider = ldap`**).
    Active Directory providers are not affected as they use encrypted connections protected by [SASL](https://en.wikipedia.org/wiki/Simple_Authentication_and_Security_Layer) and [GSSAPI](https://en.wikipedia.org/wiki/Generic_Security_Services_Application_Program_Interface).

    This finding is confirmed in a [Red Hat Knowledge Base resolution](https://access.redhat.com/solutions/6565241).
    

## Commands

#### authselect
:   
    Apparently generates the [**/etc/nsswitch.conf**](#etcnsswitchconf) file.

#### chage
:   

    ```sh
    --8<-- "includes/Commands/chage.sh"
    ```

#### getent
:   

    ```sh
    --8<-- "includes/Commands/getent.sh"
    ```

#### lastb
:   

    ```sh
    --8<-- "includes/Commands/lastb.sh"
    ```

#### ldapsearch
:   

    --8<-- "includes/Commands/ldapsearch.md"

#### sudo
:   

    ```sh
    --8<-- "includes/Commands/sudo.sh"
    ```

#### shadow-utils
:   

    --8<-- "includes/Commands/shadow-utils.md"

#### sssctl
:   

    ```sh
    --8<-- "includes/Commands/sssctl.sh"
    ```

## Configs

#### /etc/sudoers
:   
    --8<-- "includes/Configs/sudoers.md"

#### /etc/nsswitch.conf
:   
    The **Name Service Switch (NSS)** configuration file at **/etc/nsswitch.conf** is known as the service switch file or simply the switch file. 
    It provides sources in the order they should be consulted.

    - **files** refers to the system's local passwd and group files
    - **sss** refers to [SSSD](#sssd)



    The **hosts** key determines how hostnames are mapped to IP addresses:

    ```yaml
    # Typical default entry, giving preference to /etc/hosts
    hosts: files dns

    # !UNAVAIL=return here indicates that if DNS is available but a name is not found, the lookup attempt should fail rather than continuing to the next entry (/etc/hosts)
    hosts: dns [!UNAVAIL=return] files
    ```

    ??? info "Example configs"

        === "Arch"

            ```yaml
            --8<-- "includes/Configs/nsswitch.conf-garuda"
            ```
        
        === "Fedora"

            ```yaml
            --8<-- "includes/Configs/nsswitch.conf-f38"
            ```
        
        === "RHEL"

            ```yaml
            --8<-- "includes/Configs/nsswitch.conf-rhel9"
            ```
        
        === "PODs"

            ```yaml
            --8<-- "includes/Configs/nsswitch.conf-pods"
            ```
