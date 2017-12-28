#!/bin/sh
xrdb ~/.Xresources
xset -b
export PATH="${PATH}:/home/nemo/.nvm/versions/node/v8.9.1/bin:/home/nemo/projects/scripts"
dbus-update-activation-environment --systemd DISPLAY
exec i3