REPO=https://gitlab.gnome.org/GNOME/gtk.git
git clone $REPO

# The depth of the tree can be specified, and various configuration parameters can be passed with -c
git clone $REPO --depth 1 -c http.sslVerify=false
