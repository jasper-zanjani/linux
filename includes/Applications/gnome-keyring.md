[**GNOME Keyring**](https://wiki.gnome.org/action/show/Projects/GnomeKeyring) is a collection of components that store and manage application access to secrets, passwords, keys, and certificates.

GNOME Keyring can be managed:

- [Seahorse](https://wiki.gnome.org/Apps/Seahorse) (now called **Passwords and Keys**) via GUI
- secret-tool which uses (and is included in) [libsecret](https://gitlab.gnome.org/GNOME/libsecret)
- [gnome-keyring-query](https://web.archive.org/web/20160326164641/http://www.gentoo-wiki.info/HOWTO_Use_gnome-keyring_to_store_SSH_passphrases) which uses the archived [libgnome-keyring](https://gitlab.gnome.org/GNOME/libgnome-keyring)

In order for GNOME Keyring to unlock automatically, it has to be started by PAM.

```sh
# Add to end of auth block
auth    optional pam_gnome_keyring.so

# Add to end of session block
session optional pam_gnome_keyring.so auto_start

# Add to password block of /etc/pam.d/passwd
password optional pam_gnome_keyring.sok
```