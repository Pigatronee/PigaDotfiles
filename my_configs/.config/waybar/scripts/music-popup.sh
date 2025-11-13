#!/usr/bin/env bash

# Example: popup to control music via playerctl
yad --title="Music Controls" \
    --undecorated \
    --skip-taskbar \
    --center \
    --buttons-layout=spread \
    --button=" Play":"playerctl play" \
    --button=" Pause":"playerctl pause" \
    --button=" Next":"playerctl next" \
    --button=" Prev":"playerctl previous" \
    --button=" Stop":"playerctl stop"

