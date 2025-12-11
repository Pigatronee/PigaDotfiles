#!/bin/bash

if pgrep -x " nm-connection-editor " > /dev/null; then
    # If running, kill all instances
    killall  nm-connection-editor 
else
    # If not running, start it in the background
    nm-connection-editor &
fi
