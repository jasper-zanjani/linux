# VS Code

Configuration file locations:

| Installation | Path                                                  |
| ------------ | ----------------------------------------------------- |
| flatpak      | $HOME/.var/app/com.visualstudio.code/config/Code/User |


??? info "config"

    - How did I resolve the bizarre shell accessibility issues with the flatpak install?

## Configuration

#### Appearance
:   

    ```json title="Disable minimap and bread crumbs"
    "editor.minimap.enabled": false,
    "breadcrumbs.enabled": false,
    ```

    Quick suggestions appears to be a feature of [**Intellisense**](https://code.visualstudio.com/docs/editor/intellisense) which offers spelling suggestions even in
    plain text files.

    ```json title="Disable quick suggestions"
    "editor.quickSuggestions": {
        "other": "off"
    },
    ```

    ```json title="Activity bar background"
    "workbench.colorCustomizations": {
        "activityBar.background": "#8a6d17"
    }
    ```

#### Folding
:   
    Code can be folded by placing [markers in comments](https://code.visualstudio.com/docs/editor/codebasics#_folding)

    ```md title="Markdown"
    <!-- #region -->
    ...
    <!-- #endregion -->
    ```

    ```csharp title="C#"
    #region 
    ...
    #endregion
    ```

    ```python title="Python"
    #region
    ...
    #endregion
    ```


[Snippets](https://code.visualstudio.com/docs/editor/userdefinedsnippets)

"Editor group" refers to window panes.

| Keyboard shortcut            | Setting                                       | Description                      |
| ---------------------------- | --------------------------------------------- | -------------------------------- |
| ++ctrl+\\++                  | `workbench.action.splitEditor`                | Split Editor                     |
| ++Ctrl+k+Ctrl+UpArrow++      | `workbench.action.focusAboveGroup`            | View: Focus Above Editor Group   |
| ++Ctrl+k+Ctrl+RightArrow++   | `workbench.action.focusRightGroup`            | View: Focus Right Editor Group   |
| ++Ctrl+k+Ctrl+DownArrow++    | `workbench.action.focusBelowGroup`            | View: Focus Below Editor Group   |
| ++Ctrl+k+Ctrl+LeftArrow++    | `workbench.action.focusLeftGroup`             | View: Focus Left Editor Group    |
| ++Ctrl+k+UpArrow++           | `workbench.action.moveActiveEditorGroupUp`    | View: Move Editor Group Up       |
| ++Ctrl+k+RightArrow++        | `workbench.action.moveActiveEditorGroupRight` | View: Move Editor Group Right    |
| ++Ctrl+k+DownArrow++         | `workbench.action.moveActiveEditorGroupDown`  | View: Move Editor Group Down     |
| ++Ctrl+k+LeftArrow++         | `workbench.action.moveActiveEditorGroupLeft`  | View: Move Editor Group Left     |
| ++Alt+UpArrow++              | `editor.action.moveLinesUpAction`             | Move line up                     |
| ++Alt+DownArrow++            | `editor.action.moveLinesDownAction`           | Move line down                   |
| ++Option+Command+DownArrow++ |                                               | Add a cursor down                |
| ++Option+Command+UpArrow++   |                                               | Add a cursor up                  |
| ++Option+Shift+Left Click++  |                                               | Click and drag to add cursors    |
| ++Ctrl+Shift+5++             |                                               | Terminal: Split terminal         |
| ++Ctrl+h++                   |                                               | Replace                          |
| ++Ctrl+l++                   |                                               | Expand line selection            |
| ++Ctrl+j++                   | `workbench.action.togglePanel`                | View: Toggle Panel               |
| ++Ctrl+b++                   |                                               | View: Toggle Side Bar Visibility |

#### Terminal
:   
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

