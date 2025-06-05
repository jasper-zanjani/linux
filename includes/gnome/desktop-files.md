File associations are stored in .desktop files stored in **/usr/share/applications/**. 
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

