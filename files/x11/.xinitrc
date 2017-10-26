#!/bin/sh
xrdb ~/.Xresources
xset -b
export PATH="${PATH}:/home/nemo/.nvm/versions/node/v8.7.0/bin:/home/nemo/projects/scripts"
dbus-update-activation-environment --systemd DISPLAY
exec i3
