podman run nginx \
       --detach \
       --publish 8080:80 \
       --volume $HOST_VOL:/usr/share/nginx/html:Z

podman run grist \
       -d \
       -p 8484:8484 \
       -v $HOST_VOL:/persist:Z grist

podman run httpd-24 -d -p 8080:80 -v=$PATH:/usr/local/apache2/htdocs:Z  

podman run mcr.microsoft.com/cosmosdb/linux/azure-cosmos-emulator:vnext-preview \
       -d -p 8081:8081 -p 1234:1234

podman run mcr.microsoft.com/azure/dataexplorer/kustainer-linux:latest \
       -p 8080:8080 \
       -e ACCEPT_EULA=Y \
       -v $HOST_VOL:/kustodata:Z 

podman run docker.io/jellyfin/jellyfin:latest \
       -d -p 8096:8096/tcp -p 7359:7359/udp \
       --mount type=bind,source=$HOST_VOL:/media
