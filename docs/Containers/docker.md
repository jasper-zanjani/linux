# Docker

--8<-- "includes/cmd/docker/info.md"


<div class="grid cards" markdown>


-   #### Storage

    ---

    Docker has several options for persistent storage:

    - [**Volumes**](https://docs.docker.com/storage/volumes/) are stored in a part of the host filesystem which is managed by Docker (/var/lib/docker/volumes/ on Docker).
    - [**Bind mounts**](https://docs.docker.com/storage/bind-mounts/) map a file or directory on the host machine to a mount point in the container. They have less functionality than volumes.
    - **tmpfs mounts** are stored in-memory only, and are available only on Linux.

    Volumes can be mounted using **--volume** or **--mount**.

    - **--volume** syntax combines all options together in one field.
    - **--mount** is more explicit and verbose, with key-value pairs defined for various keys: type, source, destination (also "dst", "target), readonly, and volume-opt

-   #### Networking

    ---

    On Linux, the Docker daemon creates a bridge named **docker0**, which is assigned an unused private IP range and address.
    Every container is associated with a pair of virtual Ethernet interfaces, of which one is visible to the container and the other is tied to this bridge.

    Container networks can use various drivers, which are associated with specific key-value pairs in daemon.json:

    - **NAT**: containers reside in their own network and the host acts as gateway and set with `{ "fixed-cidr" : "10.0.0.0/24" }`.
    - **Transparent**: containers are assigned IP addresses on the same physical network to which the host belongs (similar to **External** virtual switches in Hyper-V), set with `{ "bridge": "none" }`.

    ```sh
    # Create a user-defined network
    docker network create $DOCKER_NETWORK_NAME
    ```

    When a private network is created using docker using **docker network create**, a bridge interface is created with the name **br-$DOCKER\_NET\_ID** where DOCKER\_NET\_ID is the ID produced by **docker network ls**.
    The virtual ethernet interfaces associated with each container are slaved to this bridge.

</div>


Docker **repositories** are associated with a single image, various versions of which can be specified with a **tag**.


On Windows, **Docker Desktop** is Docker's runtime which has been integrated with WSL 2 since June 2019. 
Previous to that, Docker distributed its own Linux kernel to use on Windows hosts.

On Linux, Docker must be run as root, although a user can be added to the **docker** group to manage Docker as a [non-root user](https://docs.docker.com/engine/install/linux-postinstall/) for convenience.
This is called [**rootless mode**](https://docs.docker.com/engine/security/rootless/), where both the daemon and containers run in a user namespace.


#### Dockerfile

A Docker image consists of read-only **layers**, each of which represents an **instruction** that incrementally the changes the image being built up. 
Dockerfiles can be used to construct new images using `docker build`.
The build process can be optimized by placing multiple commands in the same `RUN` instruction.
Dockerfiles are named simply "Dockerfile" with no extension or variation.

=== "Node on Alpine"

    ```dockerfile
    FROM alpine
    RUN apk update && apk add nodejs
    COPY . /app
    WORKDIR /app
    CMD ["node","index.js"]
    ```

=== "Windows Server Nano"

    ```dockerfile
    FROM microsoft/windowsservercore
    RUN powershell -command install-windowsfeature dhcp -includemanagementtools
    RUN powershell -configurationname microsoft.powershell -command add-dhcpserverv4scope -state active -activatepolicies $true -name scopetest -startrange 10.0.0.100 -endrange 10.0.0.200 -subnetmask 255.255.255.0
    RUN md boot
    COPY ./bootfile.wim c:/boot/
    CMD powershell
    ```

=== "Windows Server Core"

    ```dockerfile
    FROM microsoft/windowsservercore
    MAINTAINER @mike_pfeiffer
    RUN powershell.exe -Command Install-WindowsFeature Web-Server
    COPY ./websrc c:/inetpub/wwwroot
    CMD [ "powershell" ]
    ```



### compose

[Docker Compose](https://docs.docker.com/compose/) is a tool for defining and running multi-container applications.

- Compose files are [YAML](https://docs.docker.com/compose/compose-application-model/)..
- Computing components of an application (i.e. containers) are defined as [**services**](https://docs.docker.com/compose/compose-file/05-services/).
- Services communicate with each other through **networks** and store data into **volumes**, which are also top-level elements.
- Many examples in the wild continue to use the **version** top-level element which is now [obsolete](https://docs.docker.com/compose/compose-file/04-version-and-name/#version-top-level-element-obsolete)

**Environment variables** are set for each service as keys and values under the [**environment** attribute](https://docs.docker.com/compose/environment-variables/set-environment-variables/#use-the-environment-attribute) (see the [Sonarqube example](#examples)).

Compose files offer an [interpolation syntax](https://docs.docker.com/compose/environment-variables/variable-interpolation/) which can interpolate variable values from the container's environment and provide default values.
Although most often used in setting environment variables, in the [echo server example](#examples) it is used to set a default host port.



<div class="grid cards" markdown>

-   #### [Installation](https://docs.oracle.com/en/learn/podman-compose/#install-podman-compose)

    ---

    === "Docker"

        ```sh
        yum-config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
        yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
        ```

        Unlike podman, in order to run containers rootlessly the user has to be added to the [docker group](https://docs.docker.com/engine/install/linux-postinstall/).

        ```sh
        usermod -aG docker $USER
        ```

    === "Docker compose"

        ```sh
        wget https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-x86_64

        mv docker-compose-linux-x86_64 ~/bin/docker-compose

        chmod +x !$
        ```

    === "Podman compose"

        ```sh
        # Enable podman socket
        systemctl enable --now podman.socket

        # Install podman-compose
        dnf install -y podman-compose
        pip3 install podman-compose
        ```

-   #### Examples

    ---

    === "Nginx"

        ```yaml
        services:
          nginx:
            image: nginx
            ports: ["8080:80"]
            volumes: ["~/Documents/mkdocs:/usr/share/nginx/html:Z"]
        ```

        The [**volumes**](https://docs.docker.com/compose/compose-file/05-services/#volumes) attribute can be expanded:

        ```yaml hl_lines="5-8"
        services:
          notes:
            image: nginx
            ports: ["8081:80"]
            volumes: 
            - type: bind
              source: /home/jasper/Documents/mkdocs
              target: /usr/share/nginx/html:Z
        ```



    === "Sonarqube"

        ```yaml
        services:
          sonarqube:
            image: sonarqube
            ports: ['9000:9000']
            environment:
              SONAR_ES_BOOTSTRAP_CHECKS_DISABLE: true
        ```

    === "Echo server"

        ```yaml
        services:
          web:
            image: k8s.gcr.io/echoserver:1.9
            ports: ["${HOST_PORT:-8081}:8080"]
        ```

        ```sh
        # The server will echo any request data
        curl localhost:8081 -d "Hello, World!"
        ```

        [Source](https://docs.oracle.com/en/learn/podman-compose/#confirm-podman-compose-is-working)

    === "Flask application"

        === "compose.yml"

            ```yaml
            services:
              web:
                build: . 
                ports: ["8000:5000"]
              redis:
                image: "redis:alpine"
            ```

        === "Dockerfile"
        
            ```dockerfile
            # syntax=docker/dockerfile:1
            FROM python:3.10-alpine
            WORKDIR /code
            ENV FLASK_APP=app.py
            ENV FLASK_RUN_HOST=0.0.0.0
            RUN apk add --no-cache gcc musl-dev linux-headers
            COPY requirements.txt requirements.txt
            RUN pip install -r requirements.txt
            EXPOSE 5000
            COPY . .
            CMD ["flask", "run", "--debug"]
            ```

        === "app.py"

            ```py title="app.py"
            import time

            import redis
            from flask import Flask

            app = Flask(__name__)
            cache = redis.Redis(host='redis', port=6379)

            def get_hit_count():
                retries = 5
                while True:
                    try:
                        return cache.incr('hits')
                    except redis.exceptions.ConnectionError as exc:
                        if retries == 0:
                            raise exc
                        retries -= 1
                        time.sleep(0.5)

            @app.route('/')
            def hello():
                count = get_hit_count()
                return 'Hello World! I have been seen {} times.\n'.format(count)
            ```

        [Source](https://docs.docker.com/compose/gettingstarted/#step-3-build-and-run-your-app-with-compose)


-   #### Nginx server

    ---

    Provision an Nginx container using TLS authenticating against an internal CA.

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


-   #### Monitoring

    ---

    ```sh
    docker logs $CONTAINER
    ```

    ```sh title=""
    # List containers
    podman-compose ps

    # Check logs
    podman-compose logs
    ```

</div>
