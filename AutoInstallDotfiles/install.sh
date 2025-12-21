#!/bin/bash

# Variablesz
packages_requried=("hyprland" "waybar" "waypaper" "wlogout" "xsettingsd" "rofi" "fuzzel" "kitt" "python-pywal16-git")
packages_extra=("cava" "pavucontrol" "nwg-look" "eww" "fuzzel" "swww" "xdg-desktop-portal-hyprland" "htop" "vesktop" "firefox" "godot" "nvim" "nextcloud" "steam" "ly" "nautilus" "playerctl" "pamixer" "dotool")

combined_packages=("${packages_requried[@]}" "${packages_extra[@]}")

# Prompt
clear
echo "What would you like to do?"
echo "[1]: Install dependencies"
echo "[2]: Install dotfiles"
echo -n "[1]/[2]: "
read -r answer

install_dependencies_cli() {
	clear 
	echo "Do you want to install the extremely recommended extra packages too?"
	echo -n "[y]/[n]: "
	read -r answer
	
	if [ "$answer" == "y" ]; then
		echo "Ok you made the right choice :p"
		yay -S --needed "${combined_packages[@]}"
	elif [ "$answer" == "n" ]; then
		echo "bruh ok"
		yay -S --needed "${packages_requried[@]}"
	else 
		echo "Invalid option."
		install_dependencies_cli
	fi

}


# MAIN

# Check what to do 
if [ "$answer" -eq 1 ]; then
	echo "Installing dependencies..."
	install_dependencies_cli
elif [ "$answer" -eq 2 ]; then
	echo "Installing dotfiles..."
else 
	echo "Invalid option."
fi



