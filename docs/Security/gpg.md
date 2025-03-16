# GPG

**GPG** keys are used to sign packages and repos.
For example, **yum** repos and **apt** incorporate APIs and handle GPG keys.
The **KWallet Manager** and [**GNOME Keyring**](https://wiki.gnome.org/Projects/GnomeKeyring) (Seahorse) applications can also be used to manage GPG keys.

## Tasks

<div class="grid cards" markdown>

-   #### Configuration

    ---

    Public GPG keys are stored in:

    :material-redhat: /etc/pki/rpm-gpg

    :material-ubuntu: /etc/apt/keyrings

-   #### Encrypt and decrypt file

    ---


    ```sh
    # A new, encrypted file will be created with the filename extension .gpg.
    gpg --encrypt $FILE
      # -e

    # Cleartext sent to STDOUT
    gpg --decrypt $FILE.gpg
      # -d
    ```

-   #### Create GPG key pair

    ---

    Generate a public and private ("secret") key pair ("keyring") after displaying interactive prompts to the user, who must enter real name and email address and specify variables like key length, encryption algorithm etc.

    ```sh
    gpg --full-generate-key

    # Generate a new keyring using current default parameters.
    gpg --generate-key
    ```

    This command will interactively prompt for a name and email. 
    Each invocation generates two private key under **~/.gnupg/private-keys-v1.d**.
    The public key, which can be distributed publicly so that people can encrypt messages to the user, is stored in the user's [keybox](#keybox) at **~/.gnupg/pubring.kbx**.

    ```sh
    # Export public key in base64 (or "Ascii armored" as GnuPG likes to call it)
    gpg --export --armor $KEYID
    ```
    More than one master keypair can be generated in this manner, even for the same email address.


-   #### Verify signing key

    ---

    Many packages and repositories use signing keys to allow users to verify their security.

    - [reth](https://github.com/paradigmxyz/reth/releases)

    ```sh
    # Receive a specified key from a keyserver, adding it to the keyring
    gpg --keyserver keyserver.ubuntu.com --recv-keys $KEYID

    # Confirm key was downloaded by displaying public keys
    gpg --list-keys # -k

    gpg --verify $SIGNATURE
    ```

    A 40-character hexadecimal fingerprint can be displayed with the following command and manually compared with that provided by the website.

    ```sh
    gpg --dry-run --quiet --no-keyring --import --import-options import-show $KEY

    # Display the fingerprint only
    gpg --dry-run --import --quiet --no-keyring --import-options import-show $KEY \
        | awk '/[0-9|A-F]{40}/ { print $1 }'
    ```

-   #### Keybox

    ---

    A [**keybox file**](https://www.gnupg.org/documentation/manuals/gnupg/kbxutil.html) is a file format used to store public keys along with meta information and indices.
    One such keybox file can be found at **~/.gnupg/pubring.kbx**, which is the default public keyring used by GnuPG.

    The **kbxutil** utility can be used to inspect keybox files.


    ```sh
    kbxutil ~/.gnupg/pubring.kbx # => (1)

    # Records are called blobs in this output
    kbxutil --stats ~/.gnupg/pubring.kbx # => (2)
    ```    

    1. 
        === "Empty"
            ```
            --8<-- "includes/Output/kbxutil/kbxutil"
            ```
        === "1 key"
            ```
            --8<-- "includes/Output/kbxutil/kbxutil1"
            ```
    2. 
        === "Empty"
            ```
            --8<-- "includes/Output/kbxutil/kbxutil-stats"
            ```
        === "1 key"
            ```
            --8<-- "includes/Output/kbxutil/kbxutil-stats1"
            ```



-   #### Get more entropy

    ---

    Install the rngd daemon from the **rng-tools** package for additional entropy if needed.

    === ":material-fedora: Fedora"

        ```sh
        dnf install -y rng-tools
        ```

    === ":material-arch: Arch"

        ```sh
        pacman -S community/rng-tools
        ```

</div>

## Commands

```sh
--8<-- "includes/Commands/g/gpg.sh"
```

A variety of other applications use GPG in the background.


<div class="grid cards" markdown>

-   #### apt-key

    ---

    --8<-- "includes/Commands/a/apt-key.md"


-   #### dnf

    ---

    --8<-- "includes/Commands/d/dnf-gpg.md"


-   #### GNOME Keyring

    ---

    --8<-- "includes/Applications/gnome-keyring.md"


-   #### pacman-key

    ---

    --8<-- "includes/Commands/p/pacman-key.md"

</div>

#### pass

--8<-- "includes/Commands/p/pass.md"
