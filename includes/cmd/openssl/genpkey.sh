# Generate a 256-bit ECDSA private key
openssl genpkey -algorithm ec -pkeyopt ec_paramgen_curve:P-256 -out $CA_KEY

# Generate a 4096-bit RSA key
openssl genpkey -algorithm rsa -pkeyopt rsa_keygen_bits:4096 -out $CA_KEY

# Verify private key
openssl pkey -check -in $CA_KEY