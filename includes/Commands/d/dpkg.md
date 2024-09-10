```sh
# Enable 32-bit architecture
dpkg --add-architecture i386

# If an apt upgrade was interrupted, this command must be run.
dpkg --configure -a
```