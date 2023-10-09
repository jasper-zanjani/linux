# Query repos for information on a package
rpm -qi $PACKAGE # --query --info

# Upgrade or install a package, with progress bars
rpm -Uvh $PACKAGE # --upgrade --verbose --hash

# Display version of Fedora
rpm -E %fedora

# Import a [keyring](#rpmkeys)
rpm --import "https://build.opensuse.org/projects/home:manuelschneid3r/public_key"