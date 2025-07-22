GNU roff (1) is a document formatting and typesetting system and language that can produce output in various formats.
The frontend is `groff` which will indirectly invoke `troff` (for TTY devices) or `nroff` (for printed documents) as suitable.
{: .annotate }

1.  

    --8<-- "includes/cmd/groff/callout.md"

groff supports various [_macro packages_](https://www.gnu.org/software/groff/manual/groff.html#Macro-Package-Intro), specified with one or two letter codes after the `-m` option. 

-   [`-man`](https://www.gnu.org/software/groff/manual/groff.html#man) specifies the man page format of Unix Version 7.
-   [`-ms`](https://www.gnu.org/software/groff/manual/groff.html#ms) ("manuscript") specifies the original AT&T general-purpose document format and is suitable for the preparation of various document types.

`-T` specifies an [output device](https://www.gnu.org/software/groff/manual/groff.html#Output-Device-Intro) (`-Tpdf`, `-Tutf8`, `-Thtml`, etc.)

