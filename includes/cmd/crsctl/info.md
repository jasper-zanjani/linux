Oracle Clusterware Control (CRSCTL) (1) provides an interface with Oracle Clusterware using Clusterware APIs.
{: .annotate }

1.  **References**

    -   [E Oracle Clusterware Control (CRSCTL) Utility Reference](https://docs.oracle.com/en/database/oracle/oracle-database/26/cwadd/oracle-clusterware-control-crsctl-utility-reference.html)

```sh
# Cluster aware commands (cluster) operate on other nodes of the cluster
crsctl check cluster

# Local commands (crs) target only the local node
crsctl check crs

# Cluster Synchronization Services
crsctl check css

# Event Manager
crsctl check evm

# Retrieve hostname of local server
crsctl get hostname
```
