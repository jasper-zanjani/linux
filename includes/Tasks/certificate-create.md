```sh title="Create self-hosted Certificate Authority"
# Create a private key to create a self-hosted Certificate Authority, myCA.key
# (Provide a password)
openssl genrsa -des3 -out myCA.key 2048

# Generate a root certificate, myCA.pem
# (Provide same password for key above)
openssl req -x509 -new -nodes -key myCA.key -sha256 -days 1825 -out myCA.pem
```

The certificate is added to the certificate store in a variety of ways depending on distribution.

```sh title="Ubuntu"
sudo cp myCA.pem /usr/local/share/ca-certificates

# Update the certificate store (this command requires PEM format certificates only)
update-ca-certificates
```

On Fedora and Arch, [**p11-kit**](https://github.com/p11-glue/p11-kit/) is used.
p11-kit is an open-source solution for managing PKCS#11 modules and allows [**trust anchors**](https://csrc.nist.gov/glossary/term/trust_anchor) to be imported.
Trust anchor is a cryptographic term used to refer to a trusted Certificate Authority.

```sh title="Write certificate to certificate store"
# The location of the certificate store varies:
# - Arch: /etc/ca-certificates/trust-source
# - Fedora: /etc/pki/ca-trust/source
trust anchor --store myCA.crt

# In the case of error, the certificate should be manually copied

# Arch
cp myCA.crt /etc/ca-certificates/trust-source/anchors

# Fedora
cp myCA.crt /etc/pki/ca-trust/source/anchors

update-ca-trust
```