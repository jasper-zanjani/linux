# Change resolution of DisplayPort1 to 1920x1080
xrandr --output DP1 --mode 1920x1080

# Disable VGA1 output
xrandr --output VGA1 --off

# Display current state of the system
xrandr -q  --query