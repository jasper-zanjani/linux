```sh
KEYBOX_FILE="~/.gnupg/pubring.kbx"
kbxutil $KEYBOX_FILE # => (1)

# Records are called blobs in this output
kbxutil --stats $KEYBOX_FILE # => (2)
```    

1. 

    ``` title="Output"
    # If empty
    --8<-- "includes/Output/kbxutil/kbxutil"

    # 1 key
    --8<-- "includes/Output/kbxutil/kbxutil1"
    ```

2. 

    ```
    # If empty
    --8<-- "includes/Output/kbxutil/kbxutil-stats"
    # 1 key
    --8<-- "includes/Output/kbxutil/kbxutil-stats1"
    ```

