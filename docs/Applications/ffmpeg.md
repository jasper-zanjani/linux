# ffmpeg

??? info "Installation on Fedora"

    Although a free version of ffmpeg is available in Fedora's repos (as **ffmpeg-free**), it is hamstrung by the lack of proprietary codecs.

    The full ffmpeg must be installed from RPM Fusion repos.

    ```sh
    sudo dnf swap ffmpeg-free ffmpeg --allowerasing
    ```


**ffmpeg** is most often used to convert file formats for media from the command-line.

```sh
# Convert mp3 to m4a
ffmpeg -i file.mp3 file.m4a

# Convert file specified in a variable
ffmpeg -i "$FILE" "${FILE/mp3/m4a}"

# Convert video mp4 to audio-only mp4 in the working directory
ffmpeg -i "$FILE" -vn "$(basename $FILE)"
```

When multiple input files are fed to ffmpeg, they are identified by their 0-based index, reflecting the order of invocation.
Options generally apply to the next specified file, so order of options is significant and the same option can appear multiple times.

[**Stream specifiers**](https://www.ffmpeg.org/ffmpeg.html#Stream-specifiers-1) are colon-delimited strings that are appended to the option name

```sh
# Copy all streams without reencoding
-codec copy

# Select the ac3 codec for the second audio stream
-codec:a:1 ac3
```

In [**automatic stream selection**](https://www.ffmpeg.org/ffmpeg.html#Examples), ffmpeg will prioritize the highest resolution for video streams and the highest number of channels for audio streams.

The [**-map**](https://www.ffmpeg.org/ffmpeg.html#Stream-selection) option allows manual control of stream selection.
When this option is used, only streams exclusively mapped are included in the output file.

```sh
# Use automatic stream selection for out1.mkv and out2.wav.
# But out3.mov will contained the user-mapped streams specified (all audio streams from the second input file)
ffmpeg -i A.avi -i B.mp4 out1.mkv out2.wav -map 1:a -c:a copy out3.mov
```

#### Adding a thumbnail
:   

    Adding a thumbnail is based on passing the (undocumented) **attached\_pic** argument to **-disposition**, targeting the image input file with a stream specifier.

    ```sh
    # Add a thumbnail to an audio stream
    ffmpeg -i audio.m4a -i image.png -c copy -disposition:v:0 attached_pic output.m4a

    # Due to automatic stream selection, -map must be used if a thumbnail is being added to a 
    # video stream, because only the highest resolution video stream will be selected otherwise.
    ffmpeg -i video.mp4 -i audio.m4a -i thumb.png -map 0 -map 1 -map 2 -c copy -disposition:v:1 attached_pic output.mp4

    # From documentation, add thumbnail to a video, re-encoding it as PNG
    ffmpeg -i in.mp4 -i IMAGE -map 0 -map 1 -c copy -c:v:1 png -disposition:v:1 attached_pic out.mp4

    # Add thumbnail to a file while also running speech normalization on the audio stream
    ffmpeg -i $FILE -i $THUMBNAIL -af speechnorm -c:v png -disposition:v attached_pic $OUTPUT
    ```

#### Specify metadata
:   

    [Metadata](https://wiki.multimedia.cx/index.php/FFmpeg_Metadata) is defined as key/value pairs, although not all formats support all metadata.
    This example adds metadata but does not reencode the input file.

    ```sh
    # Display metadata
    ffmpeg -hide_banner -i $INPUT
    ffprobe $INPUT

    # Add metadata but do not re-encode the input file
    ffmpeg -i $FILE -metadata title=$TITLE -metadata year=$YEAR -codec copy $OUTPUTFILE

    # Tag all audio in a directory, not re-encoding
    for FILE in $(ls *.mp3);
    do
        ffmpeg -i "$FILE" -c copy -metadata genre=Amapiano "${FILE/.mp3/_tagged.mp3}"
    done
    ```

#### Concatenate files
:   
    It is possible to combine many files into one.
    The canonical way of doing this is by first assembling a list of filenames.
    These must appear in a specific [format](https://trac.ffmpeg.org/wiki/Concatenate):

    ```sh
    file 'file1.mp3'
    file 'file2.mp3'
    # etc...
    ```

    This can be done quickly by piping the output of **ls** to a file, then editing it manually.

    ```sh
    echo $(ls -1 *.mp3) > files
    ```

    Then this file can be used by ffmpeg, specifying the **concat** demuxer as the argument to **-f**

    ```sh
    ffmpeg -f concat -i files -c copy compilation.mp3
    ```

    Chapters will be accepted with the right container (apparently not mp3).
    Note that mp3 files cannot be placed into a m4a container without re-encoding.
    Also note that the **-map_metadata** option must be specified **after** the second infile, because its argument refers to the second infile as if it were zero-indexed.

    ```sh
    ffmpeg -f concat -i files -i chapters -map_metadata 1 -c copy compilation.m4a
    ```

#### Codecs
:   

    ```sh
    # Display all supported codecs
    ffmpeg -codecs
    ```

    Some codecs like libx264 support various [profiles](https://en.wikipedia.org/wiki/Advanced_Video_Coding#Profiles), which can be [selected](https://superuser.com/questions/563997/how-can-i-set-a-h-264-profile-level-with-ffmpeg) from the command-line.

    ```sh
    # Reencode a media file using a different profile
    ffmpeg -i $INPUT -c:v h264 -profile:v high
    ```

    In fact, there can be multiple encoders for any specified codec, which functions as an alias.

    ```sh
    # Display encoders for H.264 codec
    ffmpeg -codecs | grep h264 # (1)

    # Display more detailed information about H.264 encoders
    ffmpeg -h encoder=h264
    ```

    1. 
    ``` title="Output"
    --8<-- "includes/Output/ffmpeg-codecs-grep-h264
    ```

    ??? info "Codecs"

        **H.264**, or [**Advanced Video Coding**](https://en.wikipedia.org/wiki/Advanced_Video_Coding) (AVC), is one of a line of video compression standards adopted by the International Telecommunications Union.

        [**x264**](https://en.wikipedia.org/wiki/X264) is an open-source library developed by VideoLAN, the developers of VLC.

        [**High Efficiency Video Coding**](https://en.wikipedia.org/wiki/High_Efficiency_Video_Coding) (**HEVC**) also known as H.265 is a video compression standard developed as a collaboration between multiple industries.
        The first version of the standard was ratified in 2013.
        Prohibitively expensive licensing fees led to the development of the alternative video coding format AV1 in 2018.

        [**Video Acceleration API**](https://en.wikipedia.org/wiki/Video_Acceleration_API) (**VA-API**) is an open-source API that allows applications like VLC or GStreamer to take advantage of hardware acceleration capabilities.
        It is implemented by the **libva** library.
        Historically, it originated as an Intel project to support their [Graphics Media Accelerator (GMA)](https://en.wikipedia.org/wiki/Intel_GMA) series of integrated graphics processors on Unix-like systems.

#### Filters
:   

    Various [filters](https://ffmpeg.org/ffmpeg-filters.html) are provided as arguments to **-af**/**-vf**/**-filter** or **-filter\_complex**.

    ```sh
    # Normalize for speech audio
    ffmpeg -i $INPUT -af "speechnorm" $OUTPUT

    # For a container that contains more than an audio stream.
    ffmpeg -i $INPUT -af speechnorm -c:v copy $OUTPUT
    ```

    More complicated chains of filters, called **filtergraphs**, are specified using a [complicated syntax](https://ffmpeg.org/ffmpeg-filters.html#Filtergraph-syntax-1) within the **filtergraph description**.
    A filtergraph is a directed graph of connected filters.

    The [**graph2dot**](https://ffmpeg.org/ffmpeg-filters.html#graph2dot) tools is mentioned in ffmpeg documentation as being able to generate a visual representation of the filtergraph description, but it doesn't seem to be available from repos.

    ??? info "Resources"

        <iframe width="1095" height="596" src="https://www.youtube.com/embed/MPV7JXTWPWI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

        ```sh
        ffmpeg -i $INPUT -af volume=2 $OUTPUT

        # Map left input audio channel to both output channels
        ffmpeg -i $INPUT -af "channelmap=0-0|0-1" $OUTPUT

        # Specify 640x480 window and position of top left corner
        ffmpeg -i $INPUT -vf "crop=w=640:h=480:x=100:y=200" $OUTPUT

        # Scale video to new resolution
        ffmpeg -i $INPUT -vf "scale=w=640:h=480" $OUTPUT

        # Use proportional scaling, providing -1 to one dimension
        ffmpeg -i $INPUT -vf "scale=w=852:h=-1"

        # Rotate 45° clockwise (angle is specified in radians)
        ffmpeg -i $INPUT -vf "rotate=45*PI/180" $OUTPU
        ```
