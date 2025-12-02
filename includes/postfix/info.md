!!! tip "Commands"

    === "mail"

        --8<-- "includes/cmd/postfix/mail.md"

    === "mailq"

        --8<-- "includes/cmd/postfix/mailq.md"

    === "postcat"

        --8<-- "includes/cmd/postfix/postcat.md"

    === "postconf"

        --8<-- "includes/cmd/postfix/postconf.md"

    === "postmap"

        --8<-- "includes/cmd/postfix/postmap.md"

```sh
# Testing mail
echo "Testing" | mail -s Testing root@localhost
mailq
```

Postfix (1) is a _mail transfer agent_ (MTA) and handles the delivery of messages between servers and locally within the system using SMTP exclusively.
{: .annotate }

1.  

    --8<-- "includes/postfix/callout.md"
