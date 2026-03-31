# Nginx
podman run -d -v=$HOME/notes/site:/usr/share/nginx/html:Z -p=8080:80 nginx

# Grist
podman run -d -v $MOUNT:/persist:Z -p 8484:8484 --name grist grist

# Apache
podman run -d -v=$HOME/notes/site:/usr/local/apache2/htdocs:Z -p=8080:80 httpd-24

# Azure Cosmos DB emulator
podman pull mcr.microsoft.com/cosmosdb/linux/azure-cosmos-emulator:vnext-preview
podman run -d -p 8081:8081 -p 1234:1234 azure-cosmos-emulator:vnext-preview

# Azure Data Explorer Kusto emulator (the environment variable is required)
podman pull mcr.microsoft.com/azure/dataexplorer/kustainer-linux:latest
podman run -v $HOME/kustodata:/kustodata:Z -e ACCEPT_EULA=Y -p 8080:8080 kustainer-linux
