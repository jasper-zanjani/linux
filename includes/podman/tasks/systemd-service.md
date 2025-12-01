```sh
podman generate systemd $CONTAINER_ID --restart-policy=always --name --files --new                  
```

Output a [systemd service file](https://docs.podman.io/en/latest/markdown/podman-generate-systemd.1.html) from a container to STDOUT (this must be redirected to a file)

-   `--new` yield unit files that do not expect containers and pods to exist but rather create them based on their configuration files.
-   `--files` generate a file with a name beginning with the prefix (which can be set with **--container-prefix** or **--pod-prefix**) and followed by the ID or name (if **--name** is also specified)
-   `--name` in conjunction with `--files`, name the service file after the container and not the ID number.

