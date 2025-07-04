In ms, macro calls are on their own line.

**Registers**

Registers are set with the `.nr` request (1).
{: .annotate }

1.  

    ```man
    .nr PS 10.5p \" Use 10.5-point type.
    ```

    ```man title="MS macro example" hl_lines="1"
    --8<-- "includes/roff/00.ms"
    ```

**Document description**

-   [`.RP`](https://www.gnu.org/software/groff/manual/groff.html#ms-Document-Description-Macros) ("report" or "released paper") creates a separate cover page and places most of the document description at the top of the first page.

-   `.TL` document title
-   `.AU` author name
-   `.AI` author institution
-   `.DA` current date, or arguments, to center footer
-   `.AB` and `.AE` abstract beginning and end

**Body text**

-   `.LP` paragraph without additional indentation
-   `.PP` paragraph with first-line indentation according to the `PI` register.

**Headings**

-   `.NH` sets an automatically numbered heading.
    It takes an optional argument described as "depth" (1 by default), used to create an automatically increasing numbering.
    This value is equivalent to the number of `#` hashmarks used in markdown to indicate the heading level: `.NH 1` or `.NH` indicate the coarsest increase in document heading numbering and the largest heading, with greater numbers indicating finer increases in heading numbering ("1.2"), etc.


**Requests**

-   `.de` defines a new macro. (1)
    {: .annotate }

    1.  

        ```man hl_lines="27-38 40-50"
        --8<-- "includes/roff/example.groff"
        ```
