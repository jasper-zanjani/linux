The default **output field separator** is a single space, but it can also be specified by setting a value to the **OFS** predefined variable within the instruction.
It is the value of OFS which is interpolated between *print* arguments when delimited with a comma.

```perl title="OFS variable"
# Compare output
{ print $3, $2 } # (1)
{ print $3 $2 } # (2)
```

1. 
``` title="datafile"
--8<-- "includes/Output/datafile/00"
```
``` title="Output"
--8<-- "includes/Output/datafile/04"
```
2. 
``` title="datafile"
--8<-- "includes/Output/datafile/00"
```
``` title="Output"
--8<-- "includes/Output/datafile/05"
```

