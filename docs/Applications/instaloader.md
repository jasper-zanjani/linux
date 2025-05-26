# Instaloader

```sh
# After running once, instaloader will save the session cookie found in the specified browser
# The session is saved as a binary file under $HOME/.config/instaloader
instaloader -b firefox # (1)
         # --load-cookies $BROWSER_NAME

# The saved session can then be used to pull content
instaloader --login $SESSION profile $PROFILE_NAME
```

1.  [browser-cookie3](https://pypi.org/project/browser-cookie3/) is required.

    ```sh
    pip install browser-cookie3
    ```
