# xfce-auto-screenshot
Create screenshots every 10sec on xfce for accountability purposes.

## Why?
This is part of a larger initiative to add accountability to my digital life. Additionally, it has been occasionally useful to have access to old screen states for data-loss prevention. Also, as someone with ADHD, it's good to be aware of where my time went after "zoning out". Potentially, in the age of LLMs, this is going to serve even more benefit where we can elicit help on organizing our digital lives from LLMs by giving them access to our digital history (note: always use local LLMs for this, never commercial ones!).

I have a similar script running on my Android phone, see: https://github.com/SimonBaars/magisk-auto-screenshot

## Features
- Multi-screen support
- Runs in the background
- Avoids multiple instances
- Compresses images (a full day of use takes +/- 1GB, it would be double that without compression)

## Requirements
- An Arch-based Linux system running XFCE desktop (probably works on Debian and other desktops with minor changes)
- Pngquant: `sudo pacman -S pngquant`
- ImageMagick: `sudo pacman -S imagemagick`

## Installation
- Move `screenshot.sh` to `~/scripts/screenshot.sh`
- `chmod +x ~/scripts/screenshot.sh`
- Move `screenshot.desktop` to `~/.config/autostart/screenshot.desktop` (now the program will autostart when you boot your system)
- `sh ~/scripts/screenshot.sh &`
- Check `~/Pictures/Screenshots`, screenshots should appear
