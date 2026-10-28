Test whether the `public` network actually works from another host

```sh
snmpwalk -v2c -c public $SERVER_IP 1.3.6.1.2.1.1
snmpget -v2c -c public $SERVER_IP sysName.0
```

If any data is received other than "Timeout: No Response", then the community string is valid.
