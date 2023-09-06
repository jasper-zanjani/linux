# Security

## GPG

GPG keys are used to sign packages and repos.
For example, **yum** repos and **apt** incorporate APIs and handle GPG keys.
The **KWallet Manager** and [**GNOME Keyring**](https://wiki.gnome.org/Projects/GnomeKeyring) (Seahorse) applications can also be used to manage GPG keys.

## Tasks

#### GPG key pair
:   
    Generate a public and private ("secret") key pair ("keyring") after displaying interactive prompts to the user, who must enter real name and email address and specify variables like key length, encryption algorithm etc.

    ```sh
    gpg --full-generate-key
    gpg --generate-key # (1)
    ```

    1. Generate a new keyring using current default parameters.

    The rngd daemon found in the **rng-tools** package can be enabled for additional entropy if needed by the system.

    ```sh
    pacman -S community/rng-tools
    ```

    The generates a public and private key in **~/.gnupg**.
    The public key, which can be distributed publicly so that people can encrypt messages to the user, is named **pubring.kbx**
    More than one master keypair can be generated in this manner, even for the same email address.

## Commands

#### gpg
:   

    ```sh
    --8<-- "includes/Commands/gpg.sh"
    ```

#### pass
:   
    --8<-- "includes/Commands/pass.md"

#### pwscore
:   
    **pwscore** allows the quality of a password to be checked interactively.
    It is installed as part of **libpwquality**, which is also used to enforce password quality in [Kickstart](Applications/kickstart) files.
