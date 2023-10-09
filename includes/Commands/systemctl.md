#### systemctl
:   

    ```sh title="Services"
    # Display all services
    systemctl list-unit-files --type=service

    # Filter unit files by name
    systemctl list-unit-files 'sssd*'

    # Configure service to start on boot and start it immediately
    systemctl enable --now $SERVICE

    systemctl status $SERVICE
    
    systemctl is-active $SERVICE 
    
    systemctl disable $SERVICE
    
    # Prevent service from being started inadvertently by another process
    systemctl mask $SERVICE

    systemctl restart $SERVICE
    ```

    ```sh
    # Boot targets
    systemctl get-default
    systemctl set-default graphical.target
    
    # Change target
    systemctl isolate emergency.target
    
    # Suspend system
    systemctl suspend
    ```

    **--user** specifies the service manager of the calling user.

    ```sh
    # This will create container-notes.service at ~/.config/systemd/user
    systemctl --user enable --now container-notes.service

    # Confirm
    systemctl --user status container-notes.service
    ```