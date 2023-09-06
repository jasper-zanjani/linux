#### journalctl
:   

    ```sh
    # Display logs
    journalctl -r # --reverse
    journalctl -f # --follow
    
    # Examine logs of a user container service.
    journalctl -u container-notes.service # --user

    # Examine all errors logged since last boot
    journalctl -b -p err

    # Follow logs of a particular unit
    journalctl -f -u name.service # --follow

    # Query logs by executable name
    journalctl _COMM=program

    # Query logs by executable file path
    journalctl _EXE=/bin/program 
    ```

    [Clean up](https://www.linuxuprising.com/2019/10/how-to-clean-up-systemd-journal-logs.html) old logs

    ```sh
    # Show current disk usage of all journal files
    journalctl --disk-usage

    # Rotate journal files, immediately archiving and renaming currently active journal files.
    journalctl --rotate

    # Enforce limits on archived journal files.
    journalctl --vacuum-time=1d
    ```

    By default, SystemD logs to memory.
    This can be changed by adjusting **/etc/systemd/journald.conf**. 
    This requires the directory **/var/log/journal** to exist.
    
    ```ini title="Persistent logging"
    [Journal]
    Storage=persistent
    ```

    By default, SystemD will only occupy at most 10% of the total filesystem size and leave 15% free.
    These settings can be adjusted by configuring the **SystemMaxUse** and **SystemKeepFree** settings.