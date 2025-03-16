**diff** compares files line by line. Its output can be used by **patch** to perform those changes on a file.

```sh
# Use diff and patch to make FILE1 the same as FILE2
diff $FILE1 $FILE2 > changes.diff
patch $FILE1 < changes.diff
```

