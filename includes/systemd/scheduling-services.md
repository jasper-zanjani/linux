Services can be scheduled to start with timers.

```ini title="sshd.timer"
[Unit]
Description=Starts sshd service at beginning of workday, and shuts it down at the end.

[Timer]
Unit=sshd.service
OnCalendar=Mon..Fri *-*-* 09:00:00

[Install]
WantedBy=timers.target
```

Now, when stopping sshd manually the following output is printed.

```
Warning: Stopping sshd.service, but it can still be activated by:
  sshd.timer
```

The service can be scheduled to shutdown within the service file itself using the **RuntimeMaxSec** directive.

```toml title="sshd.service"
RuntimeMaxSec=36000 # i.e. 10 hours
```

This unfortunately will result in the service being reported as [failed](https://unix.stackexchange.com/questions/265704/start-stop-a-systemd-service-at-specific-times).
This failure can be cleared with this command:

```sh
systemctl reset-failed
```

