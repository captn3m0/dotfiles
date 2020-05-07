#!/bin/sh
xrdb ~/.Xresources
xset -b
setxkbmap -option ctrl:nocaps
xmodmap -e 'clear lock'
xmodmap -e 'keycode 66 = Hyper_L'
export PATH="${PATH}:/home/nemo/projects/scripts"
dbus-update-activation-environment --systemd DISPLAY
exec i3
