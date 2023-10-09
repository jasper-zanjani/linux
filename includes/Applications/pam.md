**Pluggable authentication modules** form an authentication framework that can be used by "PAM-aware applications", abstracting authentication into a separate subsystem without requiring changes to source code of applications.

These applications have config files that are found in **/etc/pam.d**
PAM config files are a series of space-delimited one-liners that follow the following format

```
module-interface    control-flag    module-name    [arguments]
```

Module [**interfaces**](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system-level_authentication_guide/pam_configuration_files) represent the type of authentication action :

- **Auth** modules execute during authentication
- **Account** modules execute after authentication and check for account restrictions. This interface verifies that access is allowed, for example checking if the user account has expired or if access is allowed at a particular time of day.
- **Password** is used for changing user passwords
- **Session** configures and manages user sessions by performing additional tasks to allow access, i.e. mounting a home directory or making a mailbox available.

Control flags tell PAM what to do with the result:

- **Required** modules must return success, but failure does not prevent other modules being run
- **Requisite** modules must return success, and other modules are not executed in case of failure
- **Sufficient** modules prevent other modules from being run in case of success, because **only** this module must return success
- **Optional** modules do not affect affect outcome unless it is the only module executed
- **Include** include another module's contents

The various PAM modules have man pages prefixed with **pam\_**, i.e. "pam\_wheel" etc.

Module interfaces can be **stacked**, placed one on top of another, so that multiple modules are used together for a single purpose.

```sh title="/etc/pam.d/setup"
# Check whether the current user is root by verifying that UID is 0. In case of success, no other modules are consulted and the command is executed.
auth       sufficient	pam_rootok.so

# Include contents of /etc/pam.d/system-auth
auth       include	    system-auth

# Allow anyone to reboot the system: pam_permit always permits access.
account    required	    pam_permit.so

# Ensure the setup utility does not fail
session	   required	    pam_permit.so
```

```sh title="/etc/pam.d/common-account"
# Allowing a login to create a new home directory
session required pam_mkhomedir.so skel=/etc/skel umask=077
```