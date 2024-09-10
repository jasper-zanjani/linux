# Display supported message digest algorithms
openssl dgst -list

# Hash the file
openssl dgst -sha256 $FILE

# Sign the SHA256 hash of a file and write the (binary) signature to another file
openssl dgst -sha256 -sign $KEY -out $SIGNATURE $FILE

# Verify the signature
openssl dgst -sha256 -prverify $KEY -signature $SIGNATURE $FILE