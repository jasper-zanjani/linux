**sed** ("stream-oriented editor") is typically used for applying repetitive edits across all lines of multiple files. 
In particular it is, alongside **awk** one of the two primary commands which accept regular expressions in Unix systems. 

```sh
# Sed instructions can be defined inline or in a command file (i.e. script).
sed $OPTIONS $INSTRUCTION $FILE
sed $OPTIONS -f $SCRIPT $FILE
```

```sh
# Suppress automatic printing of pattern space
sed -n # --quiet , --silent

# Edit the file in-place, but save a backup copy of the original with $SUFFIX appended to the filename.
SUFFIX='.bak'
sed -i$SUFFIX # (1)
```

1. Note that the suffix must be **appended directly** to the letter i as shown: an equal sign will be interpreted as part of the suffix and a space is not acceptable.

Sed instructions are made of two components: 

- **Addresses** (i.e. patterns): zero, one, or two addresses can precede a procedure. In the absence of an address, the procedure is executed over every line of input. With one address, the procedure will be executed over every line of input that matches.
- **Procedures** (i.e. actions).


Addressing can be done in one of two ways:

- **Line addressing**, specifying line numbers separated by a comma (e.g. **`3,7p`**)
- **Context addressing**, using a regular expression enclosed by forward slashes (e.g. `/From:/p`)

```sh title="Line addressing"
# Display a range of lines: without **-n** to suppress automatic printing of pattern space, each line will be printed twice
sed -n '1,2p' $FILE

# Do the same thing, this time by automatically printing all pattern space but suppressing from the third line on. $ refers to the last line
sed '3,$d' $FILE

# Prepending ! to the procedure reverses the sense of the command
sed -n '3,$!p' $FILE

# Replace functionality of head command by displaying the first 10 lines, then quitting
sed 10q $FILE

# Use -e to precede multiple instructions
sed -n -e '1,2p' -e '7,9p' -e '$p' $FILE

# Delete only the second line while printing all others
sed '2d' $FILE

# Delete a range of lines: from the 2nd through the 3rd
sed '2,3d' $FILE
```

```sh title="Context addressing"
# Display only uncommented lines of a configuration
sed -n '/^[a-z]/p' /etc/ldap.conf
sed '/^#/d' /etc/locale.gen

# Delete a range of lines, from the first occurrence of 'second' to the line with the first occurrence of 'fourth'
sed '/second/,/fourth/d' myfile

# Suppress any line with 'test' in it
sed '/test/d' myfile

# Equivalent to grep MA *
sed -n '/MA/p' *

# Replace the first instance of pipe with colon and display the first two lines.
sed 's/|/:/ emp.lst' | head -2

# Substitute HTML tags:
sed 's/<I>/<EM>/g'

# Replace "director" with "executive director"
sed 's/director/executive director/' emp.lst
sed 's/director/executive &/' emp.lst
sed '/director/s//executive &/' emp.lst

# Replace angle brackets with their HTML codes, piped in from a heredoc:
sed -e 's/</\&lt;/g' -e 's/>/\&gt;/g' << EOF
```

```sh
# Monitor characters sent by terminal according to keypresses
sed -n l

--8<-- "includes/Tasks/filter/uncommented-lines.sh"
```

Pass filenames from grep to sed for in-place replacement with `-i`

```sh
grep -rl '/Commands/a/ansible' includes docs | xargs sed -i 's/Commands\/a/cmd\/ansible/g'
```

```sh title="Piping statements together"
# Take lines beginning with "fake" and remove all instances of "fake.", piping them... remove all parentheses with content and count lines of output (results)
sed -n '/^fake/s/fake\.//p' * | sed -nr 's/\(.*\)//p' | wc -l

# Take lines of all files in CWD beginning with "fake" and remove all instances of string "fake." Then remove all parentheses with any content within them and print only the top 10 lines
sed -ne '/^fake/p' * | sed -n 's/fake\.//p' | sed -nr 's/\(.*\)//p' | sed 11q

# Count the number of pipes replaced by piping output to `cmp`, which will use the `-l` option to output byte numbers of differing values, then counting the lines of output (YUG:456)
sed 's/|/:/g' emp.lst | cmp -l - emp.lst | wc -l

# Display the top 10 processes by memory or cpu usage.
ps axch -o cmd,%mem --sort=-%mem | sed 11q
ps axch -o cmd:15,%cpu --sort=-%cpu | sed 11q

# Search and replace on files
grep -rl $PATTERN $DIRECTORY | xargs sed -e "s/$PATTERN/$REPLACEMENT/g"
```
