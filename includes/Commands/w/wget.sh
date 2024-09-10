# Accept a self-signed certificate by skipping verification
wget --no-check-certificate $URL

# Specify a download directory
wget -O path/to/directory $URL    

# Use a file of cookies in Netscape text-based format
wget $URL --load-cookies=$COOKIES_FILE
