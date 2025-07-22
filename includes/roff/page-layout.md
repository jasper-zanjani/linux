Macro packages like mom have sane defaults for page layout, but using roff raw without explicit layout requests will cause output to lack left and top margins.
Left and right margins are set by `po` ("page offset") which describes the left margin, and `ll` ("line length").
The default line length is 6.5 inches, so for letter-size paper a 1-inch left margin can be specified with `po 1i`

However, a vertical margin is more complicated because it uses the `wh` (when) request to set a _trap_, a position on the page that will execute a macro (that is, macro in the true sense of the word as a user-defined sequence of commands, and not a built-in request).
The reason for this complication is that historically typesetters produced contiuous output on rolls of film or paper.

All page layout requests take an argument and use indicators for units of measure. (1)
The default unit of measure is ems for the horizontal requests (`ll`, `in`, `ti`, `ta`, `po`, `lt`, and `mc`) and lines for vertical requests (`sp`).
{: .annotate }

1.  

    -   `c` centimeters
    -   `i` inches
    -   `m` ems
    -   `n` ens
    -   `p` points
    -   `P` picas
    -   `u` device units
    -   `v` lines (vertical spaces)

-   `bp` page break
-   `ll` line length
-   `pl` page length
-   `po` left margin
-   `sp` vertical space
-   `wh` vertical position to run macro
