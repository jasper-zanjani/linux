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

# select can be combined with object-identifier index to get very specific information
ip -j a  \
| jq -r '.[] | select( .ifname == "enp6s0" ).addr_info.[0].local'

# List locations in the US
az account list-locations \
| jq '.[] | select( .metadata.geographyGroup == "US")'

# Display the named location
az account list-locations \
| jq '.[] | select ( .name == "eastus" )'

# Create a new JSON document, filtering the results to show only specified keys.
# Note that the entire directive is wrapped in brackets so that the output is correctly formatted
# as a list.
az account list-locations \
| jq '[ .[] | { name: .name, displayName: .displayName, geography: .metadata.geography, type: .type } ]' # (2)

```

1. 

    ```json title="Input"
    --8<-- "includes/Output/jq/3.json"
    ```
    ```json title="Output"
    {
      "color": "black",
      "value": "#000"
    }
    ```

2.  

    ```json title="Input"
    --8<-- "includes/Output/jq/azure-locations-trunc.json"
    ```
    ```json title="Output"
    --8<-- "includes/Output/jq/azure-locations-filtered-trunc.json"
    ```

jq's output is colorized by default.
Colors can be defined by setting the **JQ\_COLORS** environment variable.

