#!/bin/zsh

dirs=(
  nvim
  htop
  kitty
  btop
  cava
  gh
  nvim
  fuzzel
  rofi
  rofi.Pigatronee
  waybar
  waypaper
  wlogout
  hypr
  hyprpanel
  eww
  background
  nwg-look
  swaync
)

for d in $dirs; do
  cp -r "$HOME/.config/$d" ./my_configs
done

