!!! example

    <div class="grid cards" markdown>

    ```sh title="hw-getopts.sh"
    --8<-- "includes/bash/tasks/hw-getopts.sh"
    ```

    ```sh title="lipsum.sh"
    --8<-- "includes/bash/tasks/lipsum.sh"
    ```

    </div>

**getopts** (not to be confused with the GNU utility **getopt**) is a bash internal command that provides a more robust solution to command-line processing.

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

**OPTSTRING** is a string defining the available options. Usually a sequence of letters, if a letter is followed by a colon **:** then an argument is required.
If the first character of OPTSTRING is a colon then the error message is silenced.

**OPTIONS** contains the processing result and is used in the case expression to determine program behavior.
If an invalid option is provided, "?" is assigned to OPTIONS.
If an argument is missing to a valid option, ":" is assigned to OPTIONS.

**OPTARG** is a builtin variable referencing the argument to a (valid) option.
If an invalid option is provided, or if a required argument to a valid option is missing, the option itself is assigned to OPTARG.

**OPTIND** is a variable which is set to the value of the next option to be parsed by getopts on the next iteration of the loop.
So on the first iteration OPTIND will be set to 2 if the option takes no argument and 3 if it does, and on every iteration OPTIND is incremented accordingly.

OPTIND can be mostly ignored when using getopts within a script.
However, if getopts is within a function then the OPTIND variable must be declared local.

```sh
local OPTIND
```

Because it is a global variable, OPTIND will [persist](https://eklitzke.org/using-local-optind-with-bash-getopts) when using it within a shell function and cause further executions to start from the wrong OPTIND value.
The solution is to manually unset OPTID after execution, reset it to 1 before the following execution, or to make its scope local.
