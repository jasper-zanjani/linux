# Without TLS
ldapsearch -xWD "jzhang@corp" -H "ldap://TPAPDVWDC02.corp.pods.lcl" -b "dc=corp,dc=pods,dc=lcl"  "(sAMAccountName=jzhang)"

# With TLS
ldapsearch -xWD "jzhang@corp" -H "ldaps://TPAPDVWDC02.corp.pods.lcl" -b "dc=corp,dc=pods,dc=lcl" "(sAMAccountName=jzhang)"

# Specifying SASL/GSSAPI
ldapsearch -Y GSSAPI -H "ldap://TPAPDVWDC02.corp.pods.lcl" -b "dc=corp,dc=pods,dc=lcl" -D "jzhang@corp" -W "(sAMAccountName=jzhang)"

# Specifying SASL/PLAIN over TLS (not supported using the AD provider)
ldapsearch -Y PLAIN -H "ldaps://TPAPDVWDC02.corp.pods.lcl" -b "dc=corp,dc=pods,dc=lcl" -D "jzhang@corp" -W "(sAMAccountName=jzhang)"