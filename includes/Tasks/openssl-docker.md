[Source](https://carpie.net/articles/tls-certificates-for-local-area-networks)

```sh title="Create CA"
openssl genrsa -aes256 -out ca.key 4096
openssl req -x509 -new -nodes -key ca.key -days 3650 -out ca.pem -subj "/CN=MyCA"

# Create server key and CSR
openssl req -nodes -newkey rsa:2048 -keyout server.key -out server.csr -subj="/CN=host1.home.lan"

# Sign CSR
openssl x509 -req -in server.csr -CA ca.pem -CAkey ca.key -CAcreateserial -out server.crt \
-days 3650 -extensions EXT -extfile v3.ext # (1)
```

1. 
```ini title="v3.ext"
[EXT]
subjectAltName=DNS.0:host1.home.lan
```