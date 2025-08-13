# List supported symmetric ciphers
openssl enc -list

# Encrypt a file with using a given cipher and password
openssl enc -des3 -salt -in $FILE -out $FILE_ENCRYPTED -pass pass:$PASSWORD

# Decrypt the encrypted file
openssl enc -des3 -d -in $FILE_ENCRYPTED -out $FILE_DECRYPTED -pass pass:$PASSWORD

# Encode a binary file in base64
openssl base64 -in $FILE_ENCRYPTED -out $FILE_ENC_BASE64
