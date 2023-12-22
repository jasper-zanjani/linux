yt-dlp --external-downloader aria2c -f 140 --write-thumbnail --embed-chapters --embed-metadata \
    -o "Kevin Samuels %(upload_date>%Y-%m-%d)s [%(id)s].%(ext)s"            \
    --parse-metadata "%(upload_date>%Y-%m-%d)s - %(title)s:%(meta_title)s"  \
    --parse-metadata "%(upload_date>%Y-%m)s:%(meta_album)s"                 \
    --parse-metadata "%(upload_date>%Y)s:%(meta_date)s" $URL
