[smitty](https://www.ibm.com/docs/en/aix/7.2?topic=s-smitty-command) is a TUI application that facilitates system management and is most typically used for adding or changing users.

```sh
smitty user
```

- [mkuser](https://www.ibm.com/docs/en/aix/7.2?topic=m-mkuser-command) creates a new user.
Various values can be provided inline to override defaults specified in **/usr/lib/security/mkuser.default**.
The default group is **staff**.

- [lsuser](https://www.ibm.com/docs/en/aix/7.2?topic=m-lsuser-command) can be used to inspect a user's details.

- [rmuser](https://www.ibm.com/docs/en/aix/7.2?topic=m-rmuser-command) removes a user

```sh
# Change shell
chsh
```
