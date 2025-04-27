#!/bin/sh

entries="Logout\nSleep\nReboot\nShutdown"

selected=$(echo $entries | rofi -dmenu \
    -theme-str "window {width: 12em;} listview {lines: 4;}" \
    -p "Powermenu: ")

case $selected in
    "Logout")
        bspc quit;;
    "Sleep")
        systemctl suspend;;
    "Reboot")
        systemctl reboot;;
    "Shutdown")
        systemctl poweroff;;
esac
