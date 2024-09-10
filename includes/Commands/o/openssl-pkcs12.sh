# Combine an existing PEM certificate and key into a PKCS#12 keystore
openssl pkcs12 -export -in ca.pem -inkey ca.key -out ca.p12

# Explicitly set no password
openssl pkcs12 -export -in ca.pem -inkey ca.key -out ca.p12 -passout pass:
