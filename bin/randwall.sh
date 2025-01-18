#!/bin/sh

wall=$(find ~/Pictures/Wallpapers -type f -not -name ".DS_Store" | shuf -n 1)
echo $wall
swaybg -i "$wall" -m fill &
