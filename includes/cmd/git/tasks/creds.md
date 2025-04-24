Once an access token has been generated in a git provider like GitHub, it must be entered as the password.


If the [**credential store**](https://git-scm.com/docs/git-credential-store) has been enabled, credentials can be stored on-disk. (1)
{: .annotate }

1. 
    ```ini title=".gitconfig"
    [credential]
      helper = store
    ```

These credentials are stored in plaintext at **~/.git-credentials**.
If the token expires and must be changed, this file must be deleted before git will prompt for the new password again.
