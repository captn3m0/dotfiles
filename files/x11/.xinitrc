#!/bin/sh
xrdb ~/.Xresources
xset -b
export PATH="${PATH}:/home/nemo/projects/scripts"
dbus-update-activation-environment --systemd DISPLAY
exec i3