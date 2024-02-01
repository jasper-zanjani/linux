# Remove $PACKAGE
pacman -R $PACKAGE 
#      --remove

# Remove $PACKAGE as well as its dependencies
pacman -Rs 
#      --recursive

# Remove $PACKAGE, dependencies, and config files
pacman -Rsn $PACKAGE 
#      --recursive --nosave
