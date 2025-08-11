How records and fields are delimited is determined by predefined variables as well.
**FS**, the **input field separator**, can be set from the command-line using **-F**, allowing the delimiter to be specified on Linux-like systems to be conveniently processed, similar to use of the [**cut**](#cut) utility. (1)
{ .annotate }

1. Note that processing tabular data with variable whitespace between each field, may yet be done more gracefully with awk, since cut does not handle variable spacing well.
```sh
cut -d: -f1 /etc/passwd
```

```sh title="-F option"
# Process a colon-delimited file
awk -F: '{ print }' /etc/passwd

# Process a CSV
awk -F, '{ print }' starships.csv

# Use a regex to specify more than one field separator at a time
awk -F'[ :\t]' '/Tom Jones/ { print $1, $2, $3}' employees2 # (1)
```

1. 
``` title="employees2"
--8<-- "includes/Output/employees2/00"
```
``` title="Output"
--8<-- "includes/Output/employees2/01"
```

