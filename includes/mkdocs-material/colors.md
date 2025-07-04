A [custom primary color](https://squidfunk.github.io/mkdocs-material/setup/changing-the-colors/#custom-colors) can be set by first setting the **primary** palette color to "custom" and 
defining the CSS variable in a custom stylesheet that is referenced in the config under **extra\_css**

=== "mkdocs.yml"

    ```yaml
    theme:
      palette:
        primary: custom
    # ...
    extra_css:
    - stylesheets/extra.css
    ```

=== "docs/stylesheets/extra.css"

    ```css
    :root {
      --md-primary-fg-color:        #311B92;
    }
    ```

A [named color scheme](https://squidfunk.github.io/mkdocs-material/setup/changing-the-colors/#custom-color-schemes) can be created by wrapping the definitions in an attribute selector named after **`[data-mdcolor-scheme="..."]`**:

```css title="YouTube color scheme"
[data-md-color-scheme="youtube"] {
  --md-primary-fg-color:        #EE0F0F;
  --md-primary-fg-color--light: #ECB7B7;
  --md-primary-fg-color--dark:  #90030C;
}
```

