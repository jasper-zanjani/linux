# Create a new network bridge using the **transparent driver**
docker network create -d transparent $NETWORKNAME

# Create a transparent network bridge with static IP addresses
docker network create -d transparent --subnet=10.0.0.0/24 --gateway=10.0.0.1 $NETWORK
