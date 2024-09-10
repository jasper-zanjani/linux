```sh
--8<-- "includes/Commands/c/curl.sh"
```

The **--cacert** option specifies certificates to verify the peer, which must be in PEM format.

```sh
--8<-- "includes/Commands/c/curl-certs.sh"
```

```sh title="Using curl to make API calls"
--8<-- "includes/Commands/c/curl-api.sh"
```

Use curl to verify sockets are open.
Here the **-w**/**--write-out** is used to display a newline to confirm that the podman socket is open.

```sh
sudo curl -w "\n" -H "Content-Type: application/json" --unix-socket /var/run/docker.sock http://localhost/_ping
```