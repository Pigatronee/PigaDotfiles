#!/usr/bin/env bash

# Get the wallpaper path from Waypaper
WALL="$1"

# Run pywal to generate colors
wal -i "$WALL" --vte &

# Reload waybar if you use it
pkill -USR1 waybar 2>/dev/null

# Reload GTK (if you use nwg-look or pywal-gtk)
# wal-gtk --theme /home/Pigatronee/.cache/wal/colors.json &

# Reload shell colors (useful for Alacritty, Kitty, etc.)
source ~/.cache/wal/colors.sh
