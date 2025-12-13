import subprocess

def get_volume():
    # Use pamixer or pactl to get the current volume
    result = subprocess.run(["pamixer", "--get-volume"], capture_output=True, text=True)
    return result.stdout.strip()

def update_eww(volume):
    subprocess.run(["eww", "update", f"volume={volume}"])

current_volume = None

# Start listening for PulseAudio/pipewire events
proc = subprocess.Popen(["pactl", "subscribe"], stdout=subprocess.PIPE, text=True)

for line in proc.stdout:
    if "sink" in line.lower():
        vol = get_volume()
        if vol != current_volume:
            update_eww(vol)
            current_volume = vol

