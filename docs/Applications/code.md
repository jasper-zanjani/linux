# VS Code

## Configuration

<div class="grid cards" markdown>

-   #### :material-wrench:{ .lg .middle } Configs

    ---

    - Local: $HOME/.config/Code/User/settings.json                               |
    - Flatpak: $HOME/.var/app/com.visualstudio.code/config/Code/User/settings.json |


-   #### Folding

    Code can be folded by placing [markers in comments](https://code.visualstudio.com/docs/editor/codebasics#_folding)

    === ":material-language-markdown: Markdown"

        ```md title="Markdown"
        <!-- #region -->
        ...
        <!-- #endregion -->
        ```

    === ":material-language-csharp: C#"

        ```csharp title="C#"
        #region 
        ...
        #endregion
        ```

    === ":material-language-python: Python"

        ```python title="Python"
        #region
        ...
        #endregion
        ```

-   #### :material-content-cut:{ .lg .middle } Snippets

    ---

    Snippets are stored under the configuration path in json files named after each language.

    === ":material-language-markdown: Markdown"

        ```json
        {
            "YouTube": {
                "prefix": "youtube",
                "body": [
                    "<iframe width=\"1095\" height=\"596\" src=\"${1:https://www.youtube.com/embed/}\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>",
                ],
                "description": "YouTube video embed"
            },
            "Mermaid" : {
                "prefix": "node",
                "body": [
                    "${1:Identifier}[\"<a href=\"${3:https://link}\">${2:Label text}</a>\"]"
                ],
                "description": "Mermaid flowchart node with link"
            },
            "Audio": {
                "prefix": "audio",
                "body": ["<audio controls=\"controls\"><source type=\"audio/mp4\" src=\"${1:filename.m4a}\"></audio>"]
            },
            "Include": {
                "prefix": "include",
                "body": ["--8<-- \"includes/${1:filename.md}\""]
            }
        }
        ```

-   #### Appearance

    ---

    **Quick suggestions** is a feature of [Intellisense](https://code.visualstudio.com/docs/editor/intellisense) that offers spelling suggestions even in plain text files.

    ```json title="Disable quick suggestions"
    "editor.quickSuggestions": { // (1)
        "other": "off"
    },
    ```

    ---

    ```json title="Activity bar background (material yellow)"
    {
        "workbench.colorCustomizations": {
            "activityBar.background": "#FFEB3B",
            "activityBar.foreground": "#000000",
            "activityBar.inactiveForeground": "#00000066",
        }
    }
    ```

    ---

    ```json title="Disable minimap and bread crumbs"
    "editor.minimap.enabled": false,
    "breadcrumbs.enabled": false,
    ```

-   #### :octicons-terminal-16:{ .lg .middle } Terminal

    ---

    The shells available in the integrated terminal for any OS can be adjusted using **terminal.integrated.profiles**

    ```json title="Developer PowerShell for VS 2022"
    "terminal.integrated.profiles.windows": {
        "Developer PowerShell for VS 2022": {
            "source": "PowerShell",
            "args": ["-NoExit", "-Command","&{Import-Module \"C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\Common7\\Tools\\Microsoft.VisualStudio.DevShell.dll\"; Enter-VsDevShell 1916cd63}"],
            "icon": "terminal-powershell",
        }
    ```

    [Fix](https://github.com/flathub/com.visualstudio.code/issues/370) for multiple warnings reading preload-host-spawn-strategy in Flatpak installation

    ```json
    "terminal.integrated.env.linux": {
        "LD_PRELOAD": null,
    },
    ```

</div>

#### Tasks

```json title="Build task for running make"
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Run make",
            "type": "shell",
            "command": "make",
            "problemMatcher": [],
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "presentation": { // (1)
                "reveal": "always",
                "focus": false,
                "panel": "shared",
                "showReuseMessage": true,
                "close": true
            }
        }
    ]
}
```

1. The [**presentation**](https://code.visualstudio.com/docs/editor/tasks#_output-behavior) property of a task controls how the Integrated Terminal behaves when running it.

External automation tools like linting, building, packaging, or deployment applications that are typically used from the command-line can be controlled using [**tasks**](https://code.visualstudio.com/docs/editor/tasks#vscode), configured within a workspace from **.vscode/tasks.json**.

A new task can be created from the menu ++ctrl+shift+p++ and pressing **Tasks: Configure task**.
This opens tasks.json if it exists or prompt to create one from a template if not.

If a task is configured as the default, then pressing ++ctrl+shift+b++ will run it.
