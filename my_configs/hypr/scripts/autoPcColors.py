import os
import json
import subprocess

pywal_dir = "/home/Pigatronee/.cache/wal/colors.json"
pywal_dir_kitty = "/home/Pigatronee/.cache/wal/colors-kitty.conf"
pywal_dir_kitty = os.path.expanduser(pywal_dir_kitty)

def get_kitty_colors(kitty_colors_path, colorType: str):
    colors = {}
    with open(kitty_colors_path, "r") as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            if " " in line:
                key, value = line.split(None, 1)
                colors[key] = value
    return colors[colorType]

def set_pc_color(color: str):
    if color[0] == "#":
        color = color.replace("#", "")

    subprocess.run(["openrgb","--color", color])

def main():
    with open(pywal_dir) as f:
        dictionary = json.load(f)
    
    color = get_kitty_colors(pywal_dir_kitty, "background")
    #color = dictionary["colors"]["color4"]

    set_pc_color(color)

if __name__ == "__main__":
    main()
