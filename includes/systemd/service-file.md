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

