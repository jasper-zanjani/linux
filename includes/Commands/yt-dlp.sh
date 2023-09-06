# Extract audio as MP3
yt-dlp $URL -x --audio-format mp3 

# Encode metadata
yt-dlp $URL --embed-metadata --parse-metadata "title:%(title)s" --parse-metadata "artist:%(meta_uploader)s"

# Download the highest quality stream in mp4 format
yt-dlp -f 'bestvideo[ext=mp4]+bestaudio' $URL

# Re-encode a video into mp4 and provide a filename
yt-dlp --recode-video mp4 -o '%(upload_date>%Y%m%d)s.mp4' $URL