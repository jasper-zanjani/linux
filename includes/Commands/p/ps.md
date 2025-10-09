!!! tip "Syntax"

    There are two different sets of options used in ps which descend from the BSD and POSIX implementations.
    Ironically, the BSD syntax appears to be more commonly used.
    
    ```sh title="BSD syntax"
    ps ax
    ```

    ```sh title="POSIX syntax"
    ps -ef
    ```

```sh
# Display processes in a tree-like display illustrating parent-child relationships
ps -f # --forest

# Display full listing of processes
ps u # -f

# Display user processes
ps xG # -a

# Display SELinux contexts for processes
ps auxZ

# Display kernel threads
ps -ef
```
