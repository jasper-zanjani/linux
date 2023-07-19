#### Installation and setup

    ```sh
    # Arch
    pacman -S postgresql
    
    # On Arch, this step appears to be necessary before the postgresql service can be enabled.
    # initdb requires a directory to be explicitly specified using --pgdata or alternatively the PGDATA environment variable.
    su - postgres -c 'initdb --pgdata /var/lib/postgres/data' # (1)
    
    systemctl enable postgresql --now
    
    # Red Hat
    dnf install libpq-devel mariadb-devel postgresql postgresql-server
    
    # This command facilitates initialization of the database cluster, which defaults to /var/lib/pgsql/data, similar to using initdb.
    postgresql-setup --initdb # (1)
    
    systemctl enable postgresql --now

    # Ubuntu
    apt install libpq-dev
    ```


??? info "Resources"

    - [SQLBolt interactive tutorial](https://sqlbolt.com/)