# RPM security

The rpm utility has [its own GPG key management](https://www.redhat.com/sysadmin/rpm-gpg-verify-packages) meant to facilitate verification of packages before installation apart from the user's personal GPG keyring.

```sh
# Download and install a public signing key (URL or local path)
rpm --import $KEY

# The rpmkeys utility can be used alternatively
rpmkeys --import $PUBKEY

# Query the RPM database for all installed signing keys
rpm -qa gpg-pubkey*

# Inspect the specific key
rpm -qi gpg-pubkey-d88e42b4-64f6fad9 # => (1)

# Verify the package
rpm -K $PACKAGE # => $PACKAGE: digests signatures OK

# Remove the key
rpm -e gpg-pubkey-d88e42b4-64f6fad9
```

1. 
```
--8<-- "includes/Output/rpm/rpm-qi"
```