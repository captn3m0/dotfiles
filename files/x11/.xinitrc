#!/bin/sh
xrdb ~/.Xresources
xset -b
export PATH="${PATH}:/home/nemo/projects/scripts"
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export LC_TIME=en_IN.UTF-8
export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8
export LC_COLLATE=en_IN.UTF-8
setxkbmap -option ctrl:nocaps
xmodmap -e 'clear lock'
xmodmap -e 'keycode 66 = Hyper_L'
export PATH="${PATH}:/home/nemo/projects/scripts"
dbus-update-activation-environment --systemd DISPLAY
exec i3
