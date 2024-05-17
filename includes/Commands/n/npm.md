??? info "Installation"

    === ":material-fedora: Fedora"

        ```sh
        dnf install -y nodejs-npm
        ```

By default, package installations are installed in **local mode**, i.e. in the working directory.
A **global mode** installation can be done using **-g**/**--global**, which will install packages under **/usr/lib/node_modules** and binaries under **/usr/bin**.

```sh
npm i medium-to-markdown
```