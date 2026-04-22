#!/bin/bash
# ~/.config/hypr/wallpaper.sh

# Wallpaper Selector/Updater using Wofi.

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

choice=$(find "${WALLPAPER_DIR}" -type f \( -iname "*.jpg" -o -iname "*.png" \) | wofi --show dmenu --prompt "Select Wallpaper:")

if [ -n "$choice" ]; then
    awww img "$choice" --transition-type any --transition-fps 60 --transition-duration .5
    
    wal -i "$choice" -n --cols16
    wal -w
    
    cp "$choice" ~/Pictures/WP_smoking-mocha.png
    
    pywalfox update
    swaync-client --reload-css
    pkill -SIGUSR2 waybar # Faster than a full restart
    
    notify-send -a "SYSTEM" "Environment Updated" "Colorscheme synced to $(basename "$choice")"
fi

