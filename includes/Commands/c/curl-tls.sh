# Attempting to access the TLS port without specifying https will cause Nginx to return a 400 error.
curl localhost:8443

# Without any arguments curl will not be able to verify the subject certificate against the issuer
curl https://localhost:8443 # => curl: (60) SSL certificate problem: unable to get local issuer certificate

# curl will access the site normally by bypassing certificate verification
curl https://localhost:8443 -k

# By explicitly providing the CA, the subject certificate can be verified
curl https://localhost:8443 --cacert ca.pem

# After adding the CA to the system's certificate store, this option can be foregone
trust anchor ca.pem

curl https://localhost:8443