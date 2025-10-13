# Generate host keys
sudo ssh-keygen -A

# Generate RSA key pair (3072-bit by default), specifying filename path
ssh-keygen -t rsa -f $FILENAME
