# List unit files of various types
systemctl list-units
systemctl list-timers
systemctl list-sockets

# Display all service files
systemctl list-unit-files --type=service

# Filter unit files by name
systemctl list-unit-files 'sssd*'

# Clear the SYSTEMD_PAGER variable to prevent systemctl from using a pager
export SYSTEMD_PAGER=

# Display source code of unit file
systemctl cat sssd.service

# Edit unit file
systemctl edit sssd.service

# Configure service to start on boot and start it immediately
systemctl enable --now $SERVICE

systemctl status $SERVICE

systemctl is-active $SERVICE 

systemctl disable $SERVICE

# Prevent service from being started inadvertently by another process
systemctl mask $SERVICE

systemctl restart $SERVICE

# Boot targets
systemctl get-default
systemctl set-default graphical.target

# Change target
systemctl isolate emergency.target

# Suspend system
systemctl suspend

# Create a user service at ~/.config/systemd/user
systemctl --user enable --now container-notes.service

# Confirm
systemctl --user status container-notes.service
