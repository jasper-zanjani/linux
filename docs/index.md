# Linux

[**SystemD**](SystemD) is the de facto Linux **init**{: #init } system on modern distributions.

A **process**{: #process } runs in its own **user address space**, a protected space which can't be disturbed by other users

- all processes on a Linux system are child processes of a common parent: the **init** process which is executed by the kernel at boot time (PID 1)
- every Linux process inherits the environment (PATH variable, etc) and other attributes of its parent process

Every process has a parent; a process can **spawn** children in a process that is actually made of two separate system calls.

- Shell-internal commands (**cd**, **echo**, etc. and variable assignments) do not spawn child processes
- Shell scripts are executed by spawning a sub-shell, which becomes the script's parent
- External commands are spawned as children of the parent as described above

Bootloaders like [**GRUB (GRand Unified Bootloader)**](GRUB) turn on power supplies and scan buses and interfaces to locate the kernel image and the root filesystem. 
**LILO (LInux LOader)** is also another bootloader that can be found on older Linux systems.

Microcontrollers may be listening when the system is nominally off; they typically have their own BIOS and kernels and are inaccessible from the main system:

- **Baseboard Management Controller (BMC)** responds to **wake-on-LAN (WOL)**
- **Intel Management Engine (IME)** x64 software suite for remote management of systems; firmware is based on `Minix` and runs on the **Platform Controller Hub** processor, not the main CPU
- **System Management Mode (SMM)** launches UEFI software

Linux kernel is typically named **vmlinux** (or **vmlinuz** when compressed). 
Kernel ring buffer contains messages related to the Linux kernel. 
A ring buffer is a data structure that is always the same size; old messages are discarded as new ones come in, once the buffer is full.
**dmesg** is used to see its contents, and the messages are also stored in **/var/log/dmesg**.

Kernel **modules** can be loaded, listed, or removed from the running kernel.

### Audio

<div class="grid cards" markdown>


-   #### Pipewire

    ---

    **Pipewire** is a media server intended to facilitate audio and video handling in Linux as a replacement for [PulseAudio](#pulseaudio) and JACK.
    It exposes a graph-based processing engine that abstracts audio and video devices.

-   #### PulseAudio

    ---

    **PulseAudio** is a sound server for POSIX OSes and a fixture on many Linux distributions.

    PulseAudio is built around **sources** and **sinks** (i.e. devices) connected to **source outputs** and **sink inputs** (streams)

    - **Source** is an input device that produces samples, usually running a thread with its own event loop, generating sample chunks which are posted to all connected source outputs
    - **Source output** is a recording stream which consumes samples from a source
    - **Sink** is an output device that consumes samples, usually running a thread with its own event loop mixing sample chunks from connect sink inputs
    - **Sink input** is a playback stream, connected to a sink and producing samples for it

</div>

### Finding help

<div class="grid cards" markdown>

-   #### Utilities

    - [**man**](#man) displays manpages
    - **mandb** regenerates the manpage index (run as root)
    - [**manweb**](https://github.com/sebastiancarlos/manpdf) is available to browse online manpages.
    - **whereis** locates the binary, source, and manual pages for a command

-   #### man

    ---

    **man** is an interface to the system reference manuals, usually located at **/usr/share/man**.

    **MANPAGER** and **PAGER** variables are used as the name of the program used to display the manual page.
    By default, less is used.

    ```sh
    # Set bat as the pager for man
    MANPAGER = 'bat -l man --style=plain'; man $COMMAND
    ```

    Man page section numbers are provided before the entry on Linux. (1)
    { .annotate }

    1. 
        1. Executable programs or shell commands
        2. System calls (functions provided by the kernel)
        3. Library calls (functions within program libraries)
        4. Special files (usually found in /dev)
        5. File formats and conventions, e.g. /etc/passwd
        6. Games
        7. Miscellaneous (including macro packages and conventions), e.g. *man(7)*, *groff(7)*, *man-pages(7)*
        8. System administration commands (usually only for root)
        9. Kernel routines [Non standard]


    ```sh title="man"
    --8<-- "includes/Commands/m/man.sh"
    ```

</div>

## Inspection

Various tools are available to provide detailed data on system specifications.

<div class="grid cards" markdown>


-   #### Inspect hardware

    === "lscpu"

        --8<-- "includes/Commands/l/lscpu.md"

    === "lshw"

        --8<-- "includes/Commands/l/lshw.md"

    === "lspci"

        --8<-- "includes/Commands/l/lspci.md"

-   #### Benchmarking

    === "sysbench"

        --8<-- "includes/Commands/s/sysbench.md"

    === "fio"

        --8<-- "includes/Commands/f/fio.md"

-   #### Inspect terminal session
    
    === "stty"

        --8<-- "includes/Commands/s/stty.md"
        
    === "tput"

        --8<-- "includes/Commands/t/tput.md"
    
    === "tty"

        --8<-- "includes/Commands/t/tty.md"


</div>


## Security





## Fonts

Fonts are often found at **/usr/share/fonts** as well as **~/.local/share/fonts**.

```sh
# Rebuild font cache
fc-cache -f 
```


--8<-- "includes/defs.md"

--8<-- "includes/links.md"
