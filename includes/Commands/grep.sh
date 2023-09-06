# Recursive search
grep -R $TEXT $DIRECTORY

# Add context
grep --after-context=1 ISOs /etc/exports # -A

# Display all valid lines of a configuration file (i.e. all lines that are non-commented and non-empty)
grep -E '^[a-z,A-Z]' /etc/ldap.conf