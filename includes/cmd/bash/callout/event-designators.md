```sh title="Event designators"
# Last argument from previous command
!$

# First argument from previous command
!^

# nth word (0-indexed) from previous command
!!:$n

# nth word of current command
!#:$n

# Repeat last command, deleting the first instance of $STRING
^$STRING

# Repeat last command, substituting all instances of $STRING with $SUBSTITUTE
^$STRING^SUBSTITUTE^
```

