#!/bin/bash
# switch_audio.sh
# Usage: ./switch_audio.sh <sink_name_or_partial_description>

if [ -z "$1" ]; then
    echo "Usage: $0 <sink_name_or_description>"
    exit 1
fi

SINK_DESC="$1"

#!/bin/bash
# ~/bin/rofi-mixer-switch.sh
# Make sure ~/bin is in your PATH

SINK_DESC=$(rofi-mixer)  # This will output the selected sink's description
[ -z "$SINK_DESC" ] && exit 0

# Get full sink name
SINK=$(pactl list sinks short | grep -i "$SINK_DESC" | awk '{print $2}' | head -n1)
[ -z "$SINK" ] && exit 1

# Set default sink
pactl set-default-sink "$SINK"

# Move all current streams
for si in $(pactl list short sink-inputs | awk '{print $1}'); do
    pactl move-sink-input "$si" "$SINK"
done

