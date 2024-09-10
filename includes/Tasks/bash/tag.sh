#!/bin/bash
tag () {
    # First arg has to be a valid tag name.
    TAG=$1 ; shift 
    shopt -s nocasematch
    case $TAG in
        "amapiano")
            while [ $# -gt 0 ]
            do
               INPUTFILE="$1"
               ffmpeg -i "$INPUTFILE" -metadata genre=Amapiano -c copy "${INPUTFILE/./_tagged.}"
               shift
            done
            ;;
        *)
            echo "Invalid tag!"
            ;;
    esac
    shopt -u nocasematch
}
# A more useful and less brittle version of this 
# script may be possible using the getopts function
# to define a named parameter, rather than forcing 
# the first positional argument to be one of a number 
# of set values.
