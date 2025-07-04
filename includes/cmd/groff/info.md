GNU roff (1) is a typesetting system and language that can produce output in various formats.
{: .annotate }

1.  

    --8<-- "includes/roff/callout.md"

groff supports various [_macro packages_](https://www.gnu.org/software/groff/manual/groff.html#Macro-Package-Intro), specified with one or two letter codes after the `-m` option. 

-   [`-man`](https://www.gnu.org/software/groff/manual/groff.html#man) specifies the man page format of Unix Version 7.
-   [`-ms`](https://www.gnu.org/software/groff/manual/groff.html#ms) ("manuscript") specifies the original AT&T general-purpose document format and is suitable for the preparation of various document types.

`-T` specifies an [output device](https://www.gnu.org/software/groff/manual/groff.html#Output-Device-Intro) (`-Tpdf`, `-Tutf8`, `-Tascii`, etc.)

_Macros_ are directives that signify formatting corresponding to parts of the text.

#### mom

--8<-- "includes/roff/mom/info.md"

#### man

--8<-- "includes/roff/man/info.md"

#### ms

--8<-- "includes/roff/ms/info.md"

