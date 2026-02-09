# imagemagick

!!! tip "geometry"

    --8<-- "includes/cmd/magick/geometry.md"

--8<-- "includes/cmd/magick/info.md"

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
