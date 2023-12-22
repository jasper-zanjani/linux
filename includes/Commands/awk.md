Awk **programs** are equivalent to [**sed**](#sed) "instructions" and can be defined **inline** or in a **program file** (also "source files"). 
If no input files are specified awk can accept input from standard input.

```sh 
awk $OPTIONS $PROGRAM $INPUTFILES
awk $OPTIONS -f $PROGRAMFILE $INPUTFILES
```

Awk programs combine **patterns** and **actions**:

- Patterns can be:

    - regular expressions or fixed strings
    - line numbers using the builtin variable **NR**
    - predefined patterns **BEGIN** or **END**, whose actions are executed before and after processing any lines of the data file, respectively

- Actions include the ubiquitous **print** but can also be variable assignments like **stop=1**

Convert ":" to newlines in **$PATH** environment variable
```sh
echo $PATH | awk 'BEGIN {RS=":"} {print}'
```

```sh
# Print entire file
awk '{print}' raven # (1)

# Print only up to (but excluding) the indicated line, using the apparently undocumented variable stop (https://askubuntu.com/questions/1022530/delete-lines-that-come-after-a-line-with-a-specific-pattern-in-shell)
awk '/\s*Only this and nothing more/ {stop=1} stop==0 {print}' raven # (2)
```

1. 
```
--8<-- "includes/Configs/raven"
```
2. 
``` title="Output"
Once upon a midnight dreary, while I pondered, weak and weary,
  Over many a quaint and curious volume of forgotten lore--
  While I nodded, nearly napping, suddenly there came a tapping,
  As of some one gently rapping, rapping at my chamber door.
  "'Tis some visitor," I muttered, "tapping at my chamber door--
```

```sh
# Print the first field of all files in the current directory, taking ; as the field separator, outputting filename, line number, and first field of matches, with colon : between the filename and line number
awk 'BEGIN {FS=";"} /enable/ {print FILENAME ":" FNR,$1}' *

# Search for string MA in all files, outputting filename, line, and line number for matches
awk '/MA/ {OFS=" " print FILENAME OFS FNR OFS $0}' *

# change field separator (`FS`) to a colon (`:`) and run a program file against /etc/passwd
awk -F: -f awkscr /etc/passwd

# Print the first field of each line in the input file
```sh
awk '{ print $1 }' list

# Equivalent to grep MA *
awk '/MA/' * 
# awk '/MA/ {print}' *

# Define field separator with -F
awk -F, '/MA/ { print $1 }' list

# replace initial "fake." with "real;" in file `fake_isbn`
awk 'sub(^fake.,"real;")' fake_isbn

# Print all lines
awk '1 { print }' file

# remove file header
awk 'NR>1' file

# remove file header
awk 'NR>1 { print }' file

# print lines in a range
awk 'NR>1 && NR < 4' file

# Remove whitespace-only lines
awk 'NF' file

# Remove all blank lines
awk '1' RS='' file

# Extract fields
awk '{ print $1, $3}' FS=, OFS=, file

# perform column-wise calculations
awk '{ SUM=SUM+$1 } END { print SUM }' FS=, OFS=, file

# count the number of nonempty lines
awk '/./ { COUNT+=1 } END { print COUNT }' file

# count the number of nonempty lines
awk 'NF { COUNT+=1 } END { print COUNT }' file

# count the number of nonempty lines
awk '+$1 { COUNT+=1 } END { print COUNT }' file

# Arrays
awk '+$1 { CREDITS[$3]+=$1 } END { for (NAME in CREDITS) print NAME, CREDITS[NAME] }' FS=, file

# Identify duplicate lines
awk 'a[$0]++' file

# Remove duplicate lines
awk '!a[$0]++' file

# Remove multiple spaces
awk '$1=$1' file

# Join lines
awk '{ print $3 }' FS=, ORS=' ' file; echo

awk '+$1 { SUM+=$1; NUM+=1 } END { printf("AVG=%f",SUM/NUM); }' FS=, file` | format 

awk '+$1 { SUM+=$1; NUM+=1 } END { printf("AVG=%6.1f",SUM/NUM); }' FS=, file

# Convert to uppercase 
awk '$3 { print toupper($0); }' file

# Change part of a string
awk '{ $3 = toupper(substr($3,1,1)) substr($3,2) } $3' FS=, OFS=, file

# Split the second field ("EXPDATE") by spaces, storing the result into the array DATE; then print credits ($1) and username ($3) as well as the month (DATE[2]) and year (DATE[3]) 

awk '+$1 { split($2, DATE, " "); print $1,$3, DATE[2], DATE[3] }' FS=, OFS=, file
awk '+$1 { split($4, GRP, ":"); print $3, GRP[1], GRP[2] }' FS=, file
awk '+$1 { split($4, GRP, /:+/); print $3, GRP[1], GRP[2] }' FS=, file

# Search and replace with comma 
awk '+$1 { gsub(/ +/, "-", $2); print }' FS=, file

# Adding date 
awk 'BEGIN { printf("UPDATED: "); system("date") } /^UPDATED:/ { next } 1' file

# Modify a field externally 
awk '+$1 { CMD | getline $5; close(CMD); print }' CMD="uuid -v4" FS=, OFS=, file

# Invoke dynamically generated command
awk '+$1 { cmd = sprintf(FMT, $2); cmd | getline $2; close(cmd); print }' FMT='date -I -d "%s"'  FS=, file

# Join data
awk '+$1 { CMD | getline $5; print }' CMD='od -vAn -w4 -t x /dev/urandom' FS=, file

# Add up all first records to {sum}, then print that number out at the end
awk '{sum += $1} END {print sum}' file
```
