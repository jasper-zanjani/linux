The **man** macro package (an.tmac) is used for compiling man pages.

```sh
INPUT=file.1
# Output a document to a traditional ASCII man page and view it in the system's man pager.
groff -man -Tascii $INPUT | $MANPAGER

# man will also interpret this markup
man ./$INPUT

# Convert markdown to a manpage snippet
pandoc -t man $MD_FILE

# -s/--standalone creates a "full" file (blank title header)
pandoc -s -t man $MD_FILE
```

-   `.TH` title header, the first command in a man page, takes at least five arguments (1)
    {: .annotate }

    1.  

        ```man title="Arguments to TH"
        .TH "[Program name]" "[Manual section]" "[Date]" "[Version]" "[Title]"
        ```

-   `.SH` section header takes a section name which will be converted to bold lettering.

-   `.PP` paragraph text

-   `.B` bolding and `.I` italics (underline). 
    These often appear in font macros which apply the formatting alternately, for example `.BI` "bold and italic" or `.BR` "bold and roman". (1)
    {: .annotate }

    1.  

        ```man hl_lines="9"
        --8<-- "includes/roff/man/03.1"
        ```


-   `."` comment

-   `.RS` and .`RE` relative indent start and end, often used in the **FILES** section (1)
    {: .annotate }

    1.  

        ```man hl_lines="5-7 9-11" title="Relative indent macros"
        --8<-- "includes/roff/man/01.1"
        ```

-   `.IP` indents the following line one level and is often used in the **OPTIONS** section (1)
    {: .annotate }

    1.  

        ```man hl_lines="3 5 7" title="IP macro"
        --8<-- "includes/roff/man/03.1"
        ```
