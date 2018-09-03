#!/bin/sh
MONITOR=${1:-DP1}
xrandr --output eDP1 --primary --mode 1440x900 --pos 0x300 --rotate normal \
	--output $MONITOR --mode 1920x1200 --pos 1440x0 --rotate normal