Timer files are systemd [unit files](#unit-files) with names ending in .timer that control [service files](#service-files).
For each timer file, a matching unit file must exist describing the unit to activate when the timer elapses.
By default, systemd will search for a service file with a filename matching that of the timer, but failing that a specific unit can be specified with the **Unit** key within the timer file itself.

```sh title="Display timers"
systemctl list-timers
systemctl status *timer
```

Like other unit files, timer files may include Unit and Install sections, but must include the **Timer** section.

Specifying time is done using **timestamps** which can be **monotonic** or **realtime**.

- Monotonic timers are defined relative to various system hooks using the following directives: OnActiveSec, OnBootSec, OnStartupSec, OnUnitActiveSec, and OnUnitInactiveSec.
- Realtime timers define timers according to **calendar event expressions**, denoting real-world dates and times as humans understand them. 


Validate timestamps:
```sh
systemd-analyze calendar '*-*-* 00:00:00' --iterations
```    

**systemd-run** can be used for one-off events as a substitute for anacron.
```sh
systemd-run --on-active=-30sec /bin/touch /home/user/file
```
This command creates a **transient** unit file, whose name is provided in the output.
```sh
systemctl cat run-u97.service
```

