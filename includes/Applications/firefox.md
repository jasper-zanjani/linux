Firefox Reader Mode styling can be customized.

```css
@-moz-document url-prefix("about:reader") {
  body.sans-serif {
    font-family: "Roboto", sans-serif !important;
  }
  pre {
    font-family: "Noto Sans Mono" !important;
    color: lightyellow !important;
    margin-left: 1em !important;
  }
}
```