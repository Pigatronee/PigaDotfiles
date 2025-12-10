import subprocess 
import sys 
import os
import shutil
from pathlib import Path 

path = Path(__file__).resolve().parents[1]
dotfiles_path = path / "my_configs" / ".config"
config_path = Path.home() / ".config"
print("Dotfiles located at "+ str(dotfiles_path))
print(".config located at "+ str(config_path))
print(" -------------------------------\n WARNING! \n only use this script if you know what it does!\n Also, make sure to back up your config folder before using, just to be on the safe side :p\n ---------------------------")

core_packages = "packages.txt"
packages_extra = "packages_extra.txt"

def error():
    print("Error, Invalid argument. The selection must be 1 or 2 ")

def ask_question(msg: str, _should_be_y_n = False):
    if not _should_be_y_n:
        answer = int(input(msg + " [1]/[2]: "))
    else:
        answer = str(input(msg + " [y]/[n]: "))
    if answer in (1,"y"):
        return 1
    elif answer in (2,"n"):
        return 2
    elif answer == "q":
        main
    else:
        return 0 
         

def install_packages(required_only: bool = False):
    PACKAGES = [] 
    with open (core_packages, "r") as file:
        for line in file:
            for word in line.split():
                PACKAGES.append(word)
    if not required_only:
        with open (packages_extra, "r") as file:
            for line in file:
                for word in line.split():
                    PACKAGES.append(word)
    # Actually install the packages 
    print("\nAbout to run command:\n yay -S --needed " + " ".join(PACKAGES))
    if ask_question("\nWould you like to continue? 1= yes 2= no \n ") == 1:
        subprocess.run(["yay", "-S", "--needed"] + PACKAGES)
def merge_dotfiles():
    for folder in os.listdir(dotfiles_path):
        # delete files that already exist in your current config
        if folder in os.listdir(config_path):
            answer = ask_question(f"{folder} is also in .config. Would you like to Delete it?", _should_be_y_n = True)
            if answer == 1:
                full_path = config_path / folder
                print(f"removing path {full_path}")
                try:
                    shutil.rmtree(full_path)
                except:
                    print(f"Could not remove directory {full_path}, aborting.")
                    main()
            # copy files over
            src = dotfiles_path / folder
            dst = config_path 
            try:
                shutil.copytree(src, dst)
            except:
                print(f"Could not copy directory {src} to {dst}, aborting.")
                main()

def replace_dotfiles():
    print("I told you not to do this bro.")

def install_packages_cli():
    # Ask what packages you would like to install
    result = ask_question("Would you like to install ALL required packages (recommended) or only the minimum? ")
    if result == 1:
        install_packages()
    elif result == 2:
        install_packages(required_only=True)
    else:
       error()

def install_dotfiles_cli():
    # Ask if you would like to replace your current .config or merge your current .config 
    result = ask_question("Would you like to replace your entire .config with these dotfiles (Don't do this) or merge your .config with these dotfiles? ")
    if result == 1:
        replace_dotfiles()
    elif result == 2:
        merge_dotfiles()
    else:
        error()

def main():
    print("What would you like to do?")
    answer = int(input("1: Install packages\n2: install dotfiles\n3: quit\nAnswer here: "))

    if answer == 1:
        install_packages_cli()
    elif answer == 2:
        install_dotfiles_cli()
    elif answer == 3:
        sys.exit()
    else:
        print(f"Invalid argument '{answer}'")

if __name__ == "__main__":
    main()
