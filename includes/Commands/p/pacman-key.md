**pacman-key** is a wrapper script around GnuPG which is used to manage pacman's keyring (located at **/etc/pacman.d/gnupg** by default).

When adding a new repo, the repo and package signing key must also be added to pacman's keyring.

```sh title="Add key provided by archzfs repo"
pacman-key --recv-keys DDF7DB817396A49B2A2723F7403BD972F75D9D76

# Locally sign the key, i.e. "root the web of trust in the local private key" 
# according to documentation.
pacman-key --lsign-key DDF7DB817396A49B2A2723F7403BD972F75D9D76
```