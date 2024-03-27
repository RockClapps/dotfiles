#!/bin/sh

/usr/lib/polkit-kde-authentication-agent-1 &
mako &
waybar &
nm-applet --indicator &
blueman-applet &
wlsunset -l 42.72 -L -73.68 &
wl-paste --watch cliphist store  &
cliphist wipe &

swayidle before-sleep 'swaylock -c 222222' &
swayidle timeout 1800 'systemctl suspend' &
swayidle timeout 1500 'brightnessctl -s set 10%' resume 'brightnessctl -r' &

sleep 4s
bluetoothctl power off &
