#!/bin/bash
#WALLPAPER_DIR=~/Pictures/Wallpaper
#INTERVAL=300  # time in seconds (5 minutes)

#FILE=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
#swww img "$FILE" 

#while true; do
#    FILE=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
#    swww img "$FILE" --transition-fps 144 --transition-type center --transition-duration 1.5
#    sleep "$INTERVAL"
#done

#!/bin/bash
# Random wallpaper switcher — run once per execution

WALLPAPER_DIR=~/Pictures/Wallpaper

# Pick a random image file
FILE=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Set wallpaper using swww with smooth transition
swww img "$FILE" \
  --transition-fps 144 \
  --transition-type center \
  --transition-duration 1.5

# Optionally run pywal and refresh themes
wal -i "$FILE"  --backend wal
# If you have Hyprland and Waybar color reload scripts:
# ~/.local/bin/wal-hyprland && hyprctl reload
# pkill waybar && waybar &

# Optional desktop notification
#notify-send "Wallpaper changed" "$(basename "$FILE")"
