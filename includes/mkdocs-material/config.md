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

