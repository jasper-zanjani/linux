Taskwarrior (1)
{: .annotate }

1.  

    --8<-- "includes/taskwarrior/callout.md"

```sh
--8<-- "includes/cmd/task/task.sh"
```

Attributes refer to expressions that affect metadata of the task, such as dates when the task is due or appears:

- Scheduled date: earliest opportunity to work on a task
- Wait date: earliest opportunity the task will appear on the task list
- Until date: date upon which the task is destroyed

Dates can be expressed in a variety of ways:

- Relative wording: `now`, `today`, `yesterday`, `tomorrow`, `friday`
- Day number with ordinal: `23rd`, `3wks`, `1day`, `9hrs`
- Various expressions to express start and end of time intervals: `sow`, `eom`, `soq`, `eoy`, etc
- Date arithmetic: `due-3d`, `today+3d`

