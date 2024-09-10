**jq** is used to query JSON documents.

```sh title="Example JSON data"
# Azure account data
az account show | jq # (1)

jq '.environmentName' json # => "AzureCloud"
```

1. 
```json
{
  "environmentName": "AzureCloud",
  "homeTenantId": "9e5dbd21-d5f1-4ca7-8068-e2c0f8551cc9",
  "id": "f2acbad6-5760-4f87-ada7-3753382b2b8f",
  "isDefault": true,
  "managedByTenants": [],
  "name": "Pay-As-You-Go",
  "state": "Enabled",
  "tenantId": "9e5dbd21-d5f1-4ca7-8068-e2c0f8551cc9",
  "user": {
    "name": "jasper.zanjani@outlook.com",
    "type": "user"
  }
}
```

Colors can be defined by setting the **JQ\_COLORS** environment variable.

