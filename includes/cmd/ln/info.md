```sh
# Provide absolute path
ln -s $(realpath $TARGET) $LINK_NAME

# Provide correct relative path
ln -s $(realpath --relative-to=$DESTINATION $TARGET) $LINK_NAME
```
