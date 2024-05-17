
# Generate random password
openssl rand -base64 32

# Download CA certificate from AD
openssl s_client -connect ldap.tylersguides.com:636 -showcerts < /dev/null

# Generate random password
openssl rand -base64 32

# Create an RSA private key, providing a password
openssl genrsa -des3 -out myCA.key 2048

# Generate a root certificate, providing password
openssl req -x509 -new -nodes -key myCA.key -sha256 -days 1825 -out myCA.pem

# Inspect X.509 certificate
openssl x509 -text -in myCA.pem

# Inspect certificate end date
openssl x509 -enddate -noout -in $CERTFILE

# Convert binary (DER) certificate to PEM format
openssl x509 -in myCA.crt -inform DER -out myCA_pem.crt -outform PEM

# Generate a certificate signing request (CSR) to be sent to a Certificate Authority
openssl req -new -sha256 -key filename.key -out filename.csr