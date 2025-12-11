import json
import subprocess

pywal_dir = "/home/Pigatronee/.cache/wal/colors.json"

def set_pc_color(color: str):
    if color[0] == "#":
        color = color.replace("#", "")

    subprocess.run(["openrgb","--color", color])

def main():
    with open(pywal_dir) as f:
        dictionary = json.load(f)
    color = dictionary["colors"]["color6"]
    set_pc_color(color)

if __name__ == "__main__":
    main()
