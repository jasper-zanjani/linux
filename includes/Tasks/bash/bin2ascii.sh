bin2ascii() {
    while [[ ! -z $1 ]]; do 
        printf "\\$(printf %o "$((2#$1))")"
        shift
    done
    printf '\n'
}
