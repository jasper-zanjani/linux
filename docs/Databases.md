# Databases


## SQL syntax

<div class="grid cards" markdown>

-   #### [CREATE TABLE](https://www.sqlite.org/lang_createtable.html)

    ---

    ```sql
    CREATE TABLE names (name text);
    ```

    ```sql
    CREATE TABLE starships (
        name text, registry text, crew integer
    );
    ```

    ```sql
    -- Sqlite supports some constraints like NOT NULL
    CREATE TABLE trades (
        id          TEXT PRIMARY KEY,
        year        INT,
        month       INT,
        day         INT,
        ticker      TEXT CHECK(ticker IN ('ADA', 'APT', 'AVAX', 'BCH', 'BTC', 'ETH', 'NEAR', 'POL', 'SOL', 'SUI', 'TIA', 'TRX', 'XLM', 'XRP')) NOT NULL,
        price       REAL,
        quantity    REAL,
        description TEXT
    );
    ```

-   #### [SELECT PRINTF](https://www.alphacodingskills.com/sqlite/notes/sqlite-func-printf.php)

    ---

    **SELECT PRINTF** uses typical C-style format specifiers. (1)
    { .annotate }

    1. 
        --8<-- "includes/format-specifiers.md"

    ```sql
    SELECT PRINTF("%d/%d/%d: %s %s", year, month, day, ticker, quantity * price) FROM trades;
    ```



</div>


## Tasks

<div class="grid cards" markdown>

-   #### Hello, World!

    ---

    ```sql
    CREATE TABLE names (name text);

    INSERT INTO names (name) 
    VALUES ('Alice'), ('Bob'), ('Carl');

    SELECT PRINTF ("Hello, %s!", name) 
    FROM names; -- (1)
    ```

    1. 
    ``` title="Output"
    Hello, Alice!
    Hello, Bob!
    Hello, Carl!
    ```

-   #### Enums

    ---

    SQL data types do not include enums, however by using constraints specific values can be [enforced](https://www.educba.com/sqlite-enum/) at data entry time. 

    ```sql 
    CREATE TABLE enums ( 
        product_id      INT PRIMARY KEY,
        product_type    TEXT CHECK(product_type IN ('a', 'b', 'c')) 
                        NOT NULL
    );

    INSERT INTO enums (product_id, product_type)
    VALUES (1, 'a'); -- no error

    INSERT INTO enums (product_id, product_type)
    VALUES (2, 'z'); -- "Runtime error: CHECK constraint failed"
    ```

-   #### Starships

    ---

    ```sql
    CREATE TABLE starships (
        name text, registry text, crew integer
    );
    ```

    ```sql
    INSERT INTO starships (name, registry, crew) 
        VALUES ('USS Enterprise', 'NCC-1701', 400); -- (1)
    ```

    1. For some reason, a double-quote **"** produces an error, and only single-quotes are accepted.

-   #### PostgreSQL installation and setup

    ---

    --8<-- "includes/Tasks/postgresql.md"

    ```sh
    systemctl start postgresql
    sudo -u postgres psql
    ```

    ```sql title="Role setup"
    CREATE ROLE username LOGIN INHERIT -- (1)
                         CREATEDB -- (5)
                         PASSWORD 'password'; -- (3)
    GRANT postgres TO username; -- (2)
    CREATE DATABASE username; -- (4)
    exit
    ```

    1. Create a new user or "role". Like SSH, psql by default will use the currently logged-in username, which does not exist on a fresh installation.
    2. Grant [group membership](https://www.postgresql.org/docs/9.5/role-membership.html) to the newly created user.
    3. Manually set a password for the newly created user. Single quotes are necessary here, as double quotes will cause an error.
    ```sql title="After role creation"
    ALTER USER username WITH PASSWORD 'password' ;
    ```
    4. The default database which is logged into is also named after the currently logged-in user. 
    Also the built-in command **createdb** can be used from the command-line.
    5. Database creation is a [restricted operation](https://www.postgresql.org/docs/9.5/role-attributes.html) granted by an attribute.
    ```sql title="After role creation"
    ALTER USER username WITH CREATEDB;
    ```

    PostgreSQL configs **postgresql.conf** and **pg_hba.conf** are stored where the PostgreSQL database cluster was initialized with initdb.
    This directory can be initialized anywhere, but the default in Red Hat systems is **/var/lib/pgsql/data**.

-   #### Links

    ---

    - [Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio?view=sql-server-2017)

    - [Cosmos DB emulator](https://docs.microsoft.com/en-us/azure/cosmos-db/local-emulator?tabs=ssl-netstd21)

    - [SQLBolt interactive tutorial](https://sqlbolt.com/)

</div>

## Commands

<div class="grid cards" markdown>

-   #### psql
    
    ---

    --8<-- "includes/Commands/p/psql.md"

-   #### sqlite3

    ---

    --8<-- "includes/Commands/s/sqlite3.md"

</div>
