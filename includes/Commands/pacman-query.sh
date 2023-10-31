# Display installed packages
pacman -Q 
#       --query

# Display installed packages, limiting output to program names
pacman -Qq
#       --quiet

# Display files owned by the package
pacman -Ql $PACKAGE
#       --list

# Display only explicitly installed packages and versions
pacman -Qe 
#      --explicit

# Display explicitly installed packages, limiting output to program names
pacman -Qeq 
#      --explicit --quiet

# Display all packages installed from the AUR
pacman -Qm 
#      --foreign

# Display all packages installed from main repos
pacman -Qn 
#      --native

# Find which package owns $FILE
pacman -Qo $FILE 
#      --owns

# List all installed packages, filtering output to packages that are out-of-date on the local system
pacman -Qu 
#      --upgrades

# Display all orphaned dependencies (no longer needed)
pacman -Qdt 
#      --deps --unrequired

# Get number of total installed packages
pacman -Q | wc -l