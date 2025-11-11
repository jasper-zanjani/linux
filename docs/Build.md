# Building software

!!! tip "Utilities"


    === "objdump"


        ```sh
        --8<-- "includes/cmd/objdump/objdump.sh"
        ```

    === "readelf"

        --8<-- "includes/Commands/r/readelf.md"


    === ":material-download: Toolchain installation"


        Different common build tools must be installed, depending on distro

        === ":material-fedora: Fedora"

            ```sh
            dnf install make automake gcc kernel-devel

            dnf group install "C Development Tools and Libraries"
            ```

        === ":material-ubuntu: Ubuntu"

            ```sh
            apt install -y build-essential
            ```

## make

--8<-- "includes/cmd/make/info.md"

## Tasks

#### Binary analysis

The initial ELF ("executable and linkable file") **file header** of a binary starts at the 0 offset and serves as a map to the rest of the file.
The ELF header also marks the ELF type, architecture, and address of the entrypoint.

```sh
readelf -h /bin/ls

# Output from hexdump show that the letters ELF are present in the first 16 bytes.
hexdump -C -n 16 /bin/ls

# The file command also indicates whether a file is statically or dynamically compiled.
file /bin/ls

# A dynamically compiled binary can be inspected to determine what external libraries are used.
ldd /bin/ls
```



ELF **program headers** ("phdrs") are what describe segments within a binary and are necessary for program loading.

**Segments** are understood by the kernel during load time and describe the memory layout of an executable on disk.
Segments are used by the linker to allow execution.

Within each segment, there are **sections** which categorize instructions and data.
Segments are necessary for program execution, but sections are not, and a binary without a section header table will execute without problem.

There are four main sections in executable files: .text, .data, .rodata, and .bss

```sh
# Show which sections are mapped to which segments
readelf -l /bin/ls
```

**Symbols** are symbolic references to data or code such as global variables or functions, i.e. **printf()** function.

[Other packages](https://linux-audit.com/elf-binaries-on-linux-understanding-and-analysis/#software-packages) for inspecting ELF binaries include:

- **Radare2** toolkit
- **pax-utils** (which features **scanelf**)
- **elfutils**
- **elfkickers** (which includes **elfls**)

#### Core dumps

!!! tip "Utilities"

    === "coredumpctl"

        --8<-- "includes/Commands/c/coredumpctl.md"


    === "systemd-coredump"

        - /etc/systemd/coredump.conf

    === "crash"

        The [crash utility](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/9/html/managing_monitoring_and_updating_the_kernel/analyzing-a-core-dump_managing-monitoring-and-updating-the-kernel#running-and-exiting-the-crash-utility_analyzing-a-core-dump) is a power tool for analyzing kdump.

    === "kdump"

        kdump is a service that provides a [crash dumping mechanism](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/9/html/managing_monitoring_and_updating_the_kernel/installing-kdump_managing-monitoring-and-updating-the-kernel#what-is-kdumpinstalling-kdump) and creates a crash dump or a **vmcore** dump file.

A core dump or core file is a an image of the process's memory at the time of termination (see `man 5 core`).
This image can then be used in a debugger to inspect the state of the program when it crashed. 


```sh title="kernel.core_pattern"
# Define a template used to name core files
sysctl -n kernel.core_pattern
```

The kernel parameter **kernel.core\_pattern** determines the naming of core files.
On systems using systemd, core dumps are placed in a location determined by the [systemd-coredump](#systemd-coredump) utility (usually **/var/lib/systemd/coredump**).


```sh
# Maximum core file size
ulimit -c
```
