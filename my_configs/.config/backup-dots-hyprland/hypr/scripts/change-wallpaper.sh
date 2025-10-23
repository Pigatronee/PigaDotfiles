#!/bin/bash
WALLPAPER_DIR=~/Pictures/Wallpaper
INTERVAL=300  # time in seconds (5 minutes)

FILE=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
swww img "$FILE" 

while true; do
    FILE=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
    swww img "$FILE" --transition-fps 144 --transition-type center --transition-duration 1.5
    sleep "$INTERVAL"
done
