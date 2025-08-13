jq's output is colorized by default, but colors can be defined by setting the `JQ_COLORS` environment variable.

!!! info

    All values for `QUERY` provided below can be passed to jq as follows:

    ```sh
    jq "$QUERY"
    ```

The _object-identifier index_ can be used to retrieve the value of a specific key.

```sh
QUERY='.environmentName'
```

The `select` function can be used to filter a list by a key's value

```sh
QUERY='.[] | select(.name=="southcentralusstg")'
```

`select` can be combined with object-identifier syntax to drill down to a single needed value

```sh
QUERY='.[] | select(.metadata.geographyGroup == "US")'
QUERY='.[] | select(.ifname=="enp6s0").addr_info.[0].local'
```

jq can create simplified JSON documents by filtering keys.

```sh
QUERY='[ .[] | { name: .name, displayName: .displayName, geography: .metadata.geography, type: .type } ]'
QUERY='.images[]
  | select( .specifications.operatingSystem=="aix")
  | {name: name, image: .imageID }'
```

This simplified document can be passed to a tool like mlr for terminal output.

```sh
jq "$QUERY" images-catalog.json | mlr --ijson --opprint cat
```

