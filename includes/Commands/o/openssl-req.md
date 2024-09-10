```sh title="Create CSR"
# Generate a certificate signing request (CSR) to be sent to a Certificate Authority
openssl req -new -key $CA_KEY -sha256 -out filename.csr
```

```sh title="Create self-signed certificates by providing -x509"
# Generate a new certificate valid for 5 years using a preexisting key, 
# interactively inputting information that wil be incorporated into subject information.
# Self-signed certificates are not encrypted by default
openssl req -new -x509 -key $CA_KEY -days 1825 -out $CA_CERT

# Generate a new certificate valid for 10 years, setting a subject name from the command-line
openssl req -new -x509 -key $CA_KEY -days 3650 -out $CA_CERT -subj "/CN=MyCA"

# Use a configuration file to use presets
openssl req -x509 -new -key $CA_KEY -sha256 -days 365 -out $CA_CERT -config $CFG_FILE -extensions v3_ca -subj "/CN=SocketTools Test CA"
```

For all algorithms except RSA, the argument to **-newkey** must take the form **`$ALGORITHM:$PARAMS`**.
This means that
In the case of RSA, the number of bits can be provided, i.e. `-newkey rsa:2048`.

```sh title="Create a server key and CSR in one-liner"
# Using RSA, the argument to -newkey can optionally take the number of bits (2048 by default)
openssl req -new -newkey rsa -keyout $KEY -out $CSR -subj '/CN=localhost'

# Using ECC, the argument to -newkey must specify a parameters file (1)
# This command defaults to encryption with a pass phrase unless -noenc is provided.
openssl req -new -newkey ec:$PARAMS_FILE -keyout $KEY -out $CSR -subj '/CN=localhost' -noenc

# Inspect CSR
openssl req -in $CSR -text -noout
```

1. 
```sh
openssl ecparam -name prime256v1 -out $PARAMS_FILE
```