# Immich

!!! info

    - **Default port**: 2283

Install from the [docker-compose file](https://immich.app/docs/install/docker-compose), then set relevant variables in .env.

Additional mounts can be imported to your collection as **external libraries** (Avatar > Administration > External Libraries) where they are imported as directories local to the container.

Immich observes the file access date, but only sometimes.

```sh
# Force-date a file 
touch -d $DATE
```

Nested folders are not so helpful within immitch since the full path is only visible after revealing it in the image metadata sidebar.

Tags can be applied, but they are made more useful by [enabling the sidebar](https://docs.immich.app/features/tags/) in Account Settings > Features > Tags
