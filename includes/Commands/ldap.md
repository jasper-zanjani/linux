OpenLDAP utilities take a common set of options.

- **-x** simple authentication instead of [SASL](#sasl)
- **-Y** specify SASL authentication mechanism (i.e. **GSSAPI**, **PLAIN**)
- **-H** URI of the directory server using **ldap://** or **ldaps://** protocol (not necessary when running commands on the server itself)
- **-D** specifying Distinguished Name of user: this can be in the format "user@domain" or like "cn=user,dc=domain"
- **-W** prompt for password interactively (alternatively **-w** will allow the password to be provided inline)


```sh
# Add a user specified in a local file (to the local LDAP server)
ldapadd -xWD 'cn=admin,dc=ldap,dc=local' -f bob.ldif

# Alternatively, adding a POSIX user account to LDAP
ldapadduser john john

# Delete specified user on the specified LDAP server
ldapdelete -xWD 'cn=admin,dc=ldap,dc=local' -H ldap://ldap.local 'uid=john,ou=Users,dc=ldap,dc=local'

# Search for an entry (interestingly, the value for the search results appears to be one greater than 
# the actual number of results)
ldapsearch -xWD 'cn=admin,dc=ldap,dc=local' -H ldap://ldap.local -b 'dc=ldap,dc=local' '(cn=bob)'

# Apparently more or less useless command, since it returns the identity of the binding used to execute it
ldapwhoami -WD 'cn=bob,ou=Users,dc=ldap,dc=local'

# Display entire directory
slapcat
```

??? info "ldapsearch"

    ```sh
    --8<-- "includes/Commands/ldapsearch.sh"
    ```
