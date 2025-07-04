[Audio clips](https://github.com/squidfunk/mkdocs-material/discussions/4149) require the `md_in_html` extension.

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

