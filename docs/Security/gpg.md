# GPG

**GPG** keys are used to sign packages and repos.
For example, **yum** repos and **apt** incorporate APIs and handle GPG keys.
The **KWallet Manager** and [**GNOME Keyring**](https://wiki.gnome.org/Projects/GnomeKeyring) (Seahorse) applications can also be used to manage GPG keys.

Red Hat derivative distros store public GPG keys in **/etc/pki/rpm-gpg**

## Tasks

#### GPG key pair

Generate a public and private ("secret") key pair ("keyring") after displaying interactive prompts to the user, who must enter real name and email address and specify variables like key length, encryption algorithm etc.

```sh
gpg --full-generate-key

# Generate a new keyring using current default parameters.
gpg --generate-key
```

Install the rngd daemon from the **rng-tools** package for additional entropy if needed.

=== ":material-fedora: Fedora"

    ```sh
    dnf install -y rng-tools
    ```

=== ":material-arch: Arch"

    ```sh
    pacman -S community/rng-tools
    ```

The generates a public and private key in **~/.gnupg**.
The public key, which can be distributed publicly so that people can encrypt messages to the user, is named **pubring.kbx**
More than one master keypair can be generated in this manner, even for the same email address.

#### Verify signing key

Many packages and repositories use signing keys to allow users to verify their security.
A 40-character hexadecimal fingerprint can be displayed with the following command and manually compared with that provided by the website.

```sh
gpg --dry-run --quiet --no-keyring --import --import-options import-show $KEY

# Display the fingerprint only
gpg --dry-run --import --quiet --no-keyring --import-options import-show $KEY \
    | awk '/[0-9|A-F]{40}/ { print $1 }'
```


## Commands

```sh
--8<-- "includes/Commands/g/gpg.sh"
```

A variety of other applications use GPG in the background.


<div class="grid cards" markdown>

-   #### apt-key

    ---

    --8<-- "includes/Commands/a/apt-key.md"


-   #### GNOME Keyring

    ---

    --8<-- "includes/Applications/gnome-keyring.md"


-   #### pacman-key

    ---

    --8<-- "includes/Commands/p/pacman-key.md"


-   #### rpmkeys

    ---

    --8<-- "includes/Commands/r/rpmkeys.md"

-   #### pass

    ---

    --8<-- "includes/Commands/p/pass.md"

</div>