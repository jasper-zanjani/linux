# Certificates

A **certificate** contains a public key, in addition to the issues, use, and other metadata.
It is signed by a certificate authority (CA) using the CA's private key.

A **certificate signing request** (CSR) contains information the CA will use to create a certificate, including the public key.
It is usually created in a base 64 encoded PEM format.
It must be generated on the device that will be granted the certificate, then sent to the CA to be signed by the private key.

<div class="grid cards" markdown>


-   #### Formats

    There are a rich variety of X.509 certificate encoding formats, of two basic types: Base64 encoded (ASCII text) and binary encoded.

    - **PEM** (Privacy Enhanced Mail, file extensions include **.pem**, **.crt**, **.cer**, and **.key**) originally comes from an email encryption standasrd but is now a commonly used container format that may include just the public certificate or an entire ceritificate chain including public key, private key, and root certificates in a single base64-encoded file.

    - [**PKCS#12**](https://en.wikipedia.org/wiki/PKCS_12) (file extensions including **.pfx** and **.p12**) is a container file format for storing many cryptographic objects as a single binary file, typically used to bundle a private key with its X.509 certificate.
    It is the successor to Microsoft's PFX format, and in fact the terms are used interchangeably.


-   #### Extensions

    ---

    The [**Subject Alternative Name**](https://docs.redhat.com/en/documentation/red_hat_certificate_system/9/html/administration_guide/standard_x.509_v3_certificate_extensions#Standard_X.509_v3_Certificate_Extensions-subjectAltName) (SAN) is an extension to the X.509 specification that includes one or more alternative (non-X.500) names for the identity bound by the CA to the certified public key, incuding DNS name, email address, IP address, and URI.



</div>

## Commands

#### openssl

--8<-- "includes/Commands/o/openssl.md"

<div class="grid cards" markdown>

-   #### certtool

    ---

    ```sh
    # Generate private key (256-bit ECDSA)
    certtool --generate-privkey --sec-param High --key-type=ecdsa --outfile $CA_KEY
    ```

-   #### trust

    ---

    ```sh
    # Add CA to certstore
    trust anchor $CA

    # Remove CA from certstore
    trust anchor --remove $CA
    ```

</div>
