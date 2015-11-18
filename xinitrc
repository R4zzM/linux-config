# Read settings to X database
xrdb -merge ~/.Xresources

# Use two screens
# xrandr --output HDMI2 --left-of HDMI1

# Set US International Keyboard with CAPS LOCK disabled
setxkbmap -layout us -variant altgr-intl -option nodeadkeys,caps:none

# Start the window manager
exec awesome
