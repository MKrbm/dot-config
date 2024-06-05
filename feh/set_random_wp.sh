#!/bin/bash

# Directory containing the wallpapers
WALLPAPERS_DIR="/home/keisuke/.config/feh/wallpapers"

# Check if the directory exists
if [[ ! -d "$WALLPAPERS_DIR" ]]; then
  echo "Directory $WALLPAPERS_DIR does not exist."
  exit 1
fi

# Find all .jpg files in the directory
wallpapers=("$WALLPAPERS_DIR"/*.jpg)

# Check if there are any .jpg files in the directory
if [[ ${#wallpapers[@]} -eq 0 ]]; then
  echo "No .jpg files found in the directory."
  exit 1
fi

# Select a random wallpaper
random_wallpaper=${wallpapers[RANDOM % ${#wallpapers[@]}]}

# Set the selected wallpaper using feh
feh --bg-scale "$random_wallpaper"

echo "Wallpaper set to $random_wallpaper"

