
```sh
# Install postfix as well as command-line mail client
dnf install -y postfix s-nail

systemctl enable --now postfix
```

Send a test email

```sh
echo test | mail -s "Testing local delivery" jasper

# This only works on RHEL for some reason
tail /var/log/maillog # (1)
```

1. 
```
--8<-- "includes/Output/postfix/tail-var-log-maillog"
```

Browse email from the command-line

```sh
mail # (1)
```

1. 
```
--8<-- "includes/Output/postfix/mail"
```