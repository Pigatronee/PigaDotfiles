#!/usr/bin/env python3

import os 
import sys
import shutil
import tkinter as tk
from tkinter import filedialog, messagebox

game_folder = "/home/Pigatronee/.steam/steam/steamapps/compatdata"

game_data = {4126462452 : "DELTARUNE", 3611883891 : "Marvel's Spider-Man 2"}

found_games = []

state = 0

root = tk.Tk()

def find_folder_contents():
    global game_folder
    global found_games
    for file in os.listdir(game_folder):
        found_games.append(file)
    print("Found files: ", found_games)
    match_folder_contents()

def match_folder_contents():
    global found_games
    global game_data
    for game_id in found_games:
        if int(game_id) in game_data:
            game_name = game_data[int(game_id)]
            print(game_id, "is in gamedata and the name is", game_name)
            show_tkinter_prompt1(game_id, game_name)


def find_save_folder(game_id, game_name):
    global game_data
    db = True
    game_file_folder = f"/home/Pigatronee/.steam/steam/steamapps/compatdata/{str(game_id)}/pfx/drive_c/users/steamuser/AppData/Local/{str(game_name)}"
    for file in os.listdir(game_file_folder):
        print("file found: ", file)
        if db:
            db = False
            for widget in root.winfo_children():
                widget.destroy()
        show_tkinter_file_contents(file)
    return game_file_folder


def show_tkinter_prompt1(game_id, game_name):
    print("found game for button", game_name)
    button = tk.Button(root, text=game_name, command=lambda g=game_name:  on_game_button_clicked(game_id, g))
    button.pack(pady=5)

def show_tkinter_file_contents(file):
    label = tk.Label(root, text=str(file))
    label.pack(pady=5)

def on_game_button_clicked(game_id, game_name):
    print(str(game_name), " was clicked")
    find_save_folder(game_id, game_name)
    destination_folder = filedialog.askdirectory(title=f"Select Directory to copy contents of {game_name} save folder to ")
    source_folder = find_save_folder(game_id, game_name)
    copy_files_to_destination(source_folder, destination_folder)

def copy_files_to_destination(source_folder, destination_folder):
    for item in os.listdir(source_folder):
        s = os.path.join(source_folder, item)
        d = os.path.join(destination_folder, item)
        if os.path.isdir(s):
            shutil.copytree(s, d, dirs_exist_ok=True)
        else:
                shutil.copy2(s, d)
    messagebox.showinfo("Success", f"Files copied to {destination_folder}")
    sys.exit()

def main():
    find_folder_contents()

if __name__ == "__main__":
    root.after(0, main)

root.mainloop()