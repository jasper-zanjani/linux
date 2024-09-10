Enter an interactive shell to control a PostgreSQL server.

=== ":material-redhat: RHEL"

    ```sh
    dnf install postgresql
    ```

```sh
psql -d database
```

The interactive shell allows SQL queries to be run as well as **meta-commands** prefixed with a backslash **\\**.

```sql
\dt -- (1)
```

1. Display tables
