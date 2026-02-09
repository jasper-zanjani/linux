# Inspect an image
identify image.png 
# => image.png PNG 554x1470 554x1470+0+0 16-bit Grayscale Gray 99444B 0.000u 0:00.000

# Display the format of an image
identify -format "%w x %h" $FILE

# Resize multiple images
mogrify -resize "1920x1200" -write $FILE1 $FILE2

# Save the output of a command as an image
neofetch | convert label:@- image.png

convert logo.png -resize 144x144 -background transparent -gravity center -extent 144x144 logo_resized.png