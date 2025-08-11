The number of each record is stored in **NR**, which increments by one after each record is processed.
Note that, again, the print statement can be left implied if the whole record is to be displayed.

```perl title="NR variable"
# Remove header, for example of a CSV file
NR>1

# Top line only
NR==1

# Print lines in a range
NR>1 && NR < 4

# Print line numbers in output. Note that there is no $ prefix!
{ print NR, $0 }
```

