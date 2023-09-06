# Add a user specified in a local file
ldapadd -x -W -D 'cn=admin,dc=ldap,dc=local' -f bob.ldif