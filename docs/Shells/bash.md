# bash

**Bash** is known for esoteric syntaxes:

- **`$((...))`** arithmetic expansion
- **`[...]`** alias for **test**
- **`$(...)`** command substitution
- **`${...}`** variable substitution
- **`${STRING/SEARCH/REPLACE}`** string substitution
- **`${VAR:START:SIZE}`** variable slicing
- **`filename{,.new}`** brace expansion makes multiple arguments from a single one

**Event designators** can be used to reference previous commands

- **`!$`** last argument from previous command
- **`!^`** first argument from previous command
- **`!!:n`** nth word from previous command (0-indexed)
- **`!#:n`** nth word of **current** command (0-indexed)
- **`^$STRING`** repeat last command, deleting the first instance of `$STRING`
- **`^$STRING^$SUBSTITUTE^`** repeat last command, substituting all instances of `$STRING` with `$SUBSTITUTE`
- **`^$STRING^$SUBSTITUTE`** repeat last command, substituting only the **first** instance of `$STRING` with `$SUBSTITUTE`

**Escape sequences** are used primarily to define colors for color output at the terminal.
An escape sequence is composed of an **escape character** (i.e. `\e`, `\033`, `\x1B`) followed by **format code** and ending with "m".


**Number literals** can be defined on various number bases by prefixing the literal with **r#** where **r** is the base, 
i.e. **`2#`** (binary), **`32#`** (base-32) etc.
Hexadecimal literals are prefixed with **0x** and octal numbers begin with **0**.

## Tasks


#### Configuration
:   
    The systemwide config for bash is at **/etc/profile**.

    The **shopt** internal command is used to set (**-s**) or unset (**-u**) various shell settings.

    ```sh
    # Disable case sensitivity
    shopt -s nocasematch
    ```

    **set** also can be used to change shell behavior.

    ```sh
    # Enable debugging mode in a script
    set +x
    ```

    ```sh title="Conditionally setting $PATH"
    --8<-- "includes/Tasks/path.sh"
    ```

#### Loops
:   

    The body of all loops is bracketed between **do** and **done**.

    ```sh
    for i in {01..07}
    do 
        cmd
    done

    for i in 1 2 3 4 5
    do 
        cmd
    done

    for ((i=0; i<N; i++))
    do 
        cmd
    done

    # Extracting audio from mp4 files in the current working directory
    for f in *.mp4
    do 
        # Use variable substitution to replace one file extension with another
        ffmpeg -i $f ${f/.mp4/.wav} 
    done
    ```

#### Command-line arguments
:   

    Command-line arguments are available as the positional arguments **$1**, **$2**, etc. with the script itself being **$0**.
    Handling command-line arguments is conventionally done with the **shift** command in a while loop.

    **getopt** and **argp\_parse** reorder the elements of **argv** by default, but this behavior can be suppressed by setting the **`_POSIX_OPTION_ORDER`** environment variable

    Bash syntax supports a variety of methods to handle command-line arguments.

    ```sh title="Validating command-line args"
    # From Sobell p. 548
    if [ $# != 2 ]
    then 
        echo "..."
        exit 1
    fi

    # From https://youtu.be/ksAfmJfdub0
    [ -z "$1" ] && echo "..." && exit 1

    # From https://coderwall.com/p/kq9ghg/yakuake-scripting
    if [ ! -z "$2" ] ; then ...; fi

    # Placed in a while loop, if user responds with anything except "y" 
    # (the read command will read only the first letter) the loop will terminate [Cannon][CLKF]

    read -p "Backup another server? (y/n)" -n 1
    ["$BACKUP_AGAIN"="y"] || break
    ```


#### Tag audio with metadata
:   

    ```sh title="Tag audio with metadata"
    --8<-- "includes/Tasks/tag.sh"
    ```


#### Debugging
:   
    Placing **-x** in the shebang of the script will produce the text of each line of a script being run,
    a feature called debugging mode.
