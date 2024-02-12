**gsettings** is the CLI frontend intended to support changes to GNOME application settings, stored in [dconf](#dconf) databases.

```sh
# Display path to current background image (when using dark mode)
gsettings get org.gnome.desktop.background picture-uri-dark

# Watch changes to the given schema's values
gsettings monitor org.gnome.desktop.background
```


```sh title="Examples"
# Change function of Caps Lock
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_modifier']"

# Change mouse cursor size to various sizes. This can also be done in GNOME as Settings > Accessibility
gsettings set org.gnome.desktop.interface cursor-size 24 # (1)

# Enable GTK Inspector
gsettings set org.gtk.Settings.Debug enable-inspector-keybinding true # (2)

# Tweak window bar buttons in GNOME
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'
```

1. Valid sizes include 24, 32, 48, 64, and 96
2. Can be run with ++ctrl+shift+d++

The key that stores custom keybindings is a **relocatable schema**

```sh title="Custom keybindings"
# Display custom keybindings
gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings # (1)
```

1. 
``` title="Output"
['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']
```

