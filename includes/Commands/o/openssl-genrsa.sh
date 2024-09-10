# By default, genrsa will produce a key of 2048 bits
openssl genrsa -out $CA_KEY

# Specify the size of the key in bits (ref. numbits in the man page).
openssl genrsa -out $CA_KEY -des3 2048

# Generate a 4096-bit key and encrypt it with a passphrase provided interactively
openssl genrsa -out $CA_KEY -aes256 4096

# Provide password from the command-line
openssl genrsa -out $CA_KEY -aes256 -pass pass:$PASSWORD 4096

# Verify private key
openssl pkey -check -in $CA_KEY