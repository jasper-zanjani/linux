# Recursive search
grep -r $PATTERN $SEARCH_PATH

# Add context
grep --after-context=1 ISOs /etc/exports # -A

# Display all valid lines of a configuration file (i.e. all lines that are non-commented and non-empty)
grep -E '^[a-z,A-Z]' /etc/ldap.conf

# Print only filenames of matching files recursively
grep -rl $PATTERN $SEARCH_PATH
