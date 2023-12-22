function normalize
    for FILE in (command ls -I "*-normalized.m4a" -I "*.webp") 
        set INPUT (string replace .m4a "" $FILE)
        if test -f $INPUT-normalized.m4a
            echo $INPUT-normalized.m4a already exists!
        else
            ffmpeg -hide_banner -i $INPUT.m4a -i $INPUT.webp -c:v png -disposition:v attached_pic -af speechnorm -metadata genre="Podcast" $INPUT-normalized.m4a 
        end
    end
end
