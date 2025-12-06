import subprocess 
import sys  
from pathlib import Path 

path = Path(__file__).resolve().parents[1]
dotfiles_path = path / "my_configs" / ".config"
print("Dotfiles located at "+ str(dotfiles_path))

core_packages = "packages.txt"
packages_extra = "packages_extra.txt"

def error():
    print("Error, Invalid argument. The selection must be 1 or 2 ")

def ask_question(msg: str):
    answer = int(input(msg + " [1]/[2]: "))
    if answer == 1:
        return 1
    elif answer == 2:
        return 2
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
    pass

def replace_dotfiles():
    pass 

def main():
    # Ask what packages you would like to install
    result = ask_question("Would you like to install ALL required packages (recommended) or only the minimum? ")
    if result == 1:
        install_packages()
    elif result == 2:
        install_packages(required_only=True)
    else:
       error() 

    # Ask if you would like to replace your current .config or merge your current .config 
    result = ask_question("Would you like to replace your entire .config with these dotfiles or merge your .config with these dotfiles? ")
    if result == 1:
        replace_dotfiles()
    elif result == 2:
        merge_dotfiles()
    else:
        error()

if __name__ == "__main__":
    main()
