## Run neofetch if session is interactive
if status --is-interactive && type -q neofetch
   neofetch
end