# Taskwarrior

=== ":material-fedora:{ .lg .middle } Fedora"

    ```sh
    dnf install -y task
    ```

=== ":material-arch:{ .lg .middle } Arch"

    ```sh
    pacman -S task
    ```

**Attributes** refer to expressions that affect metadata of the task, such as dates when the task is due or appears:


```sh
# Due date
task modify 1 due:tomorrow

# Recurring task
task add Throw out the trash due:eoww recur:weekly

# Modifying a recurring task will ask if the change is to be made to all pending recurrences of the task
task mod 1 due:eow
```

- **Scheduled date** earliest opportunity to work on a task
- **Wait date** earliest opportunity the task will appear on the task list
- **Until date** date upon which the task is destroyed

Dates can be expressed in a variety of ways:

- **Relative wording**: now, today, yesterday, tomorrow, friday
- **Day number with ordinal**: 23rd, 3wks, 1day, 9hrs
- Various expressions to express start and end of time intervals: sow, eom, soq, eoy, etc
- **Date arithmetic**: due-3d, today+3d



--8<-- "includes/Commands/t/task.md"

Resources:

- [A Dive into Taskwarrior Ecosystem with Tomas Babej](https://www.youtube.com/watch?v=tijnc65soEI)