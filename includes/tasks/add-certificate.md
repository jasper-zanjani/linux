When using TLS/SSL behind a proxy or corporate firewall, it is often necessary to add a certificate to the Certificate Authority (CA) store.
This is because the proxy or corporate firewall is intercepting and re-signing TLS/SSL traffic with a self-signed certificate which is not recognized by the operating system.
This issue manifests in various errors that occur when using command-line tools, all of which invariably mention the authenticity of the issuer's certificate. (1)
{: .annotate }

1.  <div class="grid cards" markdown>

    ``` title="wget"
    ERROR: cannot verify release-assets.githubusercontent.com's certificate, issued by ‘CN=Cisco Umbrella Secondary SubCA nyc-SG,O=Cisco’:
      Unable to locally verify the issuer's authority.
    To connect to release-assets.githubusercontent.com insecurely, use `--no-check-certificate'.
    ```

    ``` title="Azure CLI"
    HTTPSConnectionPool(host='login.microsoftonline.com', port=443): Max retries exceeded with url: /c6b6caf6-be06-4f0b-9273-394412dc2ab7/oauth2/v2.0/token (Caused by SSLError(SSLCertVerificationError(1, '[SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: certificate is not yet valid (_ssl.c:1010)')))
    Certificate verification failed. This typically happens when using Azure CLI behind a proxy that intercepts traffic with a self-signed certificate. Please add this certificate to the trusted CA bundle. More info: https://learn.microsoft.com/cli/azure/use-cli-effectively#work-behind-a-proxy.
    ```

    </div>

When this occurs it is necessary to add the root certificate to the trust store.
Querying the destination server using the following command will show the chain of trust, where each certificate is signed by the one above it.
The root certificate will be the last one.

```sh
openssl s_client -connect $SERVER:443 -showcerts
```

Copying the base 64-encoded certificate into a file will allow it to be queried by openssl and added to the cert store.


=== ":material-ubuntu: Ubuntu"

    On Ubuntu the CA store is located at [**/etc/ssl/certs**](https://documentation.ubuntu.com/server/how-to/security/install-a-root-ca-certificate-in-the-trust-store/).

    ```sh
    sudo apt install -y ca-certificates

    # Add certificate to local certificates directory (making sure the certificate has .crt extension)
    sudo cp $CERT /usr/local/share/ca-certificates

    # Add certificate to trust store
    sudo update-ca-certificates # (1)
    ```

    1.  In fact, **update-ca-certificates** actually creates a symlink to the provided certificates in **/etc/ssl/certs**

    When the output of the command indicates that certificates have not been added, it may be because the command requires that certificates have a name ending in **.crt**.

