The number of fields is stored in the **NF** variable, which is updated with each record as it is processed.

```perl title="NF variable"
# Remove all whitespace-only lines: while interpreted as a pattern, when NF is 0 it will suppress output.
NF

{ print $0, NF }
```
