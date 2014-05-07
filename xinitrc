# Read settings to X database
xrdb -merge ~/.Xresources

# Set US International Keyboard with CAPS LOCK disabled
setxkbmap -layout us -variant altgr-intl -option nodeadkeys,caps:none

# Start the window manager
exec awesome
