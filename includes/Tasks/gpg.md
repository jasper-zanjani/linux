# GPG

**GPG** keys are used to sign packages and repos.
For example, **yum** repos and **apt** incorporate APIs and handle GPG keys.
The **KWallet Manager** and [**GNOME Keyring**](https://wiki.gnome.org/Projects/GnomeKeyring) (Seahorse) applications can also be used to manage GPG keys.

## Tasks

#### GPG key pair
:   
    Generate a public and private ("secret") key pair ("keyring") after displaying interactive prompts to the user, who must enter real name and email address and specify variables like key length, encryption algorithm etc.

    ```sh
    gpg --full-generate-key

    # Generate a new keyring using current default parameters.
    gpg --generate-key
    ```

    ```sh
    # Install the rngd daemon for additional entropy if needed
    pacman -S community/rng-tools
    ```

    The generates a public and private key in **~/.gnupg**.
    The public key, which can be distributed publicly so that people can encrypt messages to the user, is named **pubring.kbx**
    More than one master keypair can be generated in this manner, even for the same email address.

## Commands

```sh
--8<-- "includes/Commands/g/gpg.sh"
```

A variety of other applications use GPG in the background.

#### apt-key
:   

    --8<-- "includes/Commands/a/apt-key.md"


#### GNOME Keyring
:   

    --8<-- "includes/Tasks/gnome-keyring.md"


#### pacman-key
:   

    --8<-- "includes/Commands/p/pacman-key.md"


#### rpmkeys
:   

    --8<-- "includes/Commands/r/rpmkeys.md"


#### pass
:   

    --8<-- "includes/Commands/p/pass.md"

