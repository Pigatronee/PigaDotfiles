#!/usr/bin/env bash

# Check if pavucontrol is running
if pgrep -x "pavucontrol" > /dev/null; then
    # If running, kill all instances
    killall pavucontrol
else
    # If not running, start it in the background
    pavucontrol &
fi
