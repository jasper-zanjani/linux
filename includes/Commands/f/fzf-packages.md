Create a two-pane view using fzf to display details on any installed package

=== ":material-arch: Arch"

    ```sh
    pacman -Slq | 
        fzf --reverse --preview 'pacman -Si {}' 
    
    # Hitting enter will open more details in a pager.
    pacman -Qq | 
        fzf --reverse --preview 'pacman -Qil {}'  \
            --bind 'enter:execute(pacman -Qil {} | less)'
    
    # Implement caching in a random /tmp directory on results
    WORKDIR="/tmp/$(date +%s)"
    mkdir $WORKDIR
    pacman -Qq | 
        fzf --reverse --bind "enter:execute(cat $WORKDIR/{})" \
            --preview "test -f $WORKDIR/{} || pacman -Qil {} > $WORKDIR/{}; cat $WORKDIR/{}" \
    ```

=== ":material-fedora: Fedora"

    ```sh
    dnf list --installed | awk 'NR>1 { print $1 }' |
        fzf --reverse --preview 'dnf info {}'
    ```