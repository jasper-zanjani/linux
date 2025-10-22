**References**

-   [A Dive into Taskwarrior Ecosystem with Tomas Babej](https://www.youtube.com/watch?v=tijnc65soEI)

---

**Installation**

=== ":material-fedora: Fedora"

    ```sh
    dnf install -y task
    ```

=== ":material-arch: Arch"

    ```sh
    pacman -S task
    ```

---

**Commands**

--8<-- "includes/cmd/task/info.md"

--- 

**Configuration**

-   **$HOME/.taskrc**

By default, taskwarrior outputs with a background set for alternating rows.
This can be disabled as follows:

```sh title=".taskrc"
color.alternate=none
```
