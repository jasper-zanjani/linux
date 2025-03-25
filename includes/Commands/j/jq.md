**jq** is used to query JSON documents.

```sh title="Example JSON data"
# Use object-identifier index to find the value for a specified key
az account show \
| jq '.environmentName' # => "AzureCloud"

# Use the select function to filter by key
jq '.[] | select(.color=="black")' 3.json # (1)

# Display object whose name key matches the provided value
az account list-locations \
| jq '.[] | select(.name=="southcentralusstg")'

# select can be combined with object-identifier syntax to drill down to a single needed value
ip -json a \
| jq '.[] | select(.ifname=="enp6s0").addr_info.[0].local' -r

```

1. 

    ```json title="3.json"
    --8<-- "includes/Output/jq/3.json"
    ```

    ```json title="Output"
    {
      "color": "black",
      "value": "#000"
    }
    ```

jq's output is colorized by default.
Colors can be defined by setting the **JQ\_COLORS** environment variable.

