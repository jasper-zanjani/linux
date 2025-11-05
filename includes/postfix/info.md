!!! tip "Commands"

    === "mailq"

        --8<-- "includes/cmd/postfix/mailq.md"

    === "postcat"

        --8<-- "includes/cmd/postfix/postcat.md"

    === "postconf"

        --8<-- "includes/cmd/postfix/postconf.md"

```sh
# Testing mail
echo "Testing" | mail -s Testing root@localhost
mailq
```

Postfix (1)
{: .annotate }

1.  

    --8<-- "includes/postfix/callout.md"
