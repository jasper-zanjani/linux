=== "Links"

    -   [GNU groff manual](https://www.gnu.org/software/groff/manual/groff.html#What-Is-groff_003f)

    -   [mom macros for GNU troff](http://www.schaffter.ca/mom/mom-01.html)

=== "Installation"

    ??? info ":material-fedora: Fedora"

        On Fedora, the **gropdf** executable required by the PDF target (`-Tpdf`) is installed only with the **groff-perl** package.

        ```sh
        dnf install -y groff-perl
        ```

=== "History"

    -   roff's predecessor [**runoff**](https://en.wikipedia.org/wiki/TYPSET_and_RUNOFF) was written by [Jerry Saltzer](https://en.wikipedia.org/wiki/Jerome_H._Saltzer) for the CTSS operating system, which developed into Multics and for which runoff became the main format for documentation and text processing.
        runoff used a syntax of two-character directives, many of which were inherited by roff.
        The dot prefix originated from the convention of denoting formatting requests to the typesetter in manuscripts (NFI).

    -   While reimplementing runoff into roff for Unix, [Joseph Osanna](https://en.wikipedia.org/wiki/Joe_Ossanna) enlarged the language's syntax.
        First written in PDP-11 assembly it was ported to C by 1975. 
        After Osanna's death in 1977, Brian Kernighan took over development.

    -   Mike Lesk developed the ms macro package which was first released in [Version 6 Unix](https://lists.gnu.org/archive/html/groff/2023-04/msg00028.html) (1975) to accommodate typesetting printed documents.
    
        Although roff was originally created to display man pages, the man macro package came later and actually drew heavy inspiration from ms.

    -   As commercial Unix fractured and floundered in the 1980s, the Texinfo ecosystem emerged and won the crown in academic typesetting.
        At the same time the PC desktop publishing revolution took hold while the source for a device-agnostic rewrite of roff languished behind Bell Labs's proprietary license.

    -   [James Clark](https://en.wikipedia.org/wiki/James_Clark_(programmer)) developed groff and released it under the GPL.
        groff's implementation of Sun extensions to man endeared it among users of Unix workstations.
        Clark is recognized as a key contributor to SGML which developed in parallel with HTML.
        He is especially recognized for his contributions to the XML standard, also an extension of SGML.
    
    -   Peter Schaffter began developing the mom macro package in 2002.

    -   groff was used with the ms macro package to [typeset](https://rkrishnan.org/posts/2016-03-07-how-is-gopl-typeset.html) _The Go Programming Language_ by Alan Donovan and Brian Kernighan in 2016.
