```sh
--8<-- "includes/Commands/g/gpg.sh"
```

**GPG** keys are used to sign packages and repos and encrypt and decrypt files.

-   For example, **yum** repos and **apt** incorporate APIs and handle GPG keys.
-   **KWallet Manager** and [**GNOME Keyring**](https://wiki.gnome.org/Projects/GnomeKeyring) (Seahorse) applications can also be used to manage GPG keys.

#### Keys

A public and private key pair is referred to as a *keyring*{: #keyring }.

-   Public keys for the system are stored in  **/etc/pki/rpm-gpg** :material-redhat: or **/etc/apt/keyrings** :material-ubuntu:.

-   A [*keybox file*](https://www.gnupg.org/documentation/manuals/gnupg/kbxutil.html) is a file format used to store public keys along with meta information and indices (Inspect keybox files with **kbxutil** (1) ).
    One such keybox file can be found at **$HOME/.gnupg/pubring.kbx**, which is the default public keyring used by GnuPG.

```sh title="Generate keys"
gpg --full-generate-key

# Generate a new keyring using current default parameters.
gpg --generate-key
```

This command will interactively prompt for a name and email. 
Each invocation generates two private key under **$HOME/.gnupg/private-keys-v1.d**.
The public key, which can be distributed publicly so that people can encrypt messages to the user, is stored in the user's [keybox](#keybox) at **$HOME/.gnupg/pubring.kbx**.


```sh
# A new, encrypted file will be created with the filename extension .gpg.
gpg --encrypt $FILE
  # -e

# Cleartext sent to STDOUT
gpg --decrypt $FILE.gpg
  # -d
```


More than one master keypair can be generated in this manner, even for the same email address.


{: .annotate }

1.  

    --8<-- "includes/cmd/kbxutil/info.md"

```sh
# Export public key in base64 (1)
gpg --export --armor $KEYID
```

1.  _Armor_ (`--armor`, `--dearmor`) refers to the process of using base64 encoding to convert a binary file to ASCII.

#### Verify signing key of packages

Many packages and repositories use public GPG keys to allow users to verify authenticity of downloaded packages.

<div class="grid cards" markdown>

-   [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
    
    ---

    ```sh hl_lines="3-5 7-10"
    --8<-- "includes/tasks/terraform-install-ubuntu.sh"
    ```

-   [reth](https://github.com/paradigmxyz/reth/releases)

    ---

</div>

```sh
# Receive a specified key from a keyserver, adding it to the keyring
gpg --keyserver keyserver.ubuntu.com --recv-keys $KEYID

# Confirm key was downloaded by displaying public keys
gpg --list-keys # -k

gpg --verify $SIGNATURE
```

A 40-character hexadecimal fingerprint can be displayed with the following command and manually compared with that provided by the website.

```sh
gpg --dry-run --quiet --no-keyring --import \
    --import-options import-show $KEY

# Display the fingerprint only
gpg --dry-run --quiet --no-keyring --import \
    --import-options import-show $KEY \
    | awk '/[0-9|A-F]{40}/ { print $1 }'
```

