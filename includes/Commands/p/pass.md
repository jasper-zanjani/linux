The [standard unix password manager](https://www.passwordstore.org/), backed by GPG, is a command-line password manager and MFA program.
It can be configured as a [terminal password manager](https://www.youtube.com/watch?v=sVkURNfxPd4).

The first step in using pass is generating a new [GPG key pair](#gpg-key-pair). 

```sh
# Display public keys
gpg -k # --list-keys

# Unwanted keys can be deleted by specifying the public key:
gpg --delete-secret-and-public-keys ▒▒▓░░▒▓░▓░▓░▓▒░░▒▒░░░▒▓░▒░▒░▓░▒▒▒▓▒▒▓░▓▒░

# Now a password store can be initialized by providing that same email address.
# This email is stored at **~/.password-store/.gpg-id**
pass init email@example.com

# Add password
pass add email

# This produces a binary, encrypted file at **~/.password-store/email.gpg**.
# The password can be retrieved, after authenticating with the master password, with the following:
pass email # (1)

# Display names of passwords
# This command is equivalent to using **tree** on the password store directory (i.e. ~/.password-store)
pass ls

# Pass can also handle OTP generation for MFA, as long as you can retrieve the OTP URI (beginning with otpauth://). 
# QR code images can be deciphered with **zbarimg** to retrieve these URIs.
pass otp add mimecast # (2)
```

1. In fact, because this is simply a GPG encrypted file, GPG could be used equivalently. In fact, this appears to be the command executed by the pass shell script.
```sh
gpg -dq ~/.password-store/email.gpg
```
2. Note that otpauth URLs usually contain an embedded email address, which must match that of the intialized password store.
If this identity does not match, an error that read "There is no assurance this key belongs to the named user" is produced .
