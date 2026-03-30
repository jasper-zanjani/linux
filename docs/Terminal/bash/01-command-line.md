# Command-line arguments

Processing command-line arguments legibly is one of the main use cases of bash scripts.

This script shows how to incorporate the `$@` argument array as well as the `case` statement.

```sh
--8<-- "includes/bash/tasks/terraform.sh"
```

Typically `shift` is used to process each argument in turn.

```sh title="shift.sh"
--8<-- "includes/bash/tasks/shift.sh"
```

---

## getopts

--8<-- "includes/bash/getopts.md"
