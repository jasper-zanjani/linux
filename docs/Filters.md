# Filters

Many terminal commands exist in the Linux ecosystem that are meant for manipulating and displaying text information. 
Often these commands are combined by piping from one to the other.




## Tasks

#### Random sampling
:   
    A variety of filters can be used to [sample random lines](https://www.baeldung.com/linux/read-random-line-from-file) from a text file.

    ```sh
    shuf -n 1 $FILE
    ```

    In the **fish** shell, the command **random** allows sampling from a list of items provided in-line.

    ```sh
    random choice apple orange banana kiwi
    ```

#### employees
:   
    ``` title="employees"
    --8<-- "includes/Output/employees/00"
    ```

    ```sh title="Display single column"
    # awk gracefully interprets space as the delimiter by default
    awk '{print $1}' employees # (1)
    
    # Define space as delimiter and first field with cut
    cut -f1 -d' ' employees
    ```

    1. 
    ``` title="Output"
    --8<-- "includes/Output/employees/01"
    ```

    ```sh title="Concatenate multiple columns"
    awk '{print $1, $2}' employees # (1)
    ```

    1. 
    ``` title="Output"
    --8<-- "includes/Output/employees/03"
    ```



#### free
:   

    ``` title="free -h"
    --8<-- "includes/Output/free/00"
    ```

    **free** displays a table of output that works well with awk's ability to detect fields.

    ```sh
    # Pipe output of free to display free memory and total memory
    # Actually this example is broken because the column headers are mixed up...
    free -h | 
        awk '/^Mem|/ {print $3 "/" $2}' # (1)

    # Display only the free memory output
    free -h | 
        tr -s ' ' | cut -d ' ' -f 2
    ```

    1. 
    ```
    --8<-- "includes/Output/free/01"
    ```

#### sensors
:   

    ``` title="sensors"
    --8<-- "includes/Output/sensors/00"
    ```

    ```sh
    # Get CPU temperature
    sensors | 
        awk '/^temp1/ {print $2}' # (1)
    ```

    1. 
    ```
    --8<-- "includes/Output/sensors/01"
    ```

#### shuf
:   
    ```sh
    --8<-- "includes/Commands/s/shuf.sh"
    ```

#### stat
:   

    ``` title="stat"
    --8<-- "includes/Output/stat/00"
    ```

    ```sh hl_lines="3 7"
    # Get the date of last access, limiting output to the first space-delimited field using awk
    stat -c '%x' $FILE | 
        awk '{print $1}'

    # Get the date of last access, limiting output to the first space-delimited field using tr and cut
    stat -c '%x' $FILE | 
        tr -s ' ' | cut -d ' ' -f 1
    ```

#### Ansible hosts
:   

    ``` title="ansible --list-hosts"
    --8<-- "includes/Output/ansible-list-hosts/00"
    ```

    ```sh
    # Using sed line addressing, the first line is omitted
    ansible --list-hosts -i st/hosts rhel8 | 
        sed '2,$p' # (1)

    # The same can be done for awk, which automatically trims whitespace
    ansible --list-hosts -i st/hosts rhel8 | 
        awk 'NR>1 { print $1 }' # (2)

    # Defining a field delimiter, display only the first element of the hostname. 
    # Note that leading whitespace is preserved now.
    ansible --list-hosts -i st/hosts rhel8 | 
        awk 'NR>1 { print $1 }' # (3)

    # Remove leading whitespace with the sub() command
    ansible --list-hosts -i st/hosts rhel8 | 
        awk 'NR>1 { sub(/^[ \t]+/, ""); print $1 }' # (4)
    ```

    1. 
    ```
    --8<-- "includes/Output/ansible-list-hosts/01"
    ```
    2. 
    ```
    --8<-- "includes/Output/ansible-list-hosts/02"
    ```
    3. 
    ```
    --8<-- "includes/Output/ansible-list-hosts/03"
    ```
    4. 
    ```
    --8<-- "includes/Output/ansible-list-hosts/04"
    ```

## Commands


#### awk
:   
    --8<-- "includes/Commands/a/awk.md"

#### cut
:   

    ```sh
    --8<-- "includes/Commands/c/cut.sh"
    ```

#### fzf
:   
    ```sh
    --8<-- "includes/Commands/f/fzf.sh"
    ```

#### grep
:   
    --8<-- "includes/Commands/g/grep.md"

#### head
:   
    ```sh
    --8<-- "includes/Commands/h/head.sh"
    ```

#### paste
:   
    ```sh
    --8<-- "includes/Commands/p/paste.sh"
    ```

#### sed
:   
    --8<-- "includes/Commands/s/sed.md"

#### sort
:   

    ```sh
    --8<-- "includes/Commands/s/sort.sh"
    ```

#### tail
:   
    ```sh
    --8<-- "includes/Commands/t/tail.sh"
    ```

#### tr
:   
    ```sh
    --8<-- "includes/Commands/t/tr.sh"
    ```

#### watch
:   
    ```sh
    --8<-- "includes/Commands/w/watch.sh"
    ```
