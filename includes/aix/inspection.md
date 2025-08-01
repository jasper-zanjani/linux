AIX commands follow a _verb_-_object_ pattern similar to IBM i commands.

<div class="grid cards" markdown>

-   **Display commands**

    Command | Description
    --- | ---
    `lsvg` | list volume groups
    `lslv` | list logical volumes
    `lsfs` | list file systems
    `lsps` | list paging spaces
    `lsdev` | list devices

-   **Change commands**

    Command | Description
    --- | ---
    `chvg` | change volume groups
    `chlv` | change logical volumes
    `chfs` | change file systems
    `chps` | change paging spaces
    `chdev` | change devices

-   **Remove commands**

    Command | Description
    --- | ---
    `rmvg` | remove volume groups
    `rmlv` | remove logical volumes
    `rmfs` | remove file systems
    `rmps` | remove paging spaces
    `rmdev` | remove devices

</div>


Use [oslevel](https://www.ibm.com/docs/en/aix/7.2?topic=o-oslevel-command) to check AIX version information of a running system, including base operating system, technology level, and service pack.

```sh title="System information"
# Only major version
uname -v    # => 7

# Display detailed version information
oslevel     # => 7.2.0.0
oslevel -s  # => 7200-05-08-2420 (1)

# Create the whatis database
catman -w

# Get help with a command
whatis catman

# Display a brief help message for new users
help

# Display machine type
uname -M

# Display system information
prtconf

# Display name and parameters of LPARs
lparstat -i

# Display status of all subsystems
lssrc -a

# Similar to Linux top command
topas

# Monitor system load interactively
nmon

# List devices
lsdev
```

1. 
    -   **7200** base level (OS Version 7.2)
    -   **05** technology level (formerly maintenance level)
    -   **08** service pack
    -   **2420** build sequence identifier, used to determine valid technology levels and service packs that can be applied to the current level (20th week of the year 2024)

--8<-- "includes/aix/storage.md"


--8<-- "includes/aix/network.md"

```sh title="Installed software"
# List installed filesets (software packages)
lslpp -L

# List installed iFixes
emgr -l

# List system errors and events
errpt -a
```
