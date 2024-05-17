<div class="grid cards" markdown>

-   :material-file-plus:{ .lg .middle } Create archive

    ---

    By default, GNU tar compression is used, but additional options allow other compression algorithms to be used.

    === "Default"

        ```sh
        tar -cf $ARCHIVE $PATH
        #   --create --file
        ```

    === "bzip2"

        ```sh
        tar -cfj $ARCHIVE $PATH
        #   --bzip
        ```

    === "gzip"
    
        ```sh
        tar -cfz $ARCHIVE $PATH
        #   --gzip
        ```

    ```sh title="Add file to existing archive"
    tar -rf $ARCHIVE $FILE
    #   --append
    ```

-   :material-file-move:{ .lg .middle } Extract archive

    ---

    ```sh title="Extract into current directory"
    tar -xf $ARCHIVE
    #   --extract --file
    ```

    ```sh title="Extract only a single file"
    tar -xf $ARCHIVE $FILE
    ```

    ```sh title="Extract to a path"
    tar -xzf $ARCHIVE -C $PATH
    ```


-   :material-file-search:{ .lg .middle } List archive contents

    ---

    ```sh
    tar -tf $ARCHIVE
    #   --list
    ```

</div>