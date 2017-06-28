#!/bin/sh
xrdb ~/.Xresources
xset -b
export PATH="${PATH}:/home/nemo/.nvm/versions/node/v8.0.0/bin:/home/nemo/projects/scripts"
exec i3
