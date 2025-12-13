import subprocess
import threading

stay_open_duration = 1

def get_volume():
    result = subprocess.run(["pamixer", "--get-volume"], capture_output=True, text=True)
    return result.stdout.strip()

def open_eww():
    global bar_open
    if not bar_open:
        subprocess.run(["eww", "open", "volume-bar"])
        bar_open = True

def close_eww():
    global bar_open
    subprocess.run(["eww", "close", "volume-bar"])
    bar_open = False

def update_volume(vol):
    subprocess.run(["eww", "update", f"volume={vol}"])
    open_eww()

    # Cancel previous timer if it exists
    global close_timer
    if close_timer and close_timer.is_alive():
        close_timer.cancel()

    # Start a new 5-second timer to close the bar
    close_timer = threading.Timer(stay_open_duration, close_eww)
    close_timer.start()

current_volume = None
close_timer = None
bar_open = False

# Start listening for PulseAudio/pipewire events
proc = subprocess.Popen(["pactl", "subscribe"], stdout=subprocess.PIPE, text=True)

for line in proc.stdout:
    if "sink" in line.lower():
        vol = get_volume()
        if vol != current_volume:
            update_volume(vol)
            current_volume = vol

