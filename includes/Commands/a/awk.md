Awk invocations are composed of **programs** or **instructions**, defined inline enclosed in quotes or in a **program file** (specified with **-f**), and the name of the input file.
If no input files are specified awk can accept input from standard input.

Awk instructions combine **patterns** and **actions**:

- Patterns can be:

    - regular expressions or fixed strings
    - line numbers using the builtin variable **NR**
    - predefined patterns **BEGIN** or **END**, whose actions are executed before and after processing any lines of the data file, respectively

- Actions include the ubiquitous **print** but can also be variable assignments like **stop=1**

awk supports a great range of regex expressions which are accepted as patterns, and the entirety of any matched line is displayed.

```perl title="Example patterns"
# Regex patterns
/Mary/  # (1)

/west/  # (2)

/^north/ # (3)

/^(no|so)/ # (4)
```

1. 
``` title="employees"
--8<-- "includes/Output/employees/00"
```
``` title="Output"
--8<-- "includes/Output/employees/01"
```
2. 
``` title="datafile"
--8<-- "includes/Output/datafile/00"
```
``` title="Output"
--8<-- "includes/Output/datafile/01"
```
3. 
``` title="datafile"
--8<-- "includes/Output/datafile/00"
```
``` title="Output"
--8<-- "includes/Output/datafile/02"
```
4. 
``` title="datafile"
--8<-- "includes/Output/datafile/00"
```
``` title="Output"
--8<-- "includes/Output/datafile/03"
```
5. 
``` title="employees"
--8<-- "includes/Output/employees/00"
```
``` title="Output"
--8<-- "includes/Output/employees/05"
```

In fact, the **print** action, which is implied when using regex patterns, must be specified when displaying the entire contents of the file.

```perl title="print action"
# Print entire file
{ print }
```

Awk views its input data as a series of **records** composed of **fields**.
By default, newline delimits records and other whitespace delimits fields.
This makes awk naturally suited to tabular text files, where columns are accessed using **field specifiers**, variables prefixed by **$** and numbered from 1 to 100.
The entire record is referenced to by **$0**.
Field specifiers can be used as arguments to print, and using them alongside string literals allows output to be defined to the programmer's taste.

```perl title="Field specifiers"
# Print entire matching line
{ print $0 }

# Print first column
{ print $1 }    # (1)

# Capitalize last name
{ print $1, toupper($2) } # (2)

# Interpolate two columns of output piped from a command
{ print "Month: ", $2, "\nYear: ", $7 } # (3)

# Patterns precede the action block
/Sally/ { print "\t\tHave a nice day, " $1, $2 "!" } # (4)
```

1. 
``` title="employees"
--8<-- "includes/Output/employees/00"
```
``` title="Output"
--8<-- "includes/Output/employees/02"
```
2. 
``` title="employees"
--8<-- "includes/Output/employees/00"
```
``` title="Output"
--8<-- "includes/Output/employees/03"
```
3. 
``` title="date"
--8<-- "includes/Output/date/00"
```
``` title="Output"
--8<-- "includes/Output/date/01"
```
4. 
``` title="employees"
--8<-- "includes/Output/employees/00"
```
``` title="Output"
--8<-- "includes/Output/employees/04"
```




##### Predefined variables

A variety of **predefined variables** exist in awk.
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

Less usefully, the number of fields is stored in the **NF** variable, which is updated with each record as it is processed.

```perl title="NF variable"
# Remove all whitespace-only lines: while interpreted as a pattern, when NF is 0 it will suppress output.
NF

{ print $0, NF }
```

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

Similarly, awk offers input and output **record separators**

```perl title="RS variable"
# Remove all blank lines
1 RS=''
```

##### BEGIN


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

##### Calculations

```perl
# Patterns can also incorporate comparison expressions
$3 < 4000 # (5)
```

```perl
# Print the sum of all items in the second column
BEGIN { FS="," } { SUM+=$2 } END { print SUM } # (1)

# Count the number of nonempty lines
/./ { COUNT+=1 } END { print COUNT }

NF { COUNT+=1 } END { print COUNT }

+$1 { COUNT+=1 } END { print COUNT }
```

1. 
``` title="buildings"
--8<-- "includes/Output/buildings/00"
```
``` title="Output"
--8<-- "includes/Output/buildings/01"
```



```perl
# Print the first field of all files in the current directory, taking ; as the field separator, outputting filename, line number, and first field of matches, with colon : between the filename and line number
BEGIN {FS=";"} /enable/ {print FILENAME ":" FNR,$1}

# Search for string MA in all files, outputting filename, line, and line number for matches
/MA/ {OFS=" " print FILENAME OFS FNR OFS $0}

# replace initial "fake." with "real;" in file `fake_isbn`
sub(^fake.,"real;")

# Arrays
FS="," +$1 { CREDITS[$3]+=$1 } END { for (NAME in CREDITS) print NAME, CREDITS[NAME] }

# Remove multiple spaces
$1=$1


FS="," +$1 { SUM+=$1; NUM+=1 } END { printf("AVG=%f",SUM/NUM); }

FS="," +$1 { SUM+=$1; NUM+=1 } END { printf("AVG=%6.1f",SUM/NUM); }

# Change part of a string
FS="," OFS="," { $3 = toupper(substr($3,1,1)) substr($3,2) } $3

# Split the second field ("EXPDATE") by spaces, storing the result into the array DATE; then print credits ($1) and username ($3) as well as the month (DATE[2]) and year (DATE[3]) 

FS="," OFS="," +$1 { split($2, DATE, " "); print $1,$3, DATE[2], DATE[3] }
FS="," +$1 { split($4, GRP, ":"); print $3, GRP[1], GRP[2] }
FS="," +$1 { split($4, GRP, /:+/); print $3, GRP[1], GRP[2] }

# Search and replace with comma 
FS="," +$1 { gsub(/ +/, "-", $2); print }

# Adding date 
BEGIN { printf("UPDATED: "); system("date") } /^UPDATED:/ { next } 1

# Modify a field externally 
CMD="uuid -v4" FS="," OFS="," +$1 { CMD | getline $5; close(CMD); print }

# Invoke dynamically generated command
FMT='date -I -d "%s"' FS="," +$1 { cmd = sprintf(FMT, $2); cmd | getline $2; close(cmd); print }

# Join data
FS="," +$1 { CMD | getline $5; print }' CMD='od -vAn -w4 -t x /dev/urandom
```

```perl title="Duplicate lines"
# Identify duplicate lines
a[$0]++

# Remove duplicate lines
!a[$0]++
```


```perl
# Print only up to (but excluding) the indicated line, using the apparently undocumented variable stop (https://askubuntu.com/questions/1022530/delete-lines-that-come-after-a-line-with-a-specific-pattern-in-shell)
/\s*Only this and nothing more/ {stop=1} stop==0 {print} # (1)
```

1. 
``` title="Output"
Once upon a midnight dreary, while I pondered, weak and weary,
  Over many a quaint and curious volume of forgotten lore--
  While I nodded, nearly napping, suddenly there came a tapping,
  As of some one gently rapping, rapping at my chamber door.
  "'Tis some visitor," I muttered, "tapping at my chamber door--
```

##### [Random number generation](https://docstore.mik.ua/orelly/unix3/sedawk/ch09_01.htm#sedawk-ch-9-sect-1.3)

The **rand()** function generates a random value between 0 and 1 from the time of day.

```perl
{ print rand() }

# Provide a seed
BEGIN { srand($SEED) } { print rand() }
```