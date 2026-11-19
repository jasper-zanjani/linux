jq's output is colorized by default, but colors can be defined by setting the `JQ_COLORS` environment variable.

All values for `QUERY` provided below can be passed to jq as follows:

```sh
jq "$QUERY"

# Retrieve the value of a specific key ("object-identifier syntax")
QUERY='.environmentName'

# Filter a list by a key's value
QUERY='.[] | select(.name=="southcentralusstg")'

# Combined select with object-identifier syntax
QUERY='.[] | select(.metadata.geographyGroup == "US")'
QUERY='.[] | select(.ifname=="enp6s0").addr_info.[0].local'

# Flatten lists
QUERY='.[].url[]'
```

jq can create simplified JSON documents by filtering keys.

```sh
QUERY='[ .[] | { name: .name, displayName: .displayName, geography: .metadata.geography, type: .type } ]'
QUERY='.images[]
  | select( .specifications.operatingSystem=="aix")
  | {name: name, image: .imageID }'
```

JSON streams resembling lists but lacking the bracket and comma delimiter are often produced by network tools like yt-dlp.
Use `-s`/`--slurp` to format these as JSON documents.

```sh
jq -s data.json > output.json
```

The best way to integrate jq with a shell loop is to use the `@tsv` or `@sh` formatters to output newline-delimited text.
This is better than piping to a separate tool like **mlr**.

```sh
jq -r '.[] | [.id, .name] | @tsv' data.json
```

