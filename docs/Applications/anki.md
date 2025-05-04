# Anki

Anki's collections are [stored](https://docs.ankiweb.net/files.html) in various locations based on operating system and package manager.
The flatpak data is stored at **$HOME/.var/app/net.ankiweb.Anki/data/Anki2**.
Each Anki user has a subdirectory named after it at this location.

<div class="grid cards" markdown>

-   [**Close deletions**](https://docs.ankiweb.net/templates/fields.html#checking-your-answer)

    ---

    ``` title="Front and Back Templates"
    {{cloze:Text}}
    {{type:cloze:Text}}
    ```

    Make the cloze placeholder more prominent

    ```css
    .cloze {
      border: 4px yellow dashed;
    }
    ```

-   **Syntax highlighting**

    ---

    First download a [custom build of highlightjs](https://highlightjs.org/download) (1) including the languages that must be highlighted.
    The resulting zip must be decompressed and placed in the collection's media folder, so that not only the script but also the stylesheet are available.
    {: .annotate }

    1.  [googlearchive/code-prettify](https://github.com/googlearchive/code-prettify) used to be usable but has been archived since 2020.

        ```html title="Template"
        <script src="run_prettify.js"></script>
        ```

        ```html title="Card"
        <pre class="prettyprint"> ... </pre>
        ```


    ```html title="Template"
    <link rel="stylesheet" href="styles/default.css">
    <script src="highlight.min.js"></script>
    <script>hljs.highlightAll();</script>
    ```

    ```html title="Card"
    <pre>
        <code class="language-python">
        ...
        </code>
    </pre>
    ```

</div>
