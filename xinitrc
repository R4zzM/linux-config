# Read settings to X database
xrdb -merge ~/.Xresources

# Set US International Keyboard
setxkbmap -rules evdev -model evdev -layout us -variant intl

# Filter CAPS LOCK key
setxkbmap -option caps:none

# Start the window manager
exec awesome
