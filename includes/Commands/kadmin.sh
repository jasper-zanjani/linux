# Add user
kadmin.local -q 'addprinc username'

# Add administrator
kadmin.local -q 'addprinc username/admin'

# Remove user
kadmin.local -q 'delprinc username'

# Display users
kadmin.local -q 'list_principals'

