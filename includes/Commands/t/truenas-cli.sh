# ? displays built-in commands while ls displays directories and commands
cli -c 'service vm ls'

# Display VMs
cli -c 'service vm query id,name'

# Start a VM (requires ID number)
cli -c 'service vm start 5'