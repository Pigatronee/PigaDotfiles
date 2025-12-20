#!/bin/bash

# 

# Paths
DOTFILES_PATH=$(pwd)/my_configs
CONFIG_PATH=$HOME/.config
CORE_PACKAGES_FILE="packages.txt"
EXTRA_PACKAGES_FILE="packages_extra.txt"

# Helper Functions
ask_question() {
    local msg=$1
    local options=$2
    echo "$msg"
    select answer in $options; do
        case $answer in
            1) return 0 ;;
            2) return 1 ;;
            *) echo "Invalid choice, please choose again." ;;
        esac
    done
}

install_packages() {
    echo "About to install packages from $CORE_PACKAGES_FILE and $EXTRA_PACKAGES_FILE..."
    
    # Read core packages
    PACKAGES=$(cat $CORE_PACKAGES_FILE)
    if [ "$1" != "required_only" ]; then
        # Read extra packages
        PACKAGES="$PACKAGES $(cat $EXTRA_PACKAGES_FILE)"
    fi
    
    echo "Packages to install: $PACKAGES"
    
    ask_question "Would you like to continue with the installation?" "[Yes, No]"
    if [ $? -eq 0 ]; then
        yay -S --needed $PACKAGES
    else
        echo "Aborting package installation."
    fi
}

merge_dotfiles() {
    echo "About to merge dotfiles from $DOTFILES_PATH to $CONFIG_PATH..."
    for folder in $(ls $DOTFILES_PATH); do
        folder_path="$DOTFILES_PATH/$folder"
        target_path="$CONFIG_PATH/$folder"
        
        if [ -d "$target_path" ]; then
            echo "$folder already exists in $CONFIG_PATH."
            ask_question "Do you want to delete it and copy the new one?" "[Yes, No]"
            if [ $? -eq 0 ]; then
                echo "Deleting existing $folder and copying new dotfiles..."
                rm -rf "$target_path"
                cp -r "$folder_path" "$CONFIG_PATH/"
            else
                echo "Skipping $folder."
            fi
        else
            echo "Copying $folder to $CONFIG_PATH..."
            cp -r "$folder_path" "$CONFIG_PATH/"
        fi
    done
}

replace_dotfiles() {
    echo "Warning: Replacing dotfiles can break things. Are you sure?"
    read -p "Type 'I am really stupid' to continue: " confirmation
    if [ "$confirmation" == "I am really stupid" ]; then
        echo "Replacing all dotfiles..."
        rm -rf $CONFIG_PATH/*
        cp -r $DOTFILES_PATH/* $CONFIG_PATH/
    else
        echo "Aborted dotfile replacement."
    fi
}

# Main Menu
echo "WARNING WARNING!!!!!!!!!!!!!!!!!\n DO NOT USE THIS SCRIPT!!!!!!!\n IT IS LLM SLOP AND I HAVE NOT MADE IT PROPERLY YET!!!!!!\n WHY IS IT HERE?? IDK!!! JUST DONT RUN IT PLS@!!!!!!!!!"
echo "What would you like to do?"
select choice in "Install packages" "Install dotfiles" "Quit"; do
    case $choice in
        "Install packages")
            ask_question "Install all required packages or only the minimum?" "[All, Minimum]"
            if [ $? -eq 0 ]; then
                install_packages
            else
                install_packages "required_only"
            fi
            ;;
        "Install dotfiles")
            ask_question "Would you like to replace your entire .config or merge it?" "[Replace, Merge]"
            if [ $? -eq 0 ]; then
                replace_dotfiles
            else
                merge_dotfiles
            fi
            ;;
        "Quit")
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid choice, please try again."
            ;;
    esac
done

