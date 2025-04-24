# GNOME

!!! info "Reference"

    === ":material-keyboard: Keybindings"

        - ++alt++++f7++ Move window
        - ++alt++++f8++ Resize window

*[BLOB]: Binary Large Object

GTK3 attempted to get away from strong dependency on theming engines by introducing CSS stylesheets.
This was supposed to make application theming simple and portable.
In GTK4 you can choose either a theming engine or CSS stylesheets.

GNOME configurations and application settings are stored in **dconf** databases, key-based binary databases optimized for reads in GVDB format (GVariant Database file).
System database files are located in **/etc/dconf/db**.
These settings are stored in a tree of **keys**, **children**, and **values** grouped under **schemas** in a way analogous to the Windows Registry.

Schemas have filenames ending in **.gschema.xml** and are found at **/usr/share/glib-2.0/schemas**

Although GNOME settings are typically changed in the Settings app, or even GNOME Tweaks, in the background both of these applications make changes to the dconf databases.
These settings can be adjusted manually using a [variety of tools](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/using_the_desktop_environment_in_rhel_8/configuring-gnome-at-low-level_using-the-desktop-environment-in-rhel-8):

- **GSettings** is a high-level API for application settings that serves as the frontend for [dconf](#dconf) as well as a [CLI utility](#gsettings-1) for changing user settings.
- **dconf** is also a [CLI utility](#dconf) for reading and writing individual values or entire directories to and from a dconf database. 
Direct manipulation of dconf is discouraged, rather users and developers are encouraged to use [dconf-editor](#dconf-editor) or [gsettings](#gsettings).
- **dconf Editor** is a GUI application.


#### Relocatable schema
:   
    Some schemas are **relocatable**, meaning the same schema is used in an arbitrary number of instances.

    ```sh title="List relocatable schemas"
    gsettings list-relocatable-schemas
    ```

    A relocatable schema is one with [no path attribute](https://docs.gtk.org/gio/class.Settings.html#relocatable-schemas) specified on its `<schema>` element.


#### Keyfiles
:   
    Binary system database files are located in **/etc/dconf/db** and are named local, site, ibus, etc.
    **Keyfiles** are INI-format text files placed in directories named after these databases, i.e. **local.d**, **site.d**, **ibus.d**, etc that allow declarative GNOME configuration.

    A similar directory can be created for the user database, although it does not exist by default.

    ```sh
    mkdir ~/.config/dconf/user.d
    ```

    The group name in keyfiles references a [**GSettings schema ID**](https://developer.gnome.org/GSettings/).
    The value is expected in [**GVariant form**](https://docs.gtk.org/glib/gvariant-text-format.html)

    ```ini
    [org/gnome/desktop/input-sources]
    xkb-options=['terminate:ctrl_alt_bksp', 'compose:ralt']
    ```

    Is equivalent to:

    ```sh
    gsettings set org.gnome.desktop.input-sources xkb-options=['terminate:ctrl_alt_bksp', 'compose:ralt']
    ```

    **gsettings** or **dconf** can be used to localize which dconf schema and key correspond to a given setting.

    ```sh
    # Watch all databases for changes
    dconf watch /

    # Display all keys and values, allowing research by terms
    gsettings list-recursively | less

    # Monitor a given schema for changes made in the GUI
    gsettings monitor org.gnome.settings-daemon.plugins/media-keys
    ```

    Existing settings can be exported to a keyfile by piping the output of **dconf dump**.

    ```sh
    # Note that the schema ID must conclude with a slash
    dconf dump /org/gnome/desktop/background/

    # For relocatable schemas, the parent must be specified to capture the value of the key as well as the children
    dconf dump /org/gnome/settings-daemon/plugins/media-keys/
    ```

    Once a keyfile is created the dconf databases must be recompiled.

    ```sh
    # Specify the database to be recompiled
    dconf compile ~/.config/dconf/user ~/.config/dconf/user.d

    # Update all dconf settings
    sudo dconf update
    ```

    Note that this will remove any changes to GNOME settings made interactively since the previous compilation (i.e. all changes made to GNOME Settings and Tweaks).

    ??? info "Keyfiles"

        ```ini
        --8<-- "includes/Configs/dconf/00-configs"

        --8<-- "includes/Configs/dconf/01-shortcuts"

        --8<-- "includes/Configs/dconf/02-dash"

        --8<-- "includes/Configs/dconf/03-mouse"

        --8<-- "includes/Configs/dconf/04-input-sources"
        ```

#### dconf profile
:   
    A **dconf profile** is a list of the system's hardware and software configuration databases and typically stored at **/etc/dconf/profile** or **~/.config/dconf**.
    Each line specifies a separate dconf database which is loaded by the system: 
    
    - **user** is normally found at **~/.config/dconf**
    - System databases like **local** and **site** are found in **/etc/dconf/db/**.

    ```sh title="/etc/dconf/profile/user"
    service-db:keyfile/user # (1)
    user-db:user
    system-db:local
    system-db:site
    ```

    1. This line sets the **dconf keyfile backend**, required when home directories are mounted over NFS


#### GNOME keyring
:   
    --8<-- "includes/Applications/gnome-keyring.md"

#### Extensions
:   
    GNOME Extensions provide a variety of popular hacks and changes to the Shell.
    They are managed by [gnome-extensions-app](https://gitlab.gnome.org/GNOME/gnome-shell/-/tree/HEAD/subprojects/extensions-app) but they are typically added from the [GNOME Extensions website](https://extensions.gnome.org/) using a browser plugin.

    These extensions are added to **~/.local/share/gnome-shell/extensions**, but many of them can also be made available to all users by installing them using a package manager, in which case they are placed in **/usr/share/gnome-shell/extensions**.

    Extensions appear to be mostly JavaScript applications, so they can probably simply be git cloned into the respective directories as well.


## Tasks

#### Desktop background

Create a keyfile for the local database in **/etc/dconf/db/local.d/01-background**

```ini
[org/gnome/desktop/background]

picture-uri='file:///usr/local/share/backgrounds/wallpaper.jpg'
picture-options='scaled'
primary-color='000000'
secondary-color='FFFFFF'
```

#### Custom application shortcut

Custom shortcuts are stored in dconf using a ["relocatable schema"](https://wiki.ubuntu.com/Keybindings) which has three keys: **name**, **command**, and **binding**.

```sh
gsettings set org.gnome.setting-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0 name 'Terminal'

gsettings set org.gnome.setting-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0 binding '<Super>Enter'

gsettings set org.gnome.setting-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0 command '/usr/bin/gnome-terminal'
```

Note that this doesn't seem to work...

#### File associations

File associations are stored in **.desktop** files stored in **/usr/share/applications/**. 
These INI-format files store all kinds of metadata on installed applications, including names and keywords in all supported languages.
Filetypes are stored under the **MimeType** key as semicolon-delimited [MIME Types](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/desktop_migration_and_administration_guide/file_formats).

```ini
[Desktop Entry]
Type=Application
MimeType=application/x-newtype
Name=My Application 1
Exec=myapplication1
```

MIME Type descriptors as stored as XML files stored in **/usr/share/mime/packages/**:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/x-newtype">
    <comment>new mime type</comment>
    <glob pattern="*.xyz"/>
  </mime-type>
</mime-info>
```

#### File browser bookmarks

[Bookmarks](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/using_the_desktop_environment_in_rhel_8/managing-bookmarks-in-gnome_using-the-desktop-environment-in-rhel-8) are stored in a file in **~/.config/gtk-3.0/bookmarks**

```
--8<-- "includes/Configs/bookmarks"
```

#### Disable automatic suspend

```sh
# Login as gdm account
machinectl shell gdm@ /bin/bash

# Disable automatic suspend
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type nothing
```


## Applications


#### gsettings

--8<-- "includes/Commands/g/gsettings.md"



#### dconf
:   
    ```sh
    --8<-- "includes/Commands/d/dconf.sh"
    ```

#### gio
:   
    --8<-- "includes/Commands/g/gio.md"


#### notify-send
:   
    --8<-- "includes/Commands/n/notify-send.md"

