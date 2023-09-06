[TuneD](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/monitoring_and_managing_system_status_and_performance/getting-started-with-tuned_monitoring-and-managing-system-status-and-performance)
is a service that monitors the system and optimizes its performance under certain workloads.
TuneD provides predefined profiles for power-saving and performance-boosting use cases.

- **throughput-performance** optimizes for throughput
- **virtual-guest** optimizes for performance
- **balanced** balances performance and power consumption
- **powersave** optimizes for power consumption

These can be listed from the command-line:

```sh
tuned-adm list profiles
tuned-adm active
tuned-adm recommend

# Select a profile
tuned-adm profile powersave

# Select a merged profile
tuned-adm profile virtual-guest powersave
```

```ini title="/etc/tuned/tuned-main.conf"
--8<-- "includes/Configs/tuned-main.conf"
```