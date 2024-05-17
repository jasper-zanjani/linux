=== "useradd"

    ```sh title="useradd"
    # Create a new user with default home directory and specifying shell
    useradd -m -s /usr/bin/fish $USER
    #       --create-home --shell

    # Display configuration
    useradd -D
    #       --defaults
    ```

    ??? info "/etc/default/useradd"

        === ":material-arch: Arch"

            ```ini
            --8<-- "includes/Configs/useradd/arch"
            ```

        === ":material-fedora: Fedora 37"

            ```ini
            --8<-- "includes/Configs/useradd/f37"
            ```

=== "groupadd"

    ```sh
    # Specify GID
    groupadd -g 3000 media
    #      --gid
    ```

=== "usermod"

    ```sh
    # Add group membership
    usermod -aG jasper,media,wheel jasper

    ```

=== "userdel"

    ```sh
    # Delete an existing user account as well as the user's home directory
    userdel -r $USER
    #       --remove
    ```

=== "gpasswd"

    ```sh
    ## Administer /etc/group and /etc/gshadow 
    # Add user to group
    gpasswd -a $USER $GROUP

    # Add user as admin of group
    gpasswd -A $USER $GROUP

    # Remove user from group
    gpasswd -d $USER $GROUP
    ```
