=== ":material-fedora: Fedora"

    ```sh
    dnf install -y nodejs-npm
    ```

By default, package installations are installed in **local mode**, i.e. in the working directory.
A **global mode** installation can be done using **-g**/**--global**, which will install packages under **/usr/lib/node_modules** and binaries under **/usr/bin**.

```sh
# Install to system at /usr/local/lib
npm -g install yarn

# Confirm
npm -g list

# Install locally
npm i medium-to-markdown
```