**Service files** are a type of unit file which have replaced earlier init scripts and describe how to manage a service or application on the server.
Active services are placed in **/etc/systemd/system**, whereas inactive service files distributed with installed packages are placed in **/usr/lib/systemd/system**.

Docker container as a service:

```ini
[Unit]
Description=Notes Container (Docker)

[Service]
ExecStart=/usr/bin/docker start notes

[Install]
WantedBy=multi-user.target
```

Unit files may include a number of `Condition...` and `Assert...` settings which can place conditions on the running of unit files. (1)
{: .annotate }

1.  The highlighted line will disable the SSH server if a file exists at the specified path.

    ```ini title="ssh.service on Chrome OS" hl_lines="5"
    --8<-- "includes/systemd/ssh.service-chromeos"
    ```
