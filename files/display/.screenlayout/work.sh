#!/bin/sh
xrandr --newmode  "1600x900_60.00"  118.25  1600 1696 1856 2112  900 903 908 934 -hsync +vsync
xrandr --addmode DP1 1600x900_60.00
xrandr --output VIRTUAL1 --off --output eDP1 --mode 1920x1080 --pos 1600x360 --rotate normal --output DP1 --mode 1600x900_60.00 --pos 0x0 --rotate normal --output HDMI2 --off --output HDMI1 --off --output VGA1 --off
