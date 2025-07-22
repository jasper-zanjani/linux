grotty is the groff output driver for terminal devices and is invoked by groff when it is given the arguments `ascii` or `utf8` to the `-T` option.

Arguments can be passed to grotty through groff with `-P`.

-   `-c` instructs grotty to use an output format compatible with paper terminals (i.e. Teletype machines, no longer in wide use) by suppressing SGR and OSC escape sequences.
