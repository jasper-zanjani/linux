!!! tip "docker"

    === ":material-star: Common"

        ```sh
        --8<-- "includes/cmd/docker/docker-common.sh"
        ```

    === "attach"

        ```sh
        --8<-- "includes/cmd/docker/docker-attach.sh"
        ```

    === "build"

        ```sh
        # Build a Docker image from a Dockerfile in the present working directory
        docker build -t web .
        ```

    === "commit"

        ```sh
        # Save changes made to a modified container to a new image
        docker commit $CONTID $USER/$CONT
        ```

    === "network"

        ```sh
        --8<-- "includes/cmd/docker/docker-network.sh"
        ```

    === "run"

        ```sh title="docker run"
        --8<-- "includes/cmd/docker/docker-run.sh"
        ```

        ```sh title="docker run -it"
        --8<-- "includes/cmd/docker/docker-run-it.sh"
        ```

        To detach from a running container use the keyboard shortcuts ++ctrl++++p+ctrl++++q++

    === "tag"

        ```sh
        --8<-- "includes/cmd/docker/docker-tag.sh"
        ```

    === "volume"

        ```sh
        --8<-- "includes/cmd/docker/docker-volume.sh"
        ```



