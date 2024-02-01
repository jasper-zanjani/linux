# Add user
kadmin -q 'addprinc username'

# Add administrator
kadmin -q 'addprinc username/admin'

# Remove user
kadmin -q 'delprinc username'

# Display users
kadmin -q 'list_principals'

