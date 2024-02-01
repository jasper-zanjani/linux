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

On a fresh install of Fedora 39, many **videos in Twitter and Reddit were not playing**.
This is [apparently due](https://www.reddit.com/r/firefox/comments/w68e0i/issues_with_video_playback_on_twitter_and_reddit/) to a dependency on ffmpeg.

```sh
dnf install ffmpeg-free
```