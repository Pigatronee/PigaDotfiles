#!/usr/bin/env bash


while true; do
  if xdotool getmouselocation --shell | grep -q "WINDOW=$(xdotool search --name 'waybar')"; then
    ~/.config/waybar/scripts/music_popup.sh &
    sleep 3
  fi
  sleep 0.2
done

