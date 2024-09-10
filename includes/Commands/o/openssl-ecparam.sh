# Explore possible curve names to be used as arguments to ec_paramgen_curve
openssl ecparam -list_curves # (1)

# Create a parameters file using the specified elliptic curve
openssl ecparam -out ec_param.pem -name prime256v1

# Inspect parameters file
openssl ecparam -in ec_param.pem -text -noout