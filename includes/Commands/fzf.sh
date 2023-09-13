# Create a two-pane view using fzf to display details on any available Arch package
pacman -Slq | fzf --preview 'pacman -Si {}' --layout=reverse


# Create a two-pane view using fzf --preview 
# Display details on installed Arch packages. Hitting enter will open the details in a less session.
pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'

# Browse source code of all bash scripts in /usr/bin. Pressing enter will open an elevated Vim session to edit the script
file /usr/bin/* | sed -n '/Bourne/p' | cut --delimiter=: --fields=1 | fzf --layout=reverse --preview 'bat {}' --bind 'enter:become(sudo vim {})'
