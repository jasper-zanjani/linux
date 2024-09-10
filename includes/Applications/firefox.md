Firefox 

``

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

#### Developer tools

<div class="grid cards" markdown>

-   #### Cookies

    ---

    Firefox will display information about profiles at [about:profiles](about:profiles), and allow easy navigation to the profile directory with a button.
    On a typical Linux installation this will be under **$HOME/.mozilla/firefox** and each profile folder will have a name beginning with an eight-character alphanumeric string followed by **.default-release** or **.default**.

    Cookies are stored in a sqlite3 database named **cookies.sqlite3** under the profile directory.

    ```sqlite3
    SELECT * FROM moz_cookies WHERE host LIKE "%google%";
    ```

    [Cookies.txt](https://addons.mozilla.org/en-US/firefox/addon/cookies-txt/) is a useful extension that allows export of these cookies (for the entire database or for a particular site) to the Netscape text-based format used by other utilities like curl and wget.

-   #### Network

    ---

    The network tab can be used to retrieve an authorization token from the request header of a logged-in webapp, like [Discord](https://github.com/diamondburned/dissent).

</div>