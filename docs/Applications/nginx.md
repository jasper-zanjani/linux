# Nginx

**Nginx** ("engine-x") is described as an _event-based reverse proxy server_.
This refers to the fact that it has an asynchronous architecture, unlike its competitors Apache and IIS which create a new blocking thread per connection.
Nginx is much newer than Apache which started in 1995, although it has seen widespread adoption since 2008, growing mostly at Apache's expense.
A typical and favored deployment is to place Nginx in the front-end and Apache in the back-end to combine the advantages of both platforms.

Nginx follows the convention of even version numbers being stable and odd numbers being mainline or development.

Depending on installation method and distribution, configurations can exist in various directories.
A config can be explicitly specified at runtime with `--conf-path`/`-c`.

This option also appears in the output of `ps` for the Nginx master process, which is one way of interrogating which config is being used for the current Nginx instance.
Nginx can also be interrogated for its default config with `-t`

Nginx config files contain **directives**: 

- **Simple directives** like `listen *:80;` contain a name, multiple optional parameters, and a closing semicolon. 
Parameters themselves can pass a value after an equal sign, i.e. `backlog=511`.
- **Block** or **context directives** like `events`, `http`, and `server` wrap a group of other directives in a pair of braces and can be nested.
Most simple directives can only be declared in specific contexts.
- There is also an implied **main context** which wraps all the contents of the file, and putting a simple directive into the main context means making it a top-level statemtn.
- Comments can be written using `#`

## Examples

<div class="grid cards" markdown>

-   #### Default

    ---

    A very simple representative config that creates an HTTP server listening on port 80 of every network interface, with no HTTP Host specified, from the specified root path:

    ``` nginx
    events {
    }

    http {
        server {
        }
    }
    ```

    With implicit defaults made explicit, this is equivalent to:

    ```nginx
    user nobody nogroup;
    worker_processes 1;

    events {
        worker_connections 512;
    }

    http {
        server {
            listen *:80;
            server_name "";
            root /usr/share/nginx/html;
        }
    }
    ```

-   #### Default on a container

    ---

    ``` nginx
    user  nginx;
    worker_processes  auto;

    error_log  /var/log/nginx/error.log notice;
    pid        /var/run/nginx.pid;


    events {
        worker_connections  1024;
    }


    http {
        include       /etc/nginx/mime.types;
        default_type  application/octet-stream;

        log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                        '$status $body_bytes_sent "$http_referer" '
                        '"$http_user_agent" "$http_x_forwarded_for"';

        access_log  /var/log/nginx/access.log  main;

        sendfile        on;
        #tcp_nopush     on;

        keepalive_timeout  65;

        #gzip  on;

        include /etc/nginx/conf.d/*.conf;
    }
    ```

</div>

### Reverse proxy

Each Nginx virtual server should be described by a file in the **/etc/nginx/sites-available** directory. 
These are linked to by symlinks placed in **/etc/nginx/sites-enabled**.
[Configuring a reverse proxy](https://docs.nginx.com/nginx/admin-guide/web-server/reverse-proxy/) involves associating routes to proxied servers in these virtual server configs. 

``` nginx
server {
    listen 80;
    location / {
        proxy_pass "http://127.0.0.1:8000";
    }
}
```

The configuration to serve static files placed in the local directory **/path/to/staticfiles** from the URL **/static** is:
``` nginx
location /static/ {
    root /path/to/staticfiles/
}
```

### Load balancer

A load balancer is similar to a reverse proxy, with the following differences.

- Load balancers perform reverse proxy across many backends, rather than a single one
- Load balancers operate at either Layer 7 or Layer 4, whereas a reverse proxy operates only at Level 7
- Load balancers are expected to handle much higher scale.

Load balancers themselves tend to be load balanced by DNS servers, which can serve multiple A records to clients which are supposed to choose one of the IP addresses at random.
Some DNS providers like [AWS Route 53](/Cloud/#route-53) randomize the order of these records per query.

```nginx
http {
    upstream backend {
        server 192.0.2.10;
        server 192.0.2.11;
    }

    server {
        listen 80;

        location / {
        proxy_pass http://backend;
        }
    }
}
```

## Tasks

<div class="grid cards" markdown>

-   #### Installation

    ---

    === ":material-redhat: Red Hat"

        ```sh title="/etc/yum.repos.d/nginx.repo"
        [nginx]
        name=nginx repo
        baseurl=http://nginx.org/packages/centos/7/$basearch/
        gpgcheck=0
        enabled=1
        ```
        ```sh
        dnf install nginx
        ```

    === ":material-ubuntu: Ubuntu"

        Official Ubuntu repositories offer Nginx

        ```sh
        apt install -y nginx
        ```

        ```sh title="/etc/apt/sources.list"
        deb http://nginx.org/packages/ubuntu/ trusty nginx
        deb-src http://nginx.org/packages/ubuntu/ trusty nginx
        ```
        ```sh
        curl -fsSL http://nginx.org/keys/nginx_signing.key
        apt-key add nginx_signing.key
        apt install nginx

        ```

-   #### Serve files from home directory

    ---

    Nginx runs using the **www-data** user, so allowing the daemon to serve from a user's home directory entails granting access to the daemon.
    
    The only way to do this appears to be to add the www-data user to the user's group.
    Other file permissions don't appear to affect this behavior.

    ```sh
    chmod -aG $USER www-data
    ```



</div>

