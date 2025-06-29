# SystemD

**SystemD** (1) is the de facto Linux init system since replacing Sysvinit (2) and Upstart (3) in all major distributions. 
SystemD organizes resources into unit files, which can be managed by daemons and manipulated by SystemD utilities.
{: .annotate }

1.  **Links**

    -   [Website](https://systemd.io)

2.  

    --8<-- "includes/systemd/sysvinit.md"

3.  

    --8<-- "includes/systemd/upstart.md"

It was designed by a pair of Red Hat developers in 2010 to be a general purpose system manager.
It offers parallel execution, explicit dependencies between services, an escape from slow shell scripts, and per-daemon resource control and watchdogs.

## Tasks

#### Scheduling services

--8<-- "includes/systemd/scheduling-services.md"

#### Masking

--8<-- "includes/systemd/masked-services.md"


## Glossary

#### Service files

--8<-- "includes/systemd/service-file.md"

#### Slice

--8<-- "includes/systemd/slice.md"

#### Target files

--8<-- "includes/systemd/target-file.md"

#### Timers

--8<-- "includes/systemd/timers.md"

#### Unit files

--8<-- "includes/systemd/unit-files.md"


## Commands

#### hostnamectl
:   

    ```sh
    --8<-- "includes/Commands/h/hostnamectl.sh"
    ```

#### journalctl
:   
    --8<-- "includes/Commands/j/journalctl.md"

#### localectl
:   

    ```sh
    --8<-- "includes/Commands/l/localectl.sh"
    ```

#### loginctl
:   

    ```sh
    --8<-- "includes/Commands/l/loginctl.sh"
    ```

#### systemctl
:   

    ```sh
    --8<-- "includes/Commands/s/systemctl.sh"
    ```

#### systemd-analyze
:   

    ```sh
    --8<-- "includes/Commands/s/systemd-analyze.sh"
    ```

#### systemd-cgls

--8<-- "includes/Commands/s/systemd-cgls.md"

#### systemd-delta

--8<-- "includes/Commands/s/systemd-delta.md"
