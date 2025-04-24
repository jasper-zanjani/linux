If there are many unstaged changes, they can be staged [piecemeal](https://nuclearsquid.com/writings/git-add/) using **-p**/**--patch**.
This will display colorized diffs of individual changes, named "hunks" in each file.
The user must interactively provide commands in the terminal:

- **y** add the current hunk
- **n** skip the hunk
- **d** skip the hunk and all other remaining hunks
- **s** split the hunk into smaller hunks, but only if there are unchanged lines between the changes displayed in the current hunk
- **e** manually edit the hunk
- **q** abort (note that this will abort all changes made in the operation, including prior hunk selections)

```sh
git add -p README.md
```


