# fish

```sh
--8<-- "includes/Commands/fish.fish"
```

**Fish** [switch statements](https://fishshell.com/docs/current/cmds/case.html) look completely different from bash case statements, with an incompatible syntax.

```sh title="Conditionally setting $PATH:"
switch "$PATH" # (1)
    case "*$HOME/.cargo/bin*" # (2)
        echo '$PATH already contains $HOME/.cargo/bin' # (3)
    case '*'
        set --global PATH $HOME/.cargo/bin $PATH # (4)
end # (5)
```

1. Because the $PATH is rendered as a list delimited by whitespace, without quotes this statement will be expanded to many arguments and will produce an error.
2. Double quotes must be used, because with single quotes fish will not expand the $HOME variable.
3. I have not found an empty placeholder similar to **pass** in Python which could simply occupy space here. 
Without a statement, fish appears to execute the following block by default.
4. Environment variables use the [**set**](https://fishshell.com/docs/current/cmds/set.html#cmd-set) keyword.
The **--universal** option, which would otherwise make sense here, does not work because $PATH is a global variable.
Note that there is no equal sign, only a space separating the variable identifier and value.
5. 
```sh title="Bash equivalent"
case ":${PATH}:" in
    *:"$HOME/.cargo/bin":*)
        ;;
    *)
        export PATH="$HOME/.cargo/bin:$PATH"
        ;;
esac
```

#### Variables

The [**set** keyword](https://fishshell.com/docs/current/cmds/set.html) is used to declare and destroy variables.

```sh
# Set environment variables 
# Equivalent to export EDITOR=/usr/bin/vim in bash
set -x EDITOR /usr/bin/vim # (1)
#   --export

# Unset variable
set -e EDITOR 
#   --erase
```

#### Command-line arguments
:   
    There are two ways of handling command-line arguments and options in fish:

    1. [**argparse**](https://fishshell.com/docs/current/cmds/argparse.html)
    2. [**fish\_opt**](https://fishshell.com/docs/current/cmds/fish_opt.html)

    ```sh title="argparse usage"
    argparse $OPTION_SPEC -- $argv
    ``` 

    In argparse, functions call the **argparse** keyword providing an **option specification**, strings that define options as well as the options to be parsed (i.e. **$argv**).
    These are separated by the double hyphen **--**.

    A trivial use case is presented here, where argparse does almost nothing except pass all arguments to the echo statement.
    However, providing any options produces an error, since they are detected by argparse as unknown.

    ```sh title="Hello, World! with argparse"
    function hw
        argparse -- $argv
        or return
        echo "Hello, $argv!"
    end
    ```

    The option specification itself follows a specific syntax following the pattern `<SHORT_FORM>/<LONG_FORM>`, where the short form and long form of an option are delimited by a slash.
    In this example, the option spec is appended by **=** to require an argument.
    The value of the argument is stored in a variable named **`_flag_<SHORT_FORM>`** or **`_flag_<LONG_FORM>`** after the option spec.

    ```sh
    function hw
        argparse 'n/name=' -- $argv
        or return
        echo "Hello, $_flag_n!" # Alternatively $_flag_name could also be used
    end
    ```

    Multiple option specs can be provided in this line.

    Additional options to argparse itself are also available, for example **--min-args/-N** which specifies a minimum number of total arguments.


    ```sh
    # This will raise an error if less than one argument is present.
    function hw
        argparse --min-args=1 -- $argv
        #        -N=1
        echo "Hello, $argv!"
    end
    ```