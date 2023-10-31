# Accept a self-signed certificate by skipping verification
curl -k https://192.168.1.10

# Use the dict network protocol (https://tools.ietf.org/html/rfc2229) to retrieve the definition of a word.
# https://fedoramagazine.org/set-up-an-offline-command-line-dictionary-in-fedora/
curl dict://dict.org/d:<word>

# Sending a POST method to a FastAPI app (https://app.pluralsight.com/guides/explore-python-libraries:-fastapi)
curl -X POST "http://127.0.0.1:8000/purchase/item/" -H "accept: application/json" -H "Content-Type: application/json" -d "{\"name\":\"sample item\",\"info\":\"This is info for the item\",\"price\":40,\"qty\":2}"

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