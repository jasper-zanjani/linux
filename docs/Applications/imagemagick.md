# imagemagick

**imagemagick** is a suite of command-line utilities: 

- **identify** used to describe the format and characteristics of image files
- **mogrify** used to modify images in various ways, including resizing, cropping, applying filters, etc.
- **convert**

```sh
--8<-- "includes/Commands/i/imagemagick.sh"
``` 

## Tasks

<div class="grid cards" markdown>

-   #### Transparent background

    ---

    ```sh
    # Remove background color, replacing it with transparency
    magick convert $INPUT -transparent white $OUTPUT

    # Fuzz selection to allow antialiased pixels to be selected.
    magick convert $INPUT -fuzz 10% -transparent white $OUTPUT
    ```


</div>
