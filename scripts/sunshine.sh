#!/bin/bash

kscreen-doctor output.eDP-2.mode.1920x1080@60
nmcli device modify wlp6s0 wifi.powersave 2
systemctl restart NetworkManager
DRI_PRIME=1 sunshine
kscreen-doctor output.eDP-2.mode.1920x1200@165
nmcli device modify wlp6s0 wifi.powersave 3
systemctl restart NetworkManager
