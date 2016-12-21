#!/bin/sh
xrdb ~/.Xresources
xset -b
export PATH="${PATH}:/home/nemo/.nvm/versions/node/v6.7.0/bin:/home/nemo/projects/scripts"
exec i3
