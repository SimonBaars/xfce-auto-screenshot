# XFCE Auto Screenshot
Create screenshots every 10sec on XFCE desktops for accountability purposes.

## Why?
This is part of a larger initiative to add accountability to my digital life. Additionally, it has been occasionally useful to have access to old screen states for data-loss prevention. Also, as someone with ADHD, it's good to be aware of where my time went after "zoning out".

I have a similar script running on my Android phone, see: https://github.com/SimonBaars/magisk-auto-screenshot

## Features
- Multi-screen support
- Runs in the background
- Avoids multiple instances

## Requirements
- An Arch-based Linux system running XFCE desktop (probably works on Debian and other desktops with minor changes)
- 
## Installation
- Move `screenshot.sh` to `~/scripts/screenshot.sh`
- `chmod +x ~/scripts/screenshot.sh`
- Change `$HOME` in `screenshot.desktop` to your actual home folder (the OS doesn't always replace env variables correctly)
- Move `screenshot.desktop` to `~/.config/autostart/screenshot.desktop` (now the program will autostart when you boot your system)
- `sh ~/scripts/screenshot.sh &`
- Check `~/Pictures/Screenshots`, screenshots should appear
