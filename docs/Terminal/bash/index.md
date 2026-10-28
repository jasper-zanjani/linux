# Overview

!!! info "Reference"

    --8<-- "includes/cmd/bash/callout.md"

## Loops

--8<-- "includes/cmd/bash/callout/for.md"

## Arrays

```sh
--8<-- "includes/bash/arrays.sh"
```

## set

--8<-- "includes/cmd/bash/callout/set.md"

## shopt

--8<-- "includes/cmd/bash/callout/shopt.md"

## Tasks

```sh title="Split a string"
URL="https://www.cnn.com/"
IFS=/ read -r -a URL_PARTS <<< "$URL"
```


