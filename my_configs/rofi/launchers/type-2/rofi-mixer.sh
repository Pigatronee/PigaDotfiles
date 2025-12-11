#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
##
## Rofi Audio Launcher (rofi-mixer)

dir="$HOME/.config/rofi/launchers/type-1"
theme='style-3'

# Run rofi-mixer in windowed mode on current workspace
rofi-mixer -show -theme "${dir}/${theme}.rasi" -no-fullscreen -lines 10 -columns 1

