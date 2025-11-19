npm has two modes of operation:

-   Local mode (current working directory) for installing packages into the current project
-   Global mode for installing packages into the install prefix at **/usr/local/lib/node_modules** and **/usr/local/bin**

```sh
# Install Gemini CLI (root)
npm install -g @google/gemini-cli

# List all globally installed packages
npm list --global --depth 0
```
