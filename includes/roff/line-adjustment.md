<div class="grid cards" markdown>

-   Various requests exist to adjust text alignment (1)
    {: .annotate }

    1.  Text alignment is described in the roff ecosystem differently from that of common usage:

        -   _Filling_ is the process of making all lines approximately equal in length.

        -   _Justification_ is the adding of spaces between words to achieve perfectly even lines.
            However, it is also used more loosely to mean alignment or adjustment.

        -   _Adjustment_ refers to the entire process of aligning text using both filling and justification, but is also used as a synonym for justification.
            Text is said to be adjusted _at_ the left or right margin, meaning the margin that is made even during justification.

        -   Text that is filled but not justified is occasionally described as _ragged-right_ (what we today might describe as left aligned or left justified).
        Right-justified text can be described as _ragged-left_.

        -   [_Quad_](https://www.schaffter.ca/mom/momdoc/definitions.html#quad) is used in the mom macro package documentation to describe text that is filled but not justified (i.e. "quad left" as equivalent to left-aligned or ragged-right).

    <!-- -->

    -   `ad` align text
        -   `ad r` right-align text
        -   `ad c` center-align text
        -   `ad l` left-align text
    -   `br` line break
    -   `ce` center the next line. Optionally provide an argument to specify the number of lines.
    -   `fi` enable filling
    -   `nf` disable filling (preserve newlines)
    -   `ti` temporary indent: first-line indent of following paragraph
    -   `in` persistent indent

-   !!! info

        ```groff
        --8<-- "includes/roff/raw/utp-4-2.roff"
        ```

        ``` title="Output"
        --8<-- "includes/roff/raw/utp-4-2-output.txt"
        ```

</div>
