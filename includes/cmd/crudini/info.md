[crudini](https://github.com/pixelb/crudini/) is a utility for manipulating INI files.

```sh hl_lines="5"
# Retrieve RHEL version for each server in a list
for server in $(cat server_list)
do
    ssh -q $server 'cat /etc/os-release' \
        | echo "$server: $(crudini --get - "DEFAULT_VERSION_ID" | tr -d \")"
done
```
