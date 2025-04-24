# Display repos
dnf repolist # -v

# Display enabled repos
dnf repolist --enabled

# Display a single repo (repoinfo is actually an alias)
dnf repoinfo $REPO_NAME
dnf repolist -v $REPO_NAME

