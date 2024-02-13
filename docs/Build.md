# Building software

#### Toolchain
:   
    Different common build tools must be installed, depending on distro

    - :material-fedora: **Fedora**: vim, make, gcc

## Tasks

#### Binary analysis
:   

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

## Utilities

#### make
:   
    --8<-- "includes/Commands/m/make.md"

#### objdump
:   

    ```sh
    --8<-- "includes/Commands/o/objdump.sh"
    ```

#### readelf
:   

    --8<-- "includes/Commands/r/readelf.md"