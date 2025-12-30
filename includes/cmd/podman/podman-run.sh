# Nginx
podman run -d -v=$HOME/notes/site:/usr/share/nginx/html -p=8080:80 --name=notes nginx

# Apache
podman run -d -v=$HOME/notes/site:/usr/local/apache2/htdocs -p=8080:80 --name=notes httpd-24

# Azure Cosmos DB emulator
podman pull mcr.microsoft.com/cosmosdb/linux/azure-cosmos-emulator:vnext-preview
podman run -d -p 8081:8081 -p 1234:1234 azure-cosmos-emulator:vnext-preview

podman run -d -v $MOUNT:/persist:Z -p 8484:8484 --name grist grist
