#!/usr/bin/env python3
import os
import subprocess

current_activity = 0

def make_timeshift_backup():
    global current_activity
    db = True
    os.system("echo Making timeshift backup.")
    result = subprocess.run(["sudo", "timeshift", "--create"])
    if result.returncode == 0 and db:
        db = False
        print("Successfully created backup")
        current_activity = current_activity + 1
    else:
        current_activity = 2

def full_system_update():
    global current_activity
    db = True
    os.system("echo Attempting a full system update")
    result = subprocess.run(["sudo", "pacman", "-Syu", "--noconfirm"])
    if result.returncode == 0 and db:
        db = False
        print("Successfuly updated system! hopefully nothing breaks :)")
        current_activity = current_activity + 1
    else:
        current_activity = 2


def main():
    global current_activity
    while current_activity != 2:
        print("Current activity is: ",current_activity)
        if current_activity == 0:
            make_timeshift_backup()
        elif current_activity ==1:
            full_system_update()
    else:
        print("Script completed.")
        


if __name__ == "__main__":
    main()