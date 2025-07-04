Cloning the [emoji search bar](https://squidfunk.github.io/mkdocs-material/reference/icons-emojis/) found in the official documentation is not easy.

Somebody [figured out](https://github.com/squidfunk/mkdocs-material/discussions/2822) that you have to clone the contents of [**material/overrides/assets**](https://github.com/squidfunk/mkdocs-material/tree/master/material/overrides/assets) from the official repository and then incorporate those files as custom JS and CSS.

```yaml title="mkdocs.yaml"
theme:
  name: material
  custom_dir: overrides
extra_javascript:
  - assets/javascripts/custom.129bd6ad.min.js
extra_css:
  - assets/stylesheets/custom.00c04c01.min.css
```

The actual code for the search bar does not play well within [grid cards](#grids):

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

