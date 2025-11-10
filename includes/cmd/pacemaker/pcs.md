[pacemaker]: ../../../docs/Applications/pacemaker.md

pcs is the CLI frontend utility for administration of [Pacemaker](pacemaker]) clusters.

=== ":material-star: Common"

    ```sh
    pcs status

    pcs node standby $NODE

    pcs resource cleanup
    ```

=== "cluster"

    ```sh
    pcs cluster status

    pcs cluster stop $NODE

    pcs cluster disable $NODE
    ```
