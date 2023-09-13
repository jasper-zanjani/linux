pacman -Q # --query

# Get number of total installed packages
pacman -Q | wc -l

# Display detailed information on a package
pacman -Qi $PACKAGE 

# Display files owned by the package
pacman -Ql $PACKAGE

# Display all orphaned dependencies (no longer needed)
pacman -Qdt # --query --deps --unrequired

# Display only explicitly installed packages and versions
pacman -Qe # --query --explicit

# Display explicitly installed packages, limiting output to program names
pacman -Qeq # pacman --query --explicit --quiet

# Display all packages installed from the AUR
pacman -Qm # --query --foreign

# Display all packages installed from main repos
pacman -Qn # --query --native

# Find which package owns $FILE
pacman -Qo $FILE # --query --owns

# List all install packages, filtering output to packages that are out-of-date on the local system
pacman -Qu # --query --upgrades

# Remove $PACKAGE
pacman -R $PACKAGE # --remove

# Remove $PACKAGE, dependencies, and config files
pacman -Rns $PACKAGE # --remove --recursive --nosave

# Remove $PACKAGE as well as its dependencies
pacman -Rs # --remove --recursive

# Install $PACKAGE from the AUR
pacman -S $PACKAGE # --sync

# Remove all packages from the cache as well as unused sync databases
pacman -Scc # --sync --clean --clean

# Display information about $PACKAGE
pacman -Si $PACKAGE # --sync --info package

# Search for $PACKAGE in AUR repos
pacman -Ss $PACKAGE # --sync --search package

# Search for packages matching $PATTERN
pacman -Ss $PATTERN # --sync --search pattern

# Update package database
pacman -Sy #  --sync --refresh

# Update all packages from AUR and official repos
pacman -Syu # --sync --refresh --sysupgrade

# Force refresh of all package databases, even if they appear to be up-to-date
pacman -Syy # --sync --refresh --refresh

# Download program updates but don't install them
pacman -Syyuw # --sync --refresh --refresh --sysupgrade --downloadonly

# Downgrade a package (here, the Linux kernel)
pacman -U https://archive.archlinux.org/packages/l/linux/linux-6.4.12.arch1-1-x86_64.pkg.tar.zst