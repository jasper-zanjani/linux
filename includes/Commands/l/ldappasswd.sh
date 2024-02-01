# Assign a new alphanumeric password to specified user (provided in output)
ldappasswd -xWD 'cn=Admin,dc=ldap,dc=local' 'cn=bob,ou=Users,dc=ldap,dc=local'

# Define a new password interactively with -S (or inline using -s, similar to the -W/-w options)
ldappasswd -xWD 'cn=bob,ou=Users,dc=ldap,dc=local' -S