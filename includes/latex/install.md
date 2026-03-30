Installation of LaTeX utilities (**pdflatex** and **latex** to compile to PDF and DVI documents respectively, **tlmgr**):

=== ":material-fedora: Fedora"

    ```sh
    dnf install -y texlive texlive-xetex
    ```

LaTeX packages and additional document classes can also be found as packages in Linux distributions

=== ":material-fedora: Fedora"

    ```sh
    dnf install -y texlive-xlop texlive-exam
    ```

Depending on the type of package, this will install a **sty** file (for "packages") or a **cls** (for document classes).
Note that some apparently more common packages appear to be preinstalled (**multicol** for example, but not **multirow**).

```sh
# Confirm
kpsewhich xlop.sty
kpsewhich exam.cls
```
