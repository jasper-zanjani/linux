# Create a two-pane view using fzf to display details on any installed package
## Arch
pacman -Slq | fzf --layout=reverse --preview 'pacman -Si {}' 

## Fedora, using awk to remove extraneous output
dnf list --installed | awk 'NR>1 { print $1 }' | fzf --layout=reverse --preview 'dnf info {}'

# Display details on installed Arch packages. Hitting enter will open the details in a less session.
pacman -Qq | fzf --layout=reverse --preview 'pacman -Qil {}'  --bind 'enter:execute(pacman -Qil {} | less)'

# Implement caching in a random /tmp directory on results
set TWOPANESWORKDIR "/tmp/$(date +%s)"; mkdir $TWOPANESWORKDIR
pacman -Qq | fzf --layout=reverse --preview "test -f $TWOPANESWORKDIR/{} || pacman -Qil {} > $TWOPANESWORKDIR/{}; cat $TWOPANESWORKDIR/{}" --bind "enter:execute(cat $TWOPANESWORKDIR/{})"

# Browse source code of all bash scripts in /usr/bin. 
# Pressing enter will open an elevated Vim session to edit the script
file /usr/bin/* | sed -n '/Bourne/p' | cut --delimiter=: --fields=1 | fzf --layout=reverse --preview 'bat {}' --bind 'enter:become(sudo vim {})'

