#!/bin/bash

# Directory to save screenshots
BASE_DIR="$HOME/Pictures/Screenshots"
PREVIOUS_FILE=""

# Function to take a screenshot
take_screenshot() {
    local timestamp=$(date +'%Y/%m/%d/%H_%M_%S')
    local dir=$(dirname "$BASE_DIR/$timestamp.png")
    mkdir -p "$dir"
    xfce4-screenshooter -f -s "$BASE_DIR/$timestamp.png"
    echo "$BASE_DIR/$timestamp.png"
}

# Ensure only one instance of the script is running
if pidof -o %PPID -x "$(basename "$0")"; then
    echo "Script is already running."
    exit 1
fi

# Take a screenshot every minute if the screen contents have changed
while true; do
    new_screenshot=$(take_screenshot)
    sleep 10
    if [ -f "$PREVIOUS_FILE" ] && cmp -s "$new_screenshot" "$PREVIOUS_FILE"; then
        rm "$new_screenshot"
    else
        PREVIOUS_FILE="$new_screenshot"
    fi
done
