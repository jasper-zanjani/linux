**Format specifiers** are expressions that appear in C formatted strings and take the following format:

```
%[flags][width][.precision][length]specifier
```


- **width** indicates the minimum number of characters to be printed (right-aligned for positive numbers and left-aligned for negative numbers)

- **precision** indicates various things for the different data types

    - For "integral" types (d, i, u, o, x, X), precision specifies the minimum number of digits to be printed, but rather than adding whitespace (which is what the width field is for) it will add 0s.

    - For float or double types (f, e, a, A), precision specifies the number of digits to be printed after the decimal point.

    - For string (s), precision specifies the length of the string to be printed.

- **length** does not appear to be used much, but specifies the length of the type in memory and can be **h** (short int and unsigned short int), **l** (long int and unsigned long int), or **L** (long double)


- **specifier** indicates the data type:

    - **c** character
    - **f** float
    - **d** digit
    - **s** string
