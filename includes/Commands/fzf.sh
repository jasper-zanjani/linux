# Create a two-pane view using fzf to display details on any available Arch package
pacman -Slq | fzf --preview 'pacman -Si {}' --layout=reverse


# Create a two-pane view using fzf to display details on installed Arch packages.
# Hitting enter will open the details in a less session.
pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'