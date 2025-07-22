# Suppress empty lines, using POSIX classes
sed '/^[[:space:]]*$/d'

# Using ERE
sed '/^\s*$/d'
