# Anki

Anki's collections are [stored](https://docs.ankiweb.net/files.html) in various locations based on operating system and package manager.
The flatpak data is stored at **$HOME/.var/app/net.ankiweb.Anki/data/Anki2**.
Each Anki user has a subdirectory named after it at this location.

#### Syntax highlighting

<div class="grid cards" markdown>

-   [**highlight.js**](https://highlightjs.org/) 

    ---

    First download a [custom build](https://highlightjs.org/download) including the languages that must be highlighted.
    The resulting zip must be decompressed and placed in the collection's media folder.

    ```html
    <link rel="stylesheet" href="/path/to/styles/default.css">
    <script src="/path/to/highlight.min.js"></script>
    <script>hljs.highlightAll();</script>
    ```

    Each code snippet's class is named after its language:

    ```html
    <pre>
        <code class="language-python">
        ...
        </code>
    </pre>
    ```

-   [**code-prettify**](https://github.com/googlearchive/code-prettify)

    ---

    This used to be usable but has been archived since 2020.

    ```html
    <script src="run_prettify.js"></script>
    ```

    ```html
    <pre class="prettyprint"> ... </pre>
    ```

</div>

#### Styling

Make the cloze placeholder more prominent

```css
.cloze {
  border: 4px yellow dashed;
}
```
