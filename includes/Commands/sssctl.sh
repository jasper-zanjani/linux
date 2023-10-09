# sssctl must be run as root

# Check for any typographical errors in SSSD configuration
sssctl config-check

# List available domains
sssctl domain-list 
# => "corp.pods.lcl"

# Display user data for a particular domain
sssctl domain-status corp.pods.lcl