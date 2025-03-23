# List all configuration (includes directive in global .gitconfig)
git config --list

# Store authentication details in the credential store (2)
git config --global credential.helper store

# Set up alias "br" for branch (1)
git config --system alias.br branch

# Define a directory as safe (3)
git config --global --add safe.directory $PATH

# Specify a SSH key for pushing and pulling
git config --local --add core.sshCommand 'ssh -i $KEY'

git config --global alias.staash stash --all

# Run a script
git config --global alias.bb !better-branch.sh

# Disable appending CRLF endings (default behavior on Windows)
git config core.autocrlf false
