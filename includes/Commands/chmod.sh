# Add/remove sticky bit
chmod +t $FILE
chmod -t $FILE

# Add/remove SGID
chmod g+s $FILE
chmod g-s $FILE

# Add/remove SUID
chmod u+s $FILE
chmod u-s $FILE

# Assign a permissions octet to a file to make it world-unreadable
chmod 600 /etc/sssd/sssd.conf