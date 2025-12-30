# Pull an image from a repository
docker pull nginx

# Run a container, mounting volumes and making it accessible on ports
docker run -p=8080:80 -v=/web:/usr/share/nginx/html --name nginx nginx

# Stop named container
docker stop nginx

# Start a stopped container
docker start $CONTID

# Stop a container
docker stop $CONTID

# Display a list of all running and stopped containers containers
docker ps -a

# Remove a stopped container completely
docker rm $CONTAINER

# Remove a container image
docker rmi nginx
