# Download a file (equivalent to wget)
curl -O $URL

# Send request data to a local echo server
curl localhost:8081 -d "Hello, World!"


# Use the dict network protocol (https://tools.ietf.org/html/rfc2229) to retrieve the definition of a word.
# https://fedoramagazine.org/set-up-an-offline-command-line-dictionary-in-fedora/
curl dict://dict.org/d:$WORD

# Explicitly providing a CA that is not in the certificate store
curl https://localhost:8443 --cacert ca.pem

# -f, --fail
#   Fail fast with no output at all on server errors, to facilitate scripts.
# -s, --silent
#   No progress meter or error messages
# -S, --show-error
#   When used with -s, show an error message if it fails
# -L, --location
#   If the server reports that the page has moved, make a new request at the new place

# Typically used to pipe signing keys for repos
curl -fsSL http://nginx.org/keys/nginx_signing.key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg