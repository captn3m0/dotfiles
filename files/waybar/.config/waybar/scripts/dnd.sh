#!/bin/bash
# Prints waybar JSON for mako do-not-disturb; "toggle" flips it first
[ "$1" = toggle ] && { makoctl mode -t do-not-disturb >/dev/null; pkill -RTMIN+9 -x waybar; }
if makoctl mode 2>/dev/null | grep -qx do-not-disturb; then
  printf '{"alt":"dnd","class":"dnd","tooltip":"Do not disturb: on (click to toggle)"}\n'
else
  printf '{"alt":"normal","tooltip":"Notifications: on (click for do not disturb)"}\n'
fi
exit 0
