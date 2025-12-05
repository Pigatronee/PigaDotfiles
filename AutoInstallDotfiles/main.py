import subprocess 
import sys  

core_packages = "packages.txt"
packages_extra = "packages_extra.txt"

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
    if required_only:
        return 
    with open (packages_extra, "r") as file:
        for line in file:
            for word in line.split():
                PACKAGES.append(word)

def main():
    result = ask_question("Would you like to install ALL required packages (recommended) or only the minimum? ")
    if result == 1:
        install_packages()
    elif result == 2:
        install_packages(required_only=True)
    else:
        print("Error, Invalid argument. The selection must be 1 or 2 ")
if __name__ == "__main__":
    main()
