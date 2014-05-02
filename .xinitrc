# Read settings
xrdb -merge ~/.Xresources

# Start dropbox daemon
dropboxd &

# Start the window manager
exec awesome
