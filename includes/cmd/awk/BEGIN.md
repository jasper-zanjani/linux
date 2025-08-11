The **BEGIN** block defines instructions that are executed before any records are processed.
Variables like FS, OFS, etc. can be set within a BEGIN block.

```perl title="BEGIN block"
# Insert header to output
BEGIN { print "Name:Number:DOB:Salary" } { print } # (1)

# Interpret colon as record separator
BEGIN { RS=":" } { print }
```

1. 
``` title="employees2"
--8<-- "includes/Output/employees2/00"
```
``` title="Output"
--8<-- "includes/Output/employees2/03"
```

Variables can also be defined after - but not before - the instruction sent to the awk invocation.

```sh title="OFS variable"
# Specify FS as well as a pattern (2)
awk 'BEGIN { FS=":" } /Mary/ { print $1 }' employees2
awk '/Mary/ { print $1 }' FS=: employees2

# Convert a tabular file to a colon-delimited file (1)
awk 'BEGIN { OFS=":" } { print $1, $2, $3, $4, $5, $6, $7 }' datafile
awk '{ print $1, $2, $3, $4, $5, $6, $7 }' OFS=: datafile
```

1. 
``` title="datafile"
--8<-- "includes/Output/datafile/00"
```
``` title="Output"
--8<-- "includes/Output/datafile/06"
```
2. 
``` title="employees2"
--8<-- "includes/Output/employees2/00"
```
``` title="Output"
--8<-- "includes/Output/employees2/02"
```

