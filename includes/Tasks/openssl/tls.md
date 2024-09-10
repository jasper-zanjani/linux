=== "compose.yml"

    ```yaml
    --8<-- "includes/Configs/docker-compose/nginx-tls.yml"
    ```

=== "conf.d/web.conf"

    ``` json
    --8<-- "includes/Configs/nginx/nginx-tls.conf"
    ```

=== "html/index.html"

    ```html
    <html>
      <head><title>LAN TLS Test</title></head>
      <body><h1>LAN TLS Test</h1></body>
    </html>
    ```

A complete certchain should also be available in the **certs** directory.

```sh
podman-compose up -d
```

From the command-line, the CA can be provided inline to the command or it can be added to the system's trusted certificate store. (1)
{ .annotate }

1. 
```sh
--8<-- "includes/Commands/c/curl-tls.sh"
```

[Source](https://carpie.net/articles/tls-certificates-for-local-area-networks)