# Display location of a manpage rather than the manpage itself
man --where $COMMAND

# MANPAGER and PAGER variables are used as the name of the program used to display the manual page.
# By default, less is used.
MANPAGER = 'bat -l man --style=plain'; man $COMMAND