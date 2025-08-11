

!!! info "Subcommands"

    === "dgst"

        --8<-- "includes/Commands/o/openssl-dgst.md"

    === "ecparam"

        --8<-- "includes/Commands/o/openssl-ecparam.md"

    === "enc"

        --8<-- "includes/Commands/o/openssl-enc.md"

    === "genpkey"

        --8<-- "includes/Commands/o/openssl-genpkey.md"

    === "genrsa"

        --8<-- "includes/Commands/o/openssl-genrsa.md"

    === "pkcs12"

        --8<-- "includes/Commands/o/openssl-pkcs12.md"

    === "rand"

        ```sh
        # Generate random password
        openssl rand -base64 32
        ```

    === "req"

        --8<-- "includes/Commands/o/openssl-req.md"

    === "s_client"

        ```sh
        # Inspect certificate from a website
        openssl s_client -showcerts -connect localhost:8443

        # Download CA certificate from AD
        openssl s_client -connect ldap.tylersguides.com:636 -showcerts < /dev/null
        ```

    === "x509"

        --8<-- "includes/Commands/o/openssl-x509.md"

    === "version"

        ```sh
        # Display directory of certstore, where openssl stores its configuration  by default
        openssl version -d # (1)
        ```

        1. 
            === ":material-redhat: RHEL"
                ```
                OPENSSLDIR: "/etc/pki/tls"
                ```
            === ":material-ubuntu: Ubuntu"
                ```
                OPENSSLDIR: "/usr/lib/ssl"
                ```

#### Adding certificate to CA store

When using TLS/SSL behind a proxy, it is often necessary to add a certificate to the Certificate Authority (CA) store.
This is because the proxy or corporate firewall is intercepting and re-signing TLS/SSL traffic with a self-signed certificate.

This is the case when, for example downloading binaries from Github with tools like wget (1) or using some Azure CLI commands (2).
{: .annotate }

1.  ``` title="Output"
    ERROR: cannot verify release-assets.githubusercontent.com's certificate, issued by ‘CN=Cisco Umbrella Secondary SubCA nyc-SG,O=Cisco’:
      Unable to locally verify the issuer's authority.
    To connect to release-assets.githubusercontent.com insecurely, use `--no-check-certificate'.
    ```

2.  ``` title="Output"
    HTTPSConnectionPool(host='login.microsoftonline.com', port=443): Max retries exceeded with url: /c6b6caf6-be06-4f0b-9273-394412dc2ab7/oauth2/v2.0/token (Caused by SSLError(SSLCertVerificationError(1, '[SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: certificate is not yet valid (_ssl.c:1010)')))
    Certificate verification failed. This typically happens when using Azure CLI behind a proxy that intercepts traffic with a self-signed certificate. Please add this certificate to the trusted CA bundle. More info: https://learn.microsoft.com/cli/azure/use-cli-effectively#work-behind-a-proxy.
    ```

In this case it is necessary to add the certificate to the trust store.

=== ":material-ubuntu: Ubuntu"

    On Ubuntu the CA store is located at [**/etc/ssl/certs**](https://documentation.ubuntu.com/server/how-to/security/install-a-root-ca-certificate-in-the-trust-store/).

    ```sh
    sudo apt install -y ca-certificates

    # Add certificate to local certificates directory
    sudo cp $CERT /usr/local/share/ca-certificates

    # Add certificate to trust store
    sudo update-ca-certificates
    ```

#### PKI certchain

The same algorithm must be used to generate the CA and server keys.
The common name of the CA is inconsequential but that of the server must match the host name the server uses.

<div class="grid cards" markdown>

-   **RSA**

    ```sh
    # CA key and certificate
    openssl genrsa -out ca.key
    openssl req -x509 -new -key ca.key -days 365 -subj '/CN=My CA' -out ca.pem # (1)

    # Server key and CSR
    openssl genrsa -out server.key
    openssl req -new -key server.key -subj '/CN=localhost' -out server.csr
    ```

    1. Equivalent to:
    ```sh
    openssl req -x509 -newkey rsa -keyout ca.key -out ca.pem -subj '/CN=My CA' -noenc
    ```

-   **ECC**

    ```sh
    # CA key and certificate
    openssl genpkey -algorithm ec -pkeyopt ec_paramgen_curve:P-256 -out ca.key
    openssl req -x509 -key ca.key -days 365 -subj '/CN=My Elliptic CA' -out ca.pem # (1)

    # Server key and CSR
    openssl genpkey -algorithm ec -pkeyopt ec_paramgen_curve:P-256 -out server.key
    openssl req -new -key server.key '/CN=localhost' -out server.csr
    ```

    2. Equivalent to:
    ```sh
    openssl ecparam -name prime256v1 -out ec_param.pem
    openssl req -x509 -newkey ec:ec_param.pem -keyout ca.key -out ca.pem -subj '/CN=My ECC CA'
    ```

</div>

```sh
# Sign certificate
openssl x509 -req -in server.csr -CA ca.pem -CAkey ca.key -days 365 -out server.pem
```

Browsers require a PKCS#12 certificate that bundles the key with it and also check to make sure that the common name matches the hostname, and modern browsers like Chrome also require the Subject Alternative Name extension field as well.

```sh
# Export certificate and key to PKCS#12
openssl pkcs12 -export -in ca.pem -inkey ca.key -out ca.p12
```

#### TLS certificates


--8<-- "includes/Tasks/openssl/tls.md"

#### Elliptic curve cryptography


The primary advantage of [elliptic curve cryptography](https://en.wikipedia.org/wiki/Elliptic-curve_cryptography) is reduced key size (and therefore increased speed) for equivalent security strength.

```sh title="Elliptic curves"
# Explore elliptic curve names
openssl ecparam -list_curves # (1)

# Generate a 256-bit ECDSA private key
openssl genpkey -algorithm ec -pkeyopt ec_paramgen_curve:P-256 -out $CA_KEY

# Inspect parameters of a key
openssl ecparam -in $CA_KEY -noout -text
```

1. 
```
--8<-- "includes/Output/openssl-ecparam-list_curves"
```

```sh title="EC parameter files"
# Use a named curve to create a parameter file
openssl ecparam -out ec_param.pem -name prime256v1

# Inspect the parameter file
openssl ecparam -in ec_param.pem -noout -text
```

#### Extensions


X.509 extensions can be incorporated as an INI-format configuration file that is passed to **-extfile**.
A section of the file can be specified by passing the section to **-extension**.

This command to sign a CSR will provide the subject alternative name for a local website.

```sh
openssl x509 -req -in $CSR -CA $CA_CERT -CAkey $CA_KEY \
-days 3650 -extfile v3.ext -extensions EXT  \ # (1)
-out $CLIENT_CERT
```

1. 
```ini title="v3.ext"
[EXT]
subjectAltName=DNS:localhost
```

The **req** subcommand also supports extensions provided inline using **-addext**, but because this feature is [not available on **x509*](https://security.stackexchange.com/questions/74345/provide-subjectaltname-to-openssl-directly-on-the-command-line)* X.509 extensions cannot be provided inline when signing requests.

