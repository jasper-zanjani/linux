# Display location of a manpage rather than the manpage itself
man --where $COMMAND

# Man page section numbers are provided before the entry on Linux.
# 1. Executable programs or shell commands
# 2. System calls (functions provided by the kernel)
# 3. Library calls (functions within program libraries)
# 4. Special files (usually found in /dev)
# 5. File formats and conventions, e.g. /etc/passwd
# 6. Games
# 7. Miscellaneous (including macro packages and conventions), e.g. man[0m22m(7), groff[0m22m(7), man-pages[0m22m(7)
# 8. System administration commands (usually only for root)
# 9. Kernel routines [Non standard]

# Shell command
man 1 printf

# C function
man 3 printf

# MANPAGER and PAGER variables are used as the name of the program used to display the manual page.
# By default, less is used.
MANPAGER = 'bat -l man --style=plain'; man $COMMAND