# Display dependencies of $PROGRAM
ldd $PROGRAM

# Determine the location of the GNU C library
ldd /usr/bin/bash | grep libc
# => libc.so.6 => /usr/lib/libc.so.6 (0x00007fbeaf600000)


