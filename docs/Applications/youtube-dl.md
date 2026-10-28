#### yt-dlp

!!! tip "Representative usage"

    Download using Firefox cookies and external downloader

    ```sh
    FILENAME='Baddies Caribbean 01 - We Outside Tonight.%(ext)s'
    FORMAT='hls-fastly_skyfire-5632+hls-fastly_skyfire-audio-high-English'
    URL="https://www.thezeusnetwork.com/baddies-caribbean/season:1/videos/series-premiere-baddies-caribbean-we-outside-tonight"

    yt-dlp -o $FILENAME $URL -f $FORMAT
        --cookies-from-browser firefox \
        --external-downloader aria2c \
        --continue
    ```


```sh
# Use an external downloader to download a high-quality audio file, saving the thumbnail separately (after converting it to png).
yt-dlp --external-downloader aria2c -f 140 --write-thumbnail --convert-thumbnails png --embed-metadata $URL

# Run speech normalization and incorporate a thumbnail downloaded as webp, converting it to png,
# providing additional metadata.
ffmpeg -i $INPUT -i $THUMBNAIL -af speechnorm -c:v png -disposition:v attached_pic \
    -metadata "title=$TITLE" -metadata "album=$ALBUM" -metadata "artist=$ARTIST" -metadata "date=$YEAR" \
    $OUTPUT
```

```sh
yt-dlp --external-downloader aria2c -f 140 --write-thumbnail $URL
yt-dlp --external-download

# Set filename
INPUT='...'

ffmpeg -i $INPUT.m4a 
```

```sh
--8<-- "includes/Commands/y/yt-dlp.sh"
```

Metadata can be specified and changed using **--parse-metadata** with a bizarre and poorly documented **FROM:TO** syntax in the argument.
This syntax is counterintuitive because the field to be written to is actually the second term in the argument.
Furthermore the field names to be written to are actually prefixed with **meta\_**.


```sh
# Set the release date to the year of the upload date (i.e. "2022")
%(upload_date>%Y)s:%(meta_date)s

# Set the album name to the year and month of the upload date (i.e. "2022-03")
%(upload_date>%Y-%m)s:%(meta_album)s

--8<-- "includes/Commands/y/yt-dlp-metadata.sh"
```

##### Authentication

```sh
# Use Firefox cookies to authenticate
yt-dlp https://x.com/nicoledupapill1/status/1669291270320037888 --cookies-from-browser firefox
```

##### Streaming

Some sites do not have a dedicated site extractor, meaning they are not natively supported by yt-dlp.
However, using a browser to extract the direct stream link to copy the **m3u8** URL allows the feed to be captured if they use HLS (HTTP Live Streaming).

```sh
yt-dlp --downloader ffmpeg --hls-use-mpegts $M3U8_URL
```
