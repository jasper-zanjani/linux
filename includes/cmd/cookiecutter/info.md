Cookiecutter (1) is used to create projects from arbitrarily defined project templates.
{: .annotate }

1.  

    --8<-- "includes/cmd/cookiecutter/callout.md"

Cookiecutter projects are specified by their path in the filesystem and require several elements:

-   **cookiecutter.json** which defines templated variables and default values
-   **templated project directory** named **{{cookiecutter.dirname}}** or something similar containing templated files. 
    Without this directory, cookiecutter will produce an error.

```sh
# Generate a new project from the project template
cookiecutter $PROJECT_PATH
```
