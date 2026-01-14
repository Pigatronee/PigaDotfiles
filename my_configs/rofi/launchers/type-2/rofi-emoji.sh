#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
##
## Rofi Emoji Launcher (rofi-mixer)

dir="$HOME/.config/rofi/launchers/type-2"
theme='style-2'

# Run rofi-mixer in windowed mode on current workspace
#rofi-mixer -show -theme "${dir}/${theme}.rasi" -no-fullscreen -lines 10 -columns 1
rofi \
    -show emoji \
    -theme ${dir}/${theme}.rasi \
	-lines 10 -columns 2

