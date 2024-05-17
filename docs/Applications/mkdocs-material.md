# Mkdocs Material

--8<-- "includes/emoji-search.html"

<div class="grid cards" markdown>

-   #### Config

    ---

    ```yaml title="mkdocs.yml"
    site_name: Notes
    theme:
      name: material
      features:
      - content.code.annotate # (1)
      - content.code.copy # (7)
      palette:
        scheme: default
        primary: white
    markdown_extensions:
    - pymdownx.emoji: # (6)
        emoji_index: !!python/name:materialx.emoji.twemoji
        emoji_generator: !!python/name:materialx.emoji.to_svg
    - admonition
    - attr_list # (5)
    - md_in_html
    - pymdownx.snippets # (2)
    - pymdownx.details
    - pymdownx.tabbed: # (4)
      alternate_style: true
    - pymdownx.superfences: # (3)
      custom_fences:
      - name: mermaid
        class: mermaid
        format: !!python/name:pymdownx.superfences.fence_code_format
    ```

    1. This is a [code annotation](https://squidfunk.github.io/mkdocs-material/reference/code-blocks/?h=content+code+annotate#code-annotations)
    2. [Snippets](https://squidfunk.github.io/mkdocs-material/setup/extensions/python-markdown-extensions/?h=snippets#snippets) allow inclusions to be made from other files.
    3. [Superfences](https://squidfunk.github.io/mkdocs-material/setup/extensions/python-markdown-extensions/?h=snippets#superfences) allow code blocks to be palced inside tabs and admonitions.
    4. [Tabbed](https://squidfunk.github.io/mkdocs-material/setup/extensions/python-markdown-extensions/?h=snippets#tabbed) allows tabs. Note that the **alternate\_style** configuration is the only supported style and is required.
    5. [Attribute lists](https://squidfunk.github.io/mkdocs-material/setup/extensions/python-markdown/#attribute-lists) are necessary for [image alignment](https://squidfunk.github.io/mkdocs-material/reference/images/#image-alignment).
    6. [Supporting emoji](https://squidfunk.github.io/mkdocs-material/reference/icons-emojis/#emoji)
    7. [Copy button](https://squidfunk.github.io/mkdocs-material/reference/code-blocks/#code-copy-button) on code blocks.

-   #### Embedding media

    ---

    [Audio clips](https://github.com/squidfunk/mkdocs-material/discussions/4149) require the **md\_in\_html** extension.

    ```yaml title="mkdocs.yml"
    markdown_extensions:
    - md_in_html
    ```

    Keep in mind that the filename of the audio will be appended to the route of the current page.

    ```html 
    <audio controls="controls">
        <source type="audio/mp4" src="gabriela.m4a">
    </audio>
    ```

    Embedding YouTube clips involves the use of iframes.
    Note that this snippet has the correct width and height set for use in a mkdocs-material website.

    ```html
    <iframe width="1095" height="616" src="https://www.youtube.com/embed/ERWVSci3kO0?si=m3ntIYXAxYAvFuVN" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
    ```
    
-   #### Grids

    ---

    An unordered list placed within a **div.grid.cards** will be rendered as grid cards.

    ```html
    <div class="grid cards" markdown>

    -   Lorem ipsum...

    </div>
    ```

    Place markdown blocks within a div marked by the **grid** class to have each block takes its own grid space.

    ```html
    <div class="grid" markdown>

    </div>
    ```

-   #### Custom colors

    ---

    A [custom primary color](https://squidfunk.github.io/mkdocs-material/setup/changing-the-colors/#custom-colors) can be set by first setting the **primary** palette color to "custom":

    ```yaml
    theme:
      palette:
        primary: custom
    ```

    The CSS variable is then defined in a custom stylesheet:

    ```css title="docs/stylesheets/extra.css"
    :root {
      --md-primary-fg-color:        #311B92;
    }
    ```

    And the stylesheet is referenced in the configuration

    ```yaml title="mkdocs.yml"
    extra_css:
    - stylesheets/extra.css
    ```

    A [named color scheme](https://squidfunk.github.io/mkdocs-material/setup/changing-the-colors/#custom-color-schemes) can be created by wrapping the definitions in an attribute selector named after **`[data-mdcolor-scheme="..."]`**:

    ```css title="YouTube color scheme"
    [data-md-color-scheme="youtube"] {
      --md-primary-fg-color:        #EE0F0F;
      --md-primary-fg-color--light: #ECB7B7;
      --md-primary-fg-color--dark:  #90030C;
    }
    ```

-   #### Annotation width

    ---

    ```yaml title="mkdocs.yml"
    extra_css:
    - style/annotation-width.css
    ```

    ```css title="docs/style/annotation-width.css"
    :root { --md-tooltip-width: 600px; }
    ```

-   #### Print to PDF

    ---

    The somewhat outdated [mkdocs-pandoc-plugin](https://lab.gsi.upm.es/docs/mkdocs-material) [Python package](https://pypi.org/project/mkdocs-pandoc-plugin/) can be installed to export to PDF.

    ```yaml title="mkdocs.yml"
    plugins:
    - pandoc
    ```

-   #### Keyboard keys

    ---

    Adding [keyboard keys](https://squidfunk.github.io/mkdocs-material/reference/formatting/?h=key#adding-keyboard-keys) uses [pymdownx shortcodes](https://facelessuser.github.io/pymdown-extensions/extensions/keys/#extendingmodifying-key-map-index).

</div>

#### Emoji search bar

Cloning the [emoji search bar](https://squidfunk.github.io/mkdocs-material/reference/icons-emojis/) found in the official documentation is not easy.

A [Chinese guy](https://hantang.fun/blog/mkdocs-config-iconsearch/) [figured out](https://github.com/squidfunk/mkdocs-material/discussions/2822) that you have to clone the contents of [**material/overrides/assets**](https://github.com/squidfunk/mkdocs-material/tree/master/material/overrides/assets) from the official repository and then incorporate those files as custom JS and CSS.

```yaml title="mkdocs.yaml"
theme:
  name: material
  custom_dir: overrides
extra_javascript:
  - assets/javascripts/custom.129bd6ad.min.js
extra_css:
  - assets/stylesheets/custom.00c04c01.min.css
```

The actual code for the search bar does not play will in grid cards:

```html
<div class="mdx-iconsearch" data-mdx-component="iconsearch">
  <input
    class="md-input md-input--stretch mdx-iconsearch__input"
    placeholder="Search the icon and emoji database"
    data-mdx-component="iconsearch-query"
  />
  <div class="mdx-iconsearch-result" data-mdx-component="iconsearch-result">
    <div class="mdx-iconsearch-result__meta"></div>
    <ol class="mdx-iconsearch-result__list"></ol>
  </div>
</div>
```
