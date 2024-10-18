#!/bin/bash

# Directory to save screenshots
BASE_DIR="$HOME/Pictures/Screenshots"
PREV_SCREENSHOT="/tmp/prev_screenshot.png"

# Function to take a screenshot
take_screenshot() {
    local timestamp=$(date +'%Y/%m/%d/%H_%M_%S_%3N')
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
    if [ -f "$PREV_SCREENSHOT" ]; then
        if compare -metric AE "$PREV_SCREENSHOT" "$new_screenshot" null: 2>/dev/null; then
            rm "$new_screenshot"
        else
            cp "$new_screenshot" "$PREV_SCREENSHOT"
            pngquant --force --ext .png "$new_screenshot"
        fi
    else
        cp "$new_screenshot" "$PREV_SCREENSHOT"
        pngquant --force --ext .png "$new_screenshot"
    fi
done
