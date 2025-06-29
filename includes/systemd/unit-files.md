Unit files are case-sensitive .ini files organized into sections.
Unit files can be found in several directories:

- **/lib/systemd/system** where the system's copy of unit files are placed by default
- **/etc/systemd/system** where unit files override the system default
- **/run/systemd/system** where run-time unit definitions are found and given a higher priority than the system default in /lib but lower than that in /etc. These unit files are created dynamically and lost on reboot.

Unit files come in many different types which can be identified by their filename extension (i.e. **.service**, **target**, etc.).

