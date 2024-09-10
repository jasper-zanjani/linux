# IAM

## PAM

--8<-- "includes/Applications/pam.md"



## Tasks

<div class="grid cards" markdown>


-   #### User management

    ---

    ```sh title="Lock user"
    usermod -L $USER # --lock
    passwd -l $USER  # --lock
    ```

    ```sh title="Unlock user"
    usermod -U $USER # --unlock
    passwd -u $USER  # --unlock
    ```

-   #### Groups

    ---

    ```sh title="Display groups of effective user"
    id -Gn
    getent group | grep $(whoami) -
    ```


-   #### SSSD
   
    ---

    SSSD utilities like **sssctl** and **authselect** can be installed from the **sssd-tools package**.

    ```sh
    dnf install -y sssd-tools
    ```

</div>

## Commands

#### authselect
:   
    
    **Authselect** allows configuration of system identity and authentication sources by selecting one of several profiles.

    - **sssd** enables SSSD for systems that use LDAP authentication
    - **winbind** enables the Winbind utility for systems directly integrated with AD
    - **nis** ensure compatibility with legacy Network Information Service (NIS) systems
    - **minimal** serves only local users and groups directly from system files

    Authselect modifies /etc/nsswitch.conf and files in /etc/pam.d.

#### chage
:   

    ```sh
    --8<-- "includes/Commands/c/chage.sh"
    ```

#### getent
:   

    ```sh
    --8<-- "includes/Commands/g/getent.sh"
    ```

#### lastb
:   

    ```sh
    --8<-- "includes/Commands/l/lastb.sh"
    ```

#### sudo
:   

    ```sh
    --8<-- "includes/Commands/s/sudo.sh"
    ```

#### shadow-utils
:   

    --8<-- "includes/Commands/s/shadow-utils.md"


## Configs

#### /etc/sudoers
:   
    --8<-- "includes/Configs/s/sudoers.md"

#### /etc/nsswitch.conf
:   
    The **Name Service Switch (NSS)** configuration file at **/etc/nsswitch.conf** is known as the service switch file or simply the switch file. 
    It provides data providers in the order they should be consulted, typically in order of most common use for speed.

    - **files** refers to the system's local passwd and group files
    - **sss** refers to SSSD
    - **ldap**
    - **myhostname** systemd host names
    - **mymachines** systemd machine names
    - **mdns\***, **mdns\*_minimal** Avahi mDNS/DNS-SD
    - **resolve** systemd resolved resolver
    - **systemd** systemd for dynamicr option
    - **winbind** Samba winbind support
    - **wins** Samba wins support
    - **wrapper** wrapper module for testing


    The **hosts** key determines how hostnames are mapped to IP addresses:

    ```yaml
    # Typical default entry, giving preference to /etc/hosts
    hosts: files dns

    # If DNS is available but a name is not found, the lookup attempt should fail rather than continuing to the next entry (/etc/hosts)
    hosts: dns [!UNAVAIL=return] files
    ```

    ??? info "Example configs"

        === ":material-arch: Arch"

            ```yaml
            --8<-- "includes/Configs/nsswitch.conf-garuda"
            ```
        
        === ":material-fedora: Fedora"

            ```yaml
            --8<-- "includes/Configs/nsswitch.conf-f38"
            ```
        
        === ":material-redhat: RHEL"

            ```yaml
            --8<-- "includes/Configs/nsswitch.conf-rhel9"
            ```
        
        === "PODs"

            ```yaml
            --8<-- "includes/Configs/nsswitch.conf-pods"
            ```
