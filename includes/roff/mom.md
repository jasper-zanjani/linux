mom is the most recently developed macro package for groff.

```roff
--8<-- "includes/roff/mom-00.mom"
```

The only required macro for a mom document is [`PRINTSTYLE`](https://www.schaffter.ca/mom/momdoc/docprocessing.html#printstyle), which affects the overall appearance of the document.

-   `TYPESET` allows access to all typesetting and style control macros and sets the document in Times Roman by default.
-   `TYPEWRITE` reproduces the appearance of typewritten, double-spaced copy using Courier (the optional argument `SINGLESPACE` enables single-spacing).
    Terminal output using `Tutf8` or `Tascii` requires TYPESET.

The document header prints information about the document at the top of page one and is defined by [reference macros](https://www.schaffter.ca/mom/momdoc/docprocessing.html#reference-macros) like [`TITLE`](https://www.schaffter.ca/mom/momdoc/docprocessing.html#doc-title), [`AUTHOR`](https://www.schaffter.ca/mom/momdoc/docprocessing.html#author), [`SUBTITLE`](https://www.schaffter.ca/mom/momdoc/docprocessing.html#subtitle), etc.
If `DOCTYPE` is set (`DEFAULT` etc.) then the metadata provided in the [document header](https://www.schaffter.ca/mom/momdoc/docprocessing.html#docheader) will be printed at the top of page one once `START` is processed.
The docheader can be disabled entirely by setting `DOCHEADER OFF`.

The [fill mode](https://www.schaffter.ca/mom/momdoc/definitions.html#filled) refers to how the ends of lines appear.
In mom, justification refers to making text flush at both left and right margins (commonly "full justification"), while [quadding](https://www.schaffter.ca/mom/momdoc/definitions.html#quad) refers to justification on only one side ("left" or "right justification").
Every document element tag (`PP`, etc.) set a fill mode upon invocation.
If you want to override their fill mode it must be done so after the tag is invoked.

The main document element is [`PP`](https://www.schaffter.ca/mom/momdoc/docelement.html#pp-intro) for paragraph (`LP` does not exist in mom).
The first-line indentation is controlled by the `PARA_INDENT` document control (default indentation is 2 ems for TYPESET and 3 picas for TYPEWRITE).
By default, the first paragraph of a document is not indented (this behavior can be changed by setting `INDENT_FIRST_PARAS` for the document.
By default, no space is inserted between paragraphs, but this can be changed by setting the `PARA_SPACE` document control.

The topic of vertical space is complicated because mom wants to guarantee perfectly flush bottom margins.
Vertical space is inserted by using `SP` or `ALD`.
When these are not respected after the first line of text, you must also use the `RESTORE_SPACE` macro directly before them.

Other files can be included by using [`INCLUDE`](https://www.schaffter.ca/mom/momdoc/docprocessing.html#include).
Note that the files specified here must be absolute paths or relative to the present working directory at the time of invocation (tilde for $HOME is not interpreted).

??? info "Tutorial progression"

    ```groff title="mom/00"
    --8<-- "includes/roff/mom/00.mom"
    ```
