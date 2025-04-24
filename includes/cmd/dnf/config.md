Global dnf configuration is stored in either **/etc/yum.conf** or **/etc/dnf.conf**.

```ini
[main]
; Exclude packages from updates permanently
exclude=kernel* php*

; Suppress confirmation
assumeyes=True
```

```sh
# Display configuration (run as root)
dnf config-manager --dump
```

