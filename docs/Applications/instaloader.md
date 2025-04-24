# Instaloader

```sh
# After running once, instaloader will save the session cookie found in the specified browser
# The session is saved as a binary file under $HOME/.config/instaloader
instaloader -b firefox
         # --load-cookies $BROWSER_NAME

# The saved session can then be used to pull content
instaloader --login $SESSION profile $PROFILE_NAME
```
