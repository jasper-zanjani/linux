```sh
task add $TASK

# Confirm
task list
```

```sh
# Specify due date
task add $TASK due:tomorrow

task list due:tomorrow

# Specify a project
task add project:$PROJECT
```

Current tasks are numbered dynamically.

```sh
# Edit task
task 2 edit

# Mark as done
task 2 done

# Delete
task 2 delete
```
