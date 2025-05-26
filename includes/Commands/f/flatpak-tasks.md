<div class="grid cards" markdown>

-   **Flathub repo**

    Flathub is the de facto Flatpak repo, but it must be added to flatpak installations manually.

    ```sh
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    # Confirming success
    flatpak remotes 
    ```

-   **GTK theme fix**

    Flatpak applications sometimes do not adopt the [system theme](https://itsfoss.com/flatpak-app-apply-theme/).
    First grant some or all applications access to the themes folder.
    Then apply the theme by setting the `GTK_THEME` environment variable.
    The value of this variable must be the folder name of a theme installed to the themes folder (typically **~/.themes**).

    ```sh
    # Retrieve current theme (removing quotes from output)
    THEME=$(gsettings get org.gnome.desktop.interface gtk-theme | tr -d "'")

    # Grant access to the themes folder
    flatpak override --filesystem=$HOME/.themes

    # Override theme
    flatpak override --env=GTK_THEME=$THEME
    ```

</div>

