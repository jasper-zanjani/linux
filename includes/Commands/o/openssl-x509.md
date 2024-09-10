```sh title="Inspect certificates"
# Inspect X.509 certificate
openssl x509 -in $CERT

# Inspect certificate end date only (-noout suppresses output)
openssl x509 -in $CERT -noout -enddate 

# Inspect subject name
openssl x509 -in $CERT -noout -subject
```

```sh title="Convert certificates"
# Convert binary (DER) certificate to PEM format
openssl x509 -in myCA.crt -inform DER -out myCA_pem.crt -outform PEM
```

```sh title="Sign CSR"
# Sign a CSR with CA, generating client certificate
openssl x509 -req \
    -in $CSR -CA $CA_CERT -CAkey $CA_KEY \
    -days 365 -extfile \
    -out $CLIENT_CERT

# -extensions specifies a section from the extensions file from which to add extensions
openssl x509 -req -in $CSR -CA $CA_CERT -CAkey $CA_KEY \
    -days 3650 -extfile v3.ext -extensions EXT  \ # (1)
    -out $CLIENT_CERT

openssl x509 -req \
    -in $CSR -CA $CA_CERT -CAkey $CA_KEY \
    -days 365 -extfile openssl.cnf -extensions server-cert \ # (2)
    -out $CLIENT_CERT
```

1. 
```ini title="v3.ext"
[EXT]
subjectAltName=DNS.0:host1.home.lan
```
2. 
```ini title="openssl.cnf"
[server-cert]
extendedKeyUsage = serverAuth

[client-cert]
extendedKeyUsage = clientAuth
```

