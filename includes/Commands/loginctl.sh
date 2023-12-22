# Enable user lingering, which allows users that are not logged in to run long-running services.
loginctl enable-linger

# Confirm
loginctl show-user | grep Linger - 