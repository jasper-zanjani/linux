=== ":material-redhat: RHEL"

    ```sh
    dnf install -y \
        libpq-devel \
        mariadb-devel \
        postgresql \
        postgresql-server
    ```

=== ":material-arch: Arch"

    ```sh
    # Arch
    pacman -S postgresql

    # On Arch, this step appears to be necessary before the postgresql service can be enabled.
    # initdb requires a directory to be explicitly specified using --pgdata or alternatively the PGDATA environment variable.
    su - postgres -c 'initdb --pgdata /var/lib/postgres/data' # (1)
    ```


=== ":material-ubuntu: Ubuntu"

    ```sh
    apt install libpq-dev
    ```

```sh
# This command facilitates initialization of the database cluster, which defaults to /var/lib/pgsql/data, similar to using initdb.
postgresql-setup --initdb

systemctl enable postgresql --now
```


