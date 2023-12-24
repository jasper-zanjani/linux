# fish


## Control flow

#### if
:   
    Like all other control flow blocks in fish, **if** statements are concluded by **end**.

    ```sh
    if return
        echo True!
    end

    if return 1
        echo True!
    else
        echo False!
    end
    ```

#### switch
:   
    [**Switch statements**](https://fishshell.com/docs/current/cmds/case.html) in fish look completely different from case statements in bash.

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

#### for-in
:   
    Like other blocks in fish, [**for-in loops**](https://fishshell.com/docs/current/cmds/for.html) are concluded with **end**.
    Unlike bash, the iterator is not surrounded by parentheses, however globbing can be used to handle filenames.

    ```sh title="Set metadata in a loop"
    for i in Godfrey*
        echo Processing $i
        set title $(string replace -r "\(.*mp3$" "" $i) # (1)
        ffmpeg -i $i -metadata title="$title" -metadata album="Godfrey" -metadata artist="Vlad TV" -codec copy output/$i
    end
    ```

    1. [**string replace**](https://fishshell.com/docs/current/cmds/string.html?highlight=string#replace-subcommand) is used here to remove the ending of a filename, including extension.



## Variables
:   
    Similar to bash, variables are derefenced by prefixing **$** to the identifier, but that syntax is not used when assigning values.
    Unlike bash, the [**set** keyword](https://fishshell.com/docs/current/cmds/set.html) is used to declare and destroy variables.

    ```sh title="Environment variables"
    set --export EDITOR /usr/bin/vim # (1)
    #   -x

    # Unset variable
    set --erase EDITOR 
    #   -e
    ```

    1. Without **-x** this variable will not be visible to applications.
    ```sh title="Bash equivalent"
    export EDITOR=/usr/bin/vim
    ```


#### String manipulation
:   
    Strings are manipulated by subcommands to **string**.
    There is no support for traditional bash string manipulation.

    ```sh
    # Replace a substring using string replace
    set FILE "file.m4a"
    string replace m4a wav $FILE # (1)
    ```

    1. 
    ``` title="Output"
    file.wav
    ```

## Functions

```sh
--8<-- "includes/Commands/fish.fish"
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