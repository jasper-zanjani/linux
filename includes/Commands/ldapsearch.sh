# Without TLS
ldapsearch -x -H "ldap://TPAPDVWDC02.corp.pods.lcl" -b "dc=corp,dc=pods,dc=lcl" -D "jzhang@corp" -W "(sAMAccountName=jzhang)"

# With TLS
ldapsearch -x -H "ldaps://TPAPDVWDC02.corp.pods.lcl" -b "dc=corp,dc=pods,dc=lcl" -D "jzhang@corp" -W "(sAMAccountName=jzhang)"

# Specifying SASL/GSSAPI
ldapsearch -Y GSSAPI -H "ldap://TPAPDVWDC02.corp.pods.lcl" -b "dc=corp,dc=pods,dc=lcl" -D "jzhang@corp" -W "(sAMAccountName=jzhang)"

# Specifying SASL/PLAIN over TLS (not supported using the AD provider)
ldapsearch -Y PLAIN -H "ldaps://TPAPDVWDC02.corp.pods.lcl" -b "dc=corp,dc=pods,dc=lcl" -D "jzhang@corp" -W "(sAMAccountName=jzhang)"