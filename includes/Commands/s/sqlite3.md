**sqlite3** is an interactive frontend to the SQLite library.

**Meta-commands**, prefixed by **`.`**, can be used to examine database files or perform administrative operations.

```sql
-- Get usage help for a meta-command
.help .open

-- Open file
.open database.db

-- Open in-memory database
.open :memory:

-- List names and files of attached databases.
.databases

-- List names of tables matching a given pattern.
.tables

-- Display the CREATE statements used to create the table
.schema table

-- Show the current values for various settings.
.show

.exit
```

