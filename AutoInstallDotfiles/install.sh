#!/bin/bash

# Variablesz
packages_requried=("hyprland" "waybar" "waypaper" "wlogout" "xsettingsd" "rofi" "fuzzel" "kitt" "python-pywal16-git")
packages_extra=("cava" "pavucontrol" "nwg-look" "eww" "fuzzel" "swww" "xdg-desktop-portal-hyprland" "htop" "vesktop-bin" "librewolf-bin" "godot" "nvim" "nextcloud" "steam" "ly" "nautilus" "playerctl" "pamixer" "dotool" "swaync-client" "hypremoji" "zoxide" "python-pywalfox")

combined_packages=("${packages_requried[@]}" "${packages_extra[@]}")

dotfiles_location="../my_configs"
zsh_location="../zsh/.zshrc"

# Prompt
clear
echo "What would you like to do?"
echo "[1]: Install dependencies"
echo "[2]: Install dotfiles"
echo "[3]: Make all python and shell scripts executable"
echo -n "[1]/[2]/[3]: "
read -r answer

install_dependencies_cli() {
	clear 
	echo "Do you want to install the *extremely recommended* extra packages too?"
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

install_dotfiles_cli() {
	clear 
	echo "What would you like to do"
	echo "[1]: Merge these dotfiles with your current setup"
	echo "[2]: Replace your entire config folder with only these (NOT RECOMMENDED)"
	echo -n "[1]/[2]: "
	read -r answer
	
	if [ "$answer" -eq 1 ]; then
		echo "Merging....."
		mkdir -p ~/.config
		cp -r "$dotfiles_location"/* ~/.config
		cp "zsh_location" ~/
	elif [ "$answer" -eq 2 ]; then
		echo "Warning the option you just selected will completely overide your ~/.config folder"
		echo -n "If you still want to continue type this: 'I am really stupid': "
		read -r answer 
		if [ "$answer" == "I am really stupid" ]; then 
			echo "You asked for this :c"
			rm -rf ~/.config
			mkdir -p  ~/.config
			cp -r "$dotfiles_location"/* "/home/$USER/.config"  
		else
			install_dotfiles_cli
		fi 
	else 
		echo "Invalid option."
		install_dependencies_cli
	fi


}

# Make scripts executable 
make_scripts_executable_cli() {
	clear
	echo "What would you like to do"
	echo "[1]: Make scripts in the git repo executable"
	echo "[2]: Make scripts in your config folder executable (WARNING! Im bad at programming so this will go recursively through your ~.config) "
	echo -n "[1]/[2]: "
	read -r answer
	
	if [ "$answer" -eq 1 ]; then
		echo "Here we gooo....."
		#chmod +x "$dotfiles_location"/*.sh 
		#chmod +x "$dotfiles_location"/*.py
		find "$dotfiles_location" -type f \( -name "*.sh" -o -name "*.py" \) -exec chmod +x {} +	
	fi 
	if [ "$answer" -eq 2 ]; then
		echo "Here we gooo....."
		#chmod +x "$dotfiles_location"/*.sh 
		#chmod +x "$dotfiles_location"/*.py
		sudo find ~/.config/ -type f \( -name "*.sh" -o -name "*.py" \) -exec chmod +x {} +
	fi
}


# MAIN

# Check what to do 
if [ "$answer" -eq 1 ]; then
	echo "Installing dependencies..."
	install_dependencies_cli
elif [ "$answer" -eq 2 ]; then
	echo "Installing dotfiles..."
	install_dotfiles_cli
elif [ "$answer" -eq 3 ]; then
	echo "Making scripts executable"
	make_scripts_executable_cli	
else 
	echo "Invalid option."
fi



