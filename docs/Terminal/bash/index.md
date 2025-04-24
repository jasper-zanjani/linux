# Overview

!!! info "Reference"

    --8<-- "includes/Commands/b/bash.md"

## Tasks


#### Escape sequences

**Escape sequences** are used primarily to define colors for color output at the terminal.
An escape sequence is composed of an **escape character** (i.e. `\e`, `\033`, `\x1B`) followed by **format code** and ending with "m".

Unicode codepoints can be produced using the `\U` prefix.

```sh
echo -e \U2591
```

#### String handling

```sh title="String slicing"
# Slice a substring $LENGTH characters long starting from position $INDEX from $STRING
${STRING:$INDEX:$LENGTH}
```

To [**convert case**](https://medium.com/mkdir-awesome/case-transformation-in-bash-and-posix-with-examples-acdc1e0d0bc4):

- **^** capitalize first letter
- **^^** capitalize all letters
- **,** lowercase first letter
- **,,** lowercase all letters
- **~** toggle first letter
- **~~** toggle all letters

#### Arithmetic

Mathematical expressions between **$((** and **))** are evaluated by bash.

```sh
test $(( 2+2 )) -eq 4 # => 0 (true)
```

Hexadecimal literals are prefixed with **0x** and octal numbers begin with **0**.
**Number literals** can be defined on various number bases by prefixing the literal with **r#** where **r** is the base, 
i.e. **`2#`** (binary), **`32#`** (base-32) etc.

```sh
# 2 + 2 = 4
test $(( 2#10 + 2#10 )) -eq 2#100

# 4 + 4 = 8
test $(( 4+4 )) -eq 010
```

#### Heredocs

**Here documents** (**heredocs**) or **here strings** refer to a method of passing multiline strings to commands in bash.

```sh
# Type out a block of text that is then saved to a file
cat << EOF > hello.sh
Hello, World!**xone**
EOF
```

```sh
# <<- ignores leading tabs, allowing the string to be indented in scripts
cat <<- EOF > hello.sh
    Hello, World!
    EOF
```

#### Interactive text input

The **read** command is used to capture user input at the terminal.
It often appears with **-p**, which is used to provide a prompt.

```sh
read -p "Enter name: "
echo "Hello, ${REPLY:-World}!"
```

If no variable **name** is provided at the end of the command, the input is stored in **$REPLY**.

```sh
read -p "Backup another server? (y/n)" -n 1 CONFIRMATION
["$CONFIRMATION"="y"] || break
```

Multiple items can be stored by using **-a** to declare an [array](#array) variable.

```sh
read -p "List of users to delete, separated by ',': " -a USERS
for user in ${USERS[*]}; do
    echo $user
done
```

Input will cease when the **delimiter** is encountered (newline by default), but a different delimiter can be defined with **-d**.


### Command-line parsing

Command-line arguments are available as the positional arguments **$1**, **$2**, etc. with the script itself being **$0**.
Handling command-line arguments is conventionally done with the **shift** command in a while loop.

The special variables **$\*** and **$@** represent all arguments, as a single string and as an array respectively.

#### Flow control

Bash syntax supports a variety of methods to handle simple command-line arguments, such as exiting if no arguments were provided.

```sh
if [ $# != 2 ]; then 
    echo "..."
fi # (1)

if [ ! -z "$2" ]; then 
    echo "..."
fi # (3)

[ -z "$1" ] && echo "..." # (2)
```

1. From Sobell p. 548
2. [Source](https://youtu.be/ksAfmJfdub0) 
3. [Source](https://coderwall.com/p/kq9ghg/yakuake-scripting) 

#### getopts

```sh title="Representative usage"
OPTSTRING=":ab:"
while getopts ${OPTSTRING} OPTIONS; do
    case ${OPTIONS} in
        a) echo "Option -a triggered" ;;
        b) echo "Option -b triggered: ${OPTARG}" ;;
        :) echo "Option -${OPTARG} requires an argument" ;;
        ?) echo "Invalid option: -${OPTARG}." ;;
    esac
done

shift $((OPTIND - 1))
```

- **OPTSTRING** is a string defining the available options.
Usually a sequence of letters, if a letter is followed by a colon **:** then an argument is required.
If the first character of OPTSTRING is a colon then the error message is silenced.

- **OPTIONS** contains the processing result and is used in the case expression to determine program behavior.
If an invalid option is provided, "?" is assigned to OPTIONS.
If an argument is missing to a valid option, ":" is assigned to OPTIONS.

- **OPTARG** is a builtin variable referencing the argument to a (valid) option.
If an invalid option is provided, or if a required argument to a valid option is missing, the option itself is assigned to OPTARG.

- The enclosing **while loop** iterates over each option provided in the command-line until they are exhausted.



??? info "OPTIND"

    **OPTIND** is a variable which is set to the value of the next option to be parsed by getopts on the next iteration of the loop.
    So on the first iteration OPTIND will be set to 2 if the option takes no argument and 3 if it does, and on every iteration OPTIND is incremented accordingly.

    OPTIND can be mostly ignored when using getopts within a script.
    However, if getopts is within a function then the OPTIND variable must be declared local.

    ```sh
    local OPTIND
    ```

    Because it is a global variable, OPTIND will [persist](https://eklitzke.org/using-local-optind-with-bash-getopts) when using it within a shell function and cause further executions to start from the wrong OPTIND value.
    The solution is to manually unset OPTID after execution, reset it to 1 before the following execution, or to make its scope local.


??? info "Resources"


#### getopt

Unlike [getopts](#getopts), **getopt** is a GNU utility.


and **argp\_parse** reorder the elements of **argv** by default, but this behavior can be suppressed by setting the **`_POSIX_OPTION_ORDER`** environment variable


