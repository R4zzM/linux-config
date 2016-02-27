# Read settings to X database
xrdb -I$HOME ~/.Xresources

# Set US International Keyboard with CAPS LOCK disabled
setxkbmap -layout us -variant altgr-intl -option nodeadkeys
# setxkbmap -option ctrl:nocaps

# Turn of the horrible bell
xset bell off

# Start the window manager
exec awesome
