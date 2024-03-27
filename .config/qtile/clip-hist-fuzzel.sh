#!/bin/sh

cliphist list | fuzzel --font="Fira Code" -d -w 64 -b 222222ff -C aa0000ff -s aa0000ff -S ffffffff -M ffff00ff -B 2 | cliphist decode | wl-copy
