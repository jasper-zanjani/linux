# Extract audio as MP3
yt-dlp -x --audio-format mp3 $URL 

# Video and audio selections are combined with the plus (+) sign
# Formats can be filtered by placing conditions in brackets
yt-dlp -f 'best[height=720]'

# Download the highest quality stream in mp4 format
yt-dlp -f 'bestvideo[ext=mp4]+bestaudio' $URL

# Multiple filters must be placed in separate brackets
yt-dlp -f 'bestvideo[ext=mp4][height=720]+bestaudio[ext=m4a]' $URL


# Re-encode a video into mp4 and provide a filename
yt-dlp --recode-video mp4 -o '%(upload_date>%Y%m%d)s.mp4' $URL


# List extractors and exit
yt-dlp --list-extractors $URL

# Similar output, but provide a description for each extractor (if it exists)
yt-dlp --extractor-descriptions

# Interpret the title as "Artist - Title"
yt-dlp --parse-metadata 'title:%(artist)s - %(title)s'


# Encode metadata
yt-dlp --embed-metadata --parse-metadata "title:%(title)s" --parse-metadata "artist:%(meta_uploader)s" $URL 

