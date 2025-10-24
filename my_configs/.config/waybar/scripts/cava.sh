#!/usr/bin/env bash

# Characters representing amplitude levels
bar_chars="▁▂▃▄▅▆▇█"
dict="s/;//g;"

# Create sed dictionary to replace numbers (0-7) with bars
for i in $(seq 0 $((${#bar_chars} - 1))); do
  dict="${dict}s/$i/${bar_chars:$i:1}/g;"
done

# Temporary cava config
config_file="/tmp/waybar_cava_config"
cat > "$config_file" <<EOF
[general]
bars = 6

[input]
method = pulse
source = auto

[smoothing]
monstercat = 1
waves = 1

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
EOF

# Run cava and convert numeric output to bars, then wrap in JSON for Waybar
cava -p "$config_file" | while read -r line; do
  bars=$(echo "$line" | sed "$dict")
  printf '%s\n' "$bars"
done
