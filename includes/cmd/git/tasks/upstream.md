Any local directory can be treated as an upstream as long as it is a bare git repository (conventionally with name ending in .git but this doesn't appear to be necessary).
Any such local repo can be cloned by using the **--local** option or using the **file://** protocol.

```sh
git clone --local /path/to/upstream.git

git clone file:///path/to/upstream.git
```
