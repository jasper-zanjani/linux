```sh
# List trust policy store items
trust list

# List ca-anchors
trust list --filter=ca-anchors

# Add a certificate to the CA trust store 
trust anchor /path/to/cert.pem
```