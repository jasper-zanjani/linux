OpenLDAP utilities take a common set of options.

- **-x** simple authentication instead of [SASL](#sasl)
- **-Y** specify SASL authentication mechanism (i.e. **GSSAPI**, **PLAIN**)
- **-H** URI of the directory server using **ldap://** or **ldaps://** protocol
- **-D** specifying Distinguished Name of user: this can be in the format "user@domain" or like "cn=user,dc=domain"
- **-W** prompt for password interactively (alternatively **-w** will allow the password to be provided inline)

```sh title="ldapsearch"
--8<-- "includes/Commands/ldapsearch.sh"
```

```sh title="ldapadd"
--8<-- "includes/Commands/ldapadd.sh"
```