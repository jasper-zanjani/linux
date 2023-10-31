# Install package
pacman -S $PACKAGE 
#      --sync

# Display information about $PACKAGE
pacman -Si $PACKAGE 
#      --sync --info 

# Search for $PACKAGE in AUR repos
pacman -Ss $PACKAGE 
#      --sync --search

# Search for packages matching $PATTERN
pacman -Ss $PATTERN
#      --sync --search 

# Update package database
pacman -Sy 
#      --sync --refresh

# Update all packages from AUR and official repos
pacman -Syu 
#      --sync --refresh --sysupgrade

# Force refresh of all package databases, even if they appear to be up-to-date
pacman -Syy 
#      --sync --refresh --refresh

# Download program updates but don't install them
pacman -Syyuw 
#      --sync --refresh --refresh --sysupgrade --downloadonly

# Remove all packages from the cache as well as unused sync databases
pacman -Scc 
#      --sync --clean --clean
